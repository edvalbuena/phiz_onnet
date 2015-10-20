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
    ?DEBUG(z_context:get_q("caller_id_number",Context)),
  %  lager:info("Post ReqData: ~p",[ReqData]),

    DataBag = {[{<<"ticket">>,
                 {[{<<"subject">>, <<(?__("Incoming call from", Context))/binary, ": ", (modkazoo_util:get_q_bin("caller_id_number",Context))/binary>>},
                   {<<"comment">>, {[{<<"body">>,<<"The income is very big.">>}]}}
                 ]}
              }]},

    Payload = jiffy:encode(DataBag),

    URL = "https://qqq96.zendesk.com/api/v2/tickets.json",

    {'ok', _, _, Body} = ibrowse:send_req(URL
                                         ,[{"Content-Type", "application/json"}]
                                         ,'post'
                                         ,Payload
                                         ,[{'basic_auth', {z_context:get_q("username",Context), z_context:get_q("password",Context)}},{'inactivity_timeout', 10000}]),

    lager:info("Body: ~p",[io_lib:format("~p",[Body])]),

    Response = [{result, <<"OK">>}],
    z_convert:to_json(Response).

