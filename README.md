# ElastiFlow - Demo Docker Stack

**This stack is for testing and demo purposes only. It is not intended for production use.**

Ready to use [ElastiFlow](https://docs.elastiflow.com/docs/flowcoll/install_docker/) stack with Elasticsearch.

```shell
$ cp .env.example .env
$ nvim .env
```

```shell
$ make build
$ make create-network
$ make up
```

import ECS dashboard:

```shell
curl -X POST "http://localhost:5601/api/saved_objects/_import" \
    -H "kbn-xsrf: true" \
    --form file="@dashboards/kibana-8.2.x-flow-ecs.ndjson"
```

generate some fake nflow traffic for testing:

```shell
make generate-fake-nflow-traffic
```

## Notes for GNU/Linux distro

```shell
$ echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
$ sysctl --system
```

open Kibana at [http://localhost:5601](http://localhost:5601) and navigate to the `ElastiFlow (flow): Overview`

For any other information, please refer to the [ElastiFlow documentation](https://docs.elastiflow.com/docs) and
[ElastiFlow System Requirements](https://docs.elastiflow.com/docs/flowcoll/requirements/)
