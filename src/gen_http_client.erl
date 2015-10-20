-module(gen_http_client).

-include("gen_http_request.hrl").
-include("gen_http_response.hrl").

-export_type(
    [ io_error/0
    , result/1
    , t/0
    ]).

-export(
    [ start/2
    , send/2
    , stop/1
    ]).

-type io_error() ::
    {gen_http_client_io_error, term()}.

-type result(A) ::
    {ok, A} | {error, io_error()}.

-record(?MODULE,
    { implementation_module :: module()
    , implementation_state  :: term()
    }).

-define(T, #?MODULE).

-opaque t() ::
    ?T{}.

%% ============================================================================
%%  Implementation interface
%% ============================================================================

-callback start(Options :: term()) ->
    result(State :: term()).

-callback send(State :: term(), gen_http_request:t()) ->
    result({State :: term(), gen_http_response:t()}).

-callback stop(State :: term()) ->
    result({}).

%% ============================================================================
%%  API
%% ============================================================================

-spec start(module(), term()) ->
    result(t()).
start(Module, Options) ->
    case Module:start(Options)
    of  {error, _}=Error ->
            Error
    ;   {ok, State} ->
            T = ?T
                { implementation_module = Module
                , implementation_state  = State
                },
            {ok, T}
    end.

-spec send(t(), gen_http_request:t()) ->
    result({t(), gen_http_response:t()}).
send(?T
    { implementation_module = ImplementationModule
    , implementation_state  = ImplementationState1
    }=T1,
    #gen_http_request{}=Request
) ->
    case ImplementationModule:send(ImplementationState1, Request)
    of  {error, _}=Error ->
            Error
    ;   {ok, {ImplementationState2, #gen_http_response{}=Response}} ->
            T2 = T1?T{implementation_state=ImplementationState2},
            {ok, {T2, Response}}
    end.

-spec stop(t()) ->
    result({}).
stop(?T
    { implementation_module = ImplementationModule
    , implementation_state  = ImplementationState
    }
) ->
    ImplementationModule:stop(ImplementationState).
