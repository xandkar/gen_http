-module(gen_http_uri).

-include("gen_http_uri.hrl").

-export_type(
    [ t/0
    , scheme/0
    , path/0
    , params/0
    ]).

-type scheme() ::
      http
    | https
    .

-type path() ::
    [binary()].

-type params() ::
    [{binary(), binary()}].

-define(T, #?MODULE).

-type t() ::
    ?T{}.
