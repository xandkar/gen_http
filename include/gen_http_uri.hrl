-record(gen_http_uri,
    { scheme  = http :: gen_http_uri:scheme()
    , host           :: binary()
    , port    = 80   :: integer()
    , path    = []   :: gen_http_uri:path()
    , params  = []   :: gen_http_uri:params()
    }).
