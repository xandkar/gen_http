-record(gen_http_request,
    { uri     :: gen_http_uri:t()
    , method  :: gen_http_request:method()
    , headers :: [{iolist(), iolist()}]
    , body    :: iolist()
    }).
