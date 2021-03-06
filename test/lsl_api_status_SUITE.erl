-module(lsl_api_status_SUITE).
-author('elbrujohalcon@inaka.net').

-include_lib("mixer/include/mixer.hrl").
-mixin([
        {lsl_test_utils,
         [ init_per_suite/1
         , end_per_suite/1
         ]}
       ]).

-export([all/0]).
-export([returns_ok/1]).

-spec all() -> [atom()].
all() -> lsl_test_utils:all(?MODULE).

-spec returns_ok(lsl_test_utils:config()) -> {comment, string()}.
returns_ok(_Config) ->
  ct:comment("GET /status should return 200 OK"),
  #{status_code := 200,
           body := Body} = lsl_test_utils:api_call(get, "/status"),

  ct:comment("GET /status should return {'status': 'ok'}"),
  #{<<"status">> := <<"ok">>} = sr_json:decode(Body),
  {comment, ""}.
