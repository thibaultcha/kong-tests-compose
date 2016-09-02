# kong-tests-compose

A [docker-compose] file to run [kong]'s integration test suite's dependencies.

The following containers will be created:

- kong-tests-cassandra
- kong-tests-postgres
- kong-tests-redis

### Usage

```
$ docker-compose up
```

### License

MIT

[docker-compose]: https://docs.docker.com/compose/
[kong]: https://github.com/Mashape/kong
