-module(vernemq_demo_plugin_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->

 
    KafkaBootstrapEndpoints = [{'kafka', 9092}],
    ClientConfig = [
        {allow_topic_auto_creation, true},
        {auto_start_producers, true},
        {reconnect_cool_down_seconds, 10},
        {default_producer_config, [ 
            {retry_backoff_ms, 500},
            {max_retries, -1},
            {max_linger_ms, 1024},
            {max_linger_count, 100},
            {required_acks, 0},
            {partition_buffer_limit, 1024},
            {partition_onwire_limit, 1024}
        ]},
        {extra_sock_opts, [
            {exit_on_close, true},
            {keepalive, true}
        ]}
    ],

    error_logger:info_msg("----------------------"),
    error_logger:info_msg("brod client config: ~p", [ClientConfig]),
    {ok, _} = application:ensure_all_started(brod),
    ok = brod:start_client(KafkaBootstrapEndpoints, kafka_client, ClientConfig),

    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {one_for_one, 5, 10}, []} }.

