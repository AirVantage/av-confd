# AV confd

Conternerized version of [confd utility](https://github.com/kelseyhightower/confd).

Run like this:

`docker run -v /etc:/etc airvantage:av-confd -backend etcd -node 172.17.42.1:4001`

Read the [documentation for info about config file templates](https://github.com/kelseyhightower/confd/tree/master/docs).