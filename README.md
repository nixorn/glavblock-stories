# Истории одного блока. Глазами его руководителя.
Powered by [Ink](https://github.com/inkle/ink)

# Как собрать.

Для разработки - делаешь `docker-compose up` и идешь на `localhost:5000`

Для разворота в юзерспейсе
Качаешь [inklecate](https://github.com/inkle/ink/releases), распаковываешь и ставишь себе в систему. У меня на убунте это было что-то вроде `cp inklecate_linux/* ~/.local/bin`

Ну а потом
```bash
inklecate -o browser_with_server/story.json src/root.ink
`
