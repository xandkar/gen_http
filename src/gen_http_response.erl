-module(gen_http_response).

-include("gen_http_response.hrl").

-export_type(
    [ t/0
    , code/0
    ]).

-type code() ::
    100..599.

-define(T, #?MODULE).

-type t() ::
    ?T{}.
