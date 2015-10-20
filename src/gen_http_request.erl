-module(gen_http_request).

-include("gen_http_request.hrl").

-export_type(
    [ t/0
    , method/0
    ]).

-export(
    [ method_to_bin/1
    , method_to_string/1
    ]).

-type method() ::
      'CONNECT'
    | 'DELETE'
    | 'GET'
    | 'HEAD'
    | 'OPTIONS'
    | 'PATCH'
    | 'POST'
    | 'PUT'
    | 'TRACE'
    .


-define(CONNECT , "CONNECT").
-define(DELETE  , "DELETE").
-define(GET     , "GET").
-define(HEAD    , "HEAD").
-define(OPTIONS , "OPTIONS").
-define(PATCH   , "PATCH").
-define(POST    , "POST").
-define(PUT     , "PUT").
-define(TRACE   , "TRACE").


-define(T, #?MODULE).

-type t() ::
    ?T{}.

-spec method_to_bin(method()) ->
    binary().
method_to_bin(Method) ->
    case Method
    of  'CONNECT' -> <<?CONNECT>>
    ;   'DELETE'  -> <<?DELETE>>
    ;   'GET'     -> <<?GET>>
    ;   'HEAD'    -> <<?HEAD>>
    ;   'OPTIONS' -> <<?OPTIONS>>
    ;   'PATCH'   -> <<?PATCH>>
    ;   'POST'    -> <<?POST>>
    ;   'PUT'     -> <<?PUT>>
    ;   'TRACE'   -> <<?TRACE>>
    end.

-spec method_to_string(method()) ->
    string().
method_to_string(Method) ->
    case Method
    of  'CONNECT' -> ?CONNECT
    ;   'DELETE'  -> ?DELETE
    ;   'GET'     -> ?GET
    ;   'HEAD'    -> ?HEAD
    ;   'OPTIONS' -> ?OPTIONS
    ;   'PATCH'   -> ?PATCH
    ;   'POST'    -> ?POST
    ;   'PUT'     -> ?PUT
    ;   'TRACE'   -> ?TRACE
    end.
