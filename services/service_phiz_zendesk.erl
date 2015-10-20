-module(service_phiz_zendesk).
-author("Kirill Sysoev").
-svc_title("Zendesk mediator.").
-svc_needauth(false).

-export([process_get/2]).
-export([process_post/2]).

-include_lib("zotonic.hrl").

process_get(ReqData, Context) ->
    Id = z_context:get_q("id", Context),
    Response = [{result, Id}],
    z_convert:to_json(Response).

process_post(_ReqData, Context) ->
    ?DEBUG(z_context:get_q_all(Context)),
  %  lager:info("Post ReqData: ~p",[ReqData]),

    DataBag = {[{<<"ticket">>,
                 {[{<<"subject">>, <<(?__("Incoming call from", Context))/binary, ": ", (modkazoo_util:get_q_bin("caller_id_number",Context))/binary>>},
                   {<<"comment">>, {[{<<"body">>,<<"The income is very big.">>}]}}
                 ]}
              }]},

    {'ok', _, _, Body} = ibrowse:send_req(z_context:get_q("api_url",Context)
                                         ,[{"Content-Type", "application/json"}]
                                         ,'post'
                                         ,jiffy:encode(DataBag)
                                         ,[{'basic_auth', {z_context:get_q("username",Context), z_context:get_q("password",Context)}},{'inactivity_timeout', 10000}]),

    Response = [{result, <<"OK">>}],
    z_convert:to_json(Response).

