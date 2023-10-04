# Usage

```
http://localhost:8080/plans?ampere=20&usage=100
```

SampleResult

```json
[{"provider_name":"東京電力エナジーパートナー","plan_name":"従量電灯B","price":2065.08},{"provider_name":"Looop","plan_name":"基本料金(10A~60A)","price":2666.3999999999996},{"provider_name":"東京電力エナジーパートナー","plan_name":"ずっとも電気1の基本料金(月ごと)","price":2390.67},{"provider_name":"JXTGでんき (lEｍyでんき)","plan_name":"電力料金(月ごと)","price":2007.8799999999999}]
```

# README
Rails Template

* Rails 7
* Ruby 3.1
* heroku

## Enjoy Development
```
docker-compose up -d --build
docker-compose run --rm web rake db:create
docker-compose run --rm web rake db:migrate
```

reset_db
```
spring rails db:drop;spring rails db:create;spring rails db:migrate;spring rails db:seed;
```

## Development server logs

```
alias docker_attach="docker attach `docker ps | grep '8080' | awk '$0=$1'`"
```

## Heroku
Use Heroku


### Deployment
```
git push heroku main
heroku open
```

### Watch logs
```
heroku logs --tail
```

### Do anytings

```
heroku run XXX
heroku run bash
heroku run rails db:migrate
```