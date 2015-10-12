-module(phiz).
-author("kirill.sysoev@gmail.com").

-mod_title("OnNet website").
-mod_description("OnNet connunications inc. website").
-mod_prio(10).

-export([
     event/2
    ,observe_search_query/2
    ,observe_postback_notify/2
 %  ,observe_onnet_menu/3
]).

-include_lib("zotonic.hrl").

observe_search_query(A, _Context) ->
    lager:info("Catched observe search query: ~p", [A]),
    undefined.

observe_postback_notify(A, _Context) ->
    lager:info("Catched postback notify: ~p", [A]),
    undefined.

event({postback, choose_number_next, _TriggerId, _TargetId}, Context) ->
    case z_context:get_q_all("chosennumbers",Context) of
        [] ->
           z_render:growl_error(?__("At least one number should be choosen",Context), Context);
         _ ->
           z_render:wire([{add_class, [{target, "choose_number_div"}, {class, "hide"}]}, {remove_class, [{target, "contact_info_div"}, {class, "hide"}]}], Context)
    end;

event({postback, contact_info_next, _TriggerId, _TargetId}, Context) ->
  try
    ok = phiz_util:check_field_filled("surname",Context),
    ok = phiz_util:check_field_filled("firstname",Context),
    ok = phiz_util:check_field_filled("middlename",Context),
    ok = phiz_util:check_field_filled("contactphone",Context),
    ok = phiz_util:check_field_filled("contactemail",Context),
    {{ok, _}, _} = validator_base_format:validate(format, 1, z_context:get_q_all("contactphone",Context), [false,"^[-+0-9 ()]+$"], Context),
    {{ok, _}, _} = validator_base_email:validate(email, 2, z_context:get_q_all("contactemail",Context), [], Context),
    z_render:wire([{add_class, [{target, "contact_info_div"}, {class, "hide"}]}, {remove_class, [{target, "counterparty_div"}, {class, "hide"}]}], Context)
  catch
    error:{badmatch,{{error, 1, invalid}, _}} -> z_render:growl_error(?__("Incorrect Contact phone field",Context), Context);
    error:{badmatch,{{error, 2, invalid}, _}} -> z_render:growl_error(?__("Incorrect Email field",Context), Context);
    error:{badmatch, _} -> z_render:growl_error(?__("All fields should be filled in",Context), Context);
    _:_ -> z_render:growl_error(?__("All fields should be correctly filled in",Context), Context)
  end;

event({submit,{phizauth,[]},_,_}, Context) ->
    Login = z_convert:to_binary(z_context:get_q("username",Context)),
    Password = z_convert:to_binary(z_context:get_q("password",Context)),
    case z_convert:to_binary(z_context:get_q("account",Context)) of
        <<>> ->
            case lb_auth:sign_in(Context) of
                {ok, AuthContext} ->
                    lager:info("User ~p authenticated", [z_context:get_q("username", Context)]),
                    z_render:wire({redirect, [{dispatch, "dashboard"}]}, AuthContext);
                {sign_in_failed} ->
                    lager:info("Failed to authenticate user ~p", [z_context:get_q("username", Context)]),
                    z_render:growl_error(?__("Auth failed.", Context), Context)
            end;
        Account -> modkazoo_auth:do_sign_in(Login, Password, Account, Context)
    end;

event({submit,{forgottenpwd,[]},_,_}, Context) ->
    Username = z_convert:to_binary(z_context:get_q("forgotten_username",Context)),
    NumberOrName = modkazoo_util:normalize_account_name(z_context:get_q("forgotten_account_name",Context)),
    AccountName = case kazoo_util:kz_admin_find_accountname_by_number(NumberOrName, Context) of
        'undefined' -> NumberOrName;
         NameFound -> NameFound
    end,
    case kazoo_util:password_recovery(Username, AccountName, Context) of
        <<"">> ->
            case lb_util:maybe_send_passwd(Context) of
                'false' -> z_render:growl_error(?__("No account found",Context), Context);
                _ ->
                     Context2 = z_render:dialog_close(Context),
                     z_render:growl(?__("Password sent. Please check your mailbox.",Context2), Context2)
            end;
        Answer ->
            Context1 = z_render:wire([{set_class, [{target, "forgot-pwd-box"},{class,"search-box hidden"}]}], Context),
            z_render:growl(?__("Please check your mailbox", Context1), Context1)
    end;

event(A, Context) ->
    lager:info("Unknown event A: ~p", [A]),
    lager:info("Unknown event variables: ~p", [z_context:get_q_all(Context)]),
    lager:info("Unknown event Context: ~p", [Context]).

