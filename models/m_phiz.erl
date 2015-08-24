-module(m_phiz).
-author("kirill.sysoev@gmail.com").

-behaviour(gen_model).

%% interface functions
-export([
    m_find_value/3,
    m_to_list/2,
    m_value/2
]).

-include_lib("zotonic.hrl").


m_find_value(_V, _VV, _Context) ->
    [_V,_VV,"m_onnet_find_value_mismatch"].

m_to_list(_V, _Context) ->
    [_V,"m_to_list"].

m_value(#m{value=V}, _Context) -> V.

