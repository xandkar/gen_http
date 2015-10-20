-record(gen_http_response,
    { code    :: gen_http_response:code()
    , headers :: [{binary(), binary()}]
    , body    :: binary()
    }).
