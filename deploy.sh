#!/bin/bash

# Замени это на свой IP и путь к ключу!
SERVER_IP="54.89.222.197"
KEY_PATH="~/Downloads/nginx-key.pem"

# Сама команда rsync:
# -a (архивный режим, сохраняет права)
# -v (выводить процесс в консоль)
# -z (сжимать при передаче)
# --delete (удалять на сервере файлы, которых нет локально)
rsync -avz --delete -e "ssh -i $KEY_PATH" --exclude 'deploy.sh' ./* ubuntu@$SERVER_IP:/var/www/html/

echo "Деплой завершен!"
