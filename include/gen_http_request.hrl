-record(gen_http_request,
    { uri     :: iolist()
    , method  :: gen_http_request:method()
    , headers :: [{iolist(), iolist()}]
    , body    :: iolist()
    }).
