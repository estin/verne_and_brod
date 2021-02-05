# VerneMQ + brod Demo Plugin


Case for https://github.com/klarna/brod/issues/431


Run

    docker-compose up vernemq


Test

    mosquitto_pub -h 127.0.0.1 -p 1883 -t fd/1 -m '{"schema":"telemetry","data":{"packetID":55308}}'


Then wait 2-3s and publish again


Output
 
```

vernemq_1    | 07:49:34.097 [info] brod client config: [{allow_topic_auto_creation,true},{auto_start_producers,true},{reconnect_cool_down_seconds,10},{default_producer_config,[{retry_backoff_ms,500},{max_retries,-1},{max_linger_ms,1024},{max_linger_count,100},{required_acks,0},{partition_buffer_limit,1024},{partition_onwire_limit,1024}]},{extra_sock_opts,[{exit_on_close,true},{keepalive,true}]}]
vernemq_1    |  __      ____  __  ____         _____ _______      ________ _____   _____ _____ _________     __
vernemq_1    |  \ \    / /  \/  |/ __ \       |  __ \_   _\ \    / /  ____|  __ \ / ____|_   _|__   __\ \   / /
vernemq_1    |   \ \  / /| \  / | |  | |______| |  | || |  \ \  / /| |__  | |__) | (___   | |    | |   \ \_/ /
vernemq_1    |    \ \/ / | |\/| | |  | |______| |  | || |   \ \/ / |  __| |  _  / \___ \  | |    | |    \   /
vernemq_1    |     \  /  | |  | | |__| |      | |__| || |_   \  /  | |____| | \ \ ____) |_| |_   | |     | |
vernemq_1    |      \/   |_|  |_|\___\_\      |_____/_____|   \/   |______|_|  \_\_____/|_____|  |_|     |_|
vernemq_1    |

>>> mosquitto_pub -h 127.0.0.1 -p 1883 -t fd/1 -m '{"schema":"telemetry","data":{"packetID":55308}}'

vernemq_1    | 07:50:16.157 [info] auth_on_publish: undefined {[],<<"mosq-7AhStvW39OQRMRYUBg">>} 0 [<<"fd">>,<<"1">>] <<"{\"schema\":\"telemetry\",\"data\":{\"packetID\":55308}}">> false
vernemq_1    | 07:50:16.179 [info] client kafka_client connected to 8747bf86694a:9092
vernemq_1    | 07:50:16.179 [info] [brod] produce_cb result {ok,0}
vernemq_1    | 07:50:17.208 [info] [brod] Produced <<48,7,83,231,125,209,194,88,149,176,228,104,64,234,186,93>> to <<"fd">> partition 0 at base-offset -1

!!! kafka settings ./kafka.properties https://docs.confluent.io/platform/current/installation/configuration/consumer-configs.html#connections.max.idle.ms
!!! connections.max.idle.ms=1000

vernemq_1    | 07:50:18.446 [info] client kafka_client: payload connection down 8747bf86694a:9092
vernemq_1    | reason:{shutdown,tcp_closed}

>>> mosquitto_pub -h 127.0.0.1 -p 1883 -t fd/1 -m '{"schema":"telemetry","data":{"packetID":55308}}'

vernemq_1    | 07:50:19.765 [info] auth_on_publish: undefined {[],<<"mosq-3XYRJOuOLGHmEwU28D">>} 0 [<<"fd">>,<<"1">>] <<"{\"schema\":\"telemetry\",\"data\":{\"packetID\":55308}}">> false
vernemq_1    | 07:50:19.770 [error] kafka_client (re)connect to 8747bf86694a:9092 aborted.
vernemq_1    | last failure: {shutdown,tcp_closed}
vernemq_1    | 07:50:19.770 [warning] Failed to (re)init connection, reason:
vernemq_1    | {shutdown,tcp_closed}
vernemq_1    | 07:50:19.770 [info] [brod] produce_cb result {ok,0}
vernemq_1    | 07:50:21.299 [error] kafka_client (re)connect to 8747bf86694a:9092 aborted.
vernemq_1    | last failure: {shutdown,tcp_closed}
vernemq_1    | 07:50:21.300 [warning] Failed to (re)init connection, reason:
vernemq_1    | {shutdown,tcp_closed}
vernemq_1    | 07:50:21.802 [error] kafka_client (re)connect to 8747bf86694a:9092 aborted.
vernemq_1    | last failure: {shutdown,tcp_closed}
vernemq_1    | 07:50:21.802 [warning] Failed to (re)init connection, reason:
vernemq_1    | {shutdown,tcp_closed}
vernemq_1    | 07:50:22.305 [error] kafka_client (re)connect to 8747bf86694a:9092 aborted.
vernemq_1    | last failure: {shutdown,tcp_closed}
vernemq_1    | 07:50:22.305 [warning] Failed to (re)init connection, reason:
vernemq_1    | {shutdown,tcp_closed}
....
```
