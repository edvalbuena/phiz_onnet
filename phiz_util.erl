-module(phiz_util).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

%% interface functions
-export([check_field_filled/2
    ,check_file_size_exceeded/3
    ,book_numbers/3
    ,book_numbers_by_context/1
    ,accounts_table/3
]).



check_field_filled(Field, Context) ->
    case z_context:get_q(Field, Context) of
        [] ->
           false;
        undefined ->
           false;
         _ ->
           ok
    end.

check_file_size_exceeded(Id, FileName, MaxSize) ->
    case filelib:file_size(FileName) > MaxSize of
        false ->
            false;
        true ->
            {true, Id}
    end.

book_number(Number, [], Context) ->
   book_number(Number, <<"New Customer">>, Context);
book_number(Number, CustomerName, Context) ->
   [Num|_] = re:split(Number, [":"], [{return, 'binary'}]),
   lb:book_number(Num, z_convert:to_binary(CustomerName), Context).

book_numbers([], _CustomerName, _Context) ->
    'ok';
book_numbers([Number|Numbers], CustomerName, Context) ->
    book_number(Number, CustomerName, Context),
    book_numbers(Numbers, CustomerName, Context);
book_numbers(Number, CustomerName, Context) ->
    book_number(Number, CustomerName, Context).

book_numbers_by_context(Context) ->
    PhoneNumbers = z_context:get_q_all("chosennumbers", Context),
    CustomerName = accounts_table("name", 1, Context),
    book_numbers(PhoneNumbers, CustomerName, Context).

accounts_table(Fields, Limit, Context) ->
    lb:accounts_table(Fields, Limit, Context).

