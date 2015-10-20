-module(service_phiz_zendesk).
-author("Kirill Sysoev").
-svc_title("Zendesk mediator.").
-svc_needauth(false).

-export([process_get/2]).
-export([process_post/2]).

-include_lib("zotonic.hrl").

-define(EXTERNAL_ID,<<"external_id=">>).

process_get(ReqData, Context) ->
    ?DEBUG(z_context:get_q_all(Context)),
    {ClientIP, _} = webmachine_request:peer(z_context:get_reqdata(Context)),
    ?DEBUG(ClientIP),
    Id = z_context:get_q("id", Context),
    z_convert:to_json([{result, "OK"}]).

process_post(_ReqData, Context) ->
    case z_context:get_q("call_direction",Context) of
        "inbound" -> may_be_add_zendesk_ticket(Context);
        _ -> 'ok'
    end,
    z_convert:to_json([{result, "OK"}]).

may_be_add_zendesk_ticket(Context) ->
    _ = timer:sleep(crypto:rand_uniform(1, 10000)),
    {'ok',_,_,Body} = ibrowse:send_req(z_context:get_q("api_url",Context) ++ "?external_id=" ++ z_context:get_q("call_id",Context)
                                         ,[{"Content-Type", "application/json"}]
                                         ,'get'
                                         ,[]
                                         ,[{'basic_auth', {z_context:get_q("username",Context), z_context:get_q("password",Context)}},{'inactivity_timeout', 10000}]),
    case modkazoo_util:get_value(<<"count">>,jiffy:decode(Body)) of
        0 -> add_zendesk_ticket(Context);
        _ -> 'ok'
    end.

add_zendesk_ticket(Context) ->
    DataBag = {[{<<"ticket">>,
                 {[{<<"subject">>, <<(?__("Incoming call from", Context))/binary, ": ", (modkazoo_util:get_q_bin("caller_id_number",Context))/binary>>},
                   {<<"external_id">>, modkazoo_util:get_q_bin("call_id",Context)},
                   {<<"comment">>, {[{<<"body">>,<<(?__("Incoming call from", Context))/binary, ": ", (modkazoo_util:get_q_bin("caller_id_number",Context))/binary>>}]}}
                 ]}
              }]},
    ibrowse:send_req(z_context:get_q("api_url",Context)
                    ,[{"Content-Type", "application/json"}]
                    ,'post'
                    ,jiffy:encode(DataBag)
                    ,[{'basic_auth', {z_context:get_q("username",Context), z_context:get_q("password",Context)}},{'inactivity_timeout', 10000}]).
