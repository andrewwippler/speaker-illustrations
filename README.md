# Speaker Illustrations

[![CircleCI](https://circleci.com/gh/andrewwippler/speaker-illustrations.svg?style=svg)](https://circleci.com/gh/andrewwippler/speaker-illustrations)

Speaker illustrations is a personal, searchable repository of illustrations which are categorized by tags. This is a replacement to paper, word doc folder, and evernote/onenote notebook filing systems.

## Dev Setup

```
docker-compose up
docker-compose exec web ./bin/rails db:setup
docker-compose exec web ./bin/rails db:seed
```
Then access the web portion by visitng http://localhost:8080

Note: 
- prefix any rails commands with `docker-compose exec web ./bin/`.

## License

[MIT](LICENSE.md)
