2. Создайте на сервере директорию foodgram через терминал

  ```bash
  mkdir foodgram
  ```

3. Установка docker compose на сервер:

  ```bash
  sudo apt update
  sudo apt --fix-broken install
  sudo apt install curl
  curl -fSL https://get.docker.com -o get-docker.sh
  sudo sh ./get-docker.sh
  sudo apt-get install docker-compose-plugin
  ```

4. В директорию foodgram/ скопируйте файлы docker-compose.production.yml и .env:

  ```bash
  scp -i path_to_SSH/SSH_name docker-compose.production.yml username@server_ip:/home/username/foodgram/docker-compose.production.yml
  * ath_to_SSH — путь к файлу с SSH-ключом;
  * SSH_name — имя файла с SSH-ключом (без расширения);
  * username — ваше имя пользователя на сервере;
  * server_ip — IP вашего сервера.g
  ```bash

Переходим в директорию .ssh и генерируем ключи командой:
ssh-keygen -t rsa -b 4096
где -t - тип ключа, а -b - длина ключа.
Далее задаем имя ключа или оставляем вариант по умолчанию (~/.ssh/id_rsa). Вводим дополнительный пароль – пассфразу – и подтверждаем ее.
Далее копируем SSH-ключи на аккаунт с помощью команды:

ssh-copy-id root@45.91.8.241
где login – логин аккаунта, server – IP-адрес сервера.
Готово! Попробуйте подключиться по SSH к аккаунту хостинга и при авторизации укажите пассфразу.
Терминал в Linux и Mac OS
Для подключения по SFTP используйте приложение «Терминал».
Запустите программу и введите команду:

ssh -t root@45.91.8.241 'passwd'

ssh root@45.91.8.241

sftp root@45.91.8.241

перенести папку 

scp -r avtoservis7 root@45.91.8.241:avtoservis7

scp -r .env root@45.91.8.241:.env


3. Соберите Docker-образ, выполнив команду в той же директории, где находится ваш Dockerfile:

```bash
sudo docker compose up -d 
```


sudo docker ps -a

sudo docker Image

sudo docker stop Image
sudo docker rm Image
sudo docker rmi Image Image


остановить все контейнеры в докер
sudo docker stop $(sudo docker ps -aq)

удалить  все контейнеры в докер
sudo docker rm $(sudo docker ps -aq)

остановить все образы в докер
sudo docker stop $(sudo docker ps -aq)

удалить все образы
sudo docker rmi -f $(sudo docker images -q)

Однако, рекомендуется использовать виртуальное окружение Python для изоляции зависимостей вашего проекта. Вот как создать и активировать виртуальное окружение:

Создайте виртуальное окружение:
bash
Копировать
python -m venv myenv
Активируйте виртуальное окружение:

На Windows:
bash
Копировать
myenv\Scripts\activate
На macOS и Linux:
bash
Копировать
source myenv/bin/activate
Установите зависимости в виртуальное окружение:

bash
Копировать
pip install --upgrade pip
pip install -r requirements.txt
Это поможет избежать конфликтов между зависимостями разных проектов и обеспечит чистую среду для вашего приложения.






имя_пользователя@ip_адрес_сервера
  ```

 python3 -m venv venv 
 
  source venv/bin/activate

  pip install django
  pip install djangorestframework
sudo apt install pipenv
pipenv install django_filters

pip install --upgrade pip
pip install -r requirements.txt


pip install python-decouple

pip install psycopg2-binary

python3 manage.py migrate




Загружаем на сервер

Правим на компе
chmod 600 id_rsa.pub

scp -i /home/alex/Загрузки/555/yc-ea703557 docker-compose.production.yml  yc-user@158.160.8.70:/home/yc-user/foodgram/docker-compose.production.yml


scp -i /home/alex/Загрузки/555/yc-ea703557 docker-compose.yml  yc-user@158.160.8.70:/home/yc-user/foodgram/docker-compose.yml


scp -i /home/alex/Загрузки/555/yc-ea703557 .env  yc-user@158.160.8.70:/home/yc-user/foodgram/.env
  ```



sudo docker compose -f docker-compose.production.yml exec backend python manage.py createsuperuser




запускаем
sudo docker compose up -d
sudo docker compose -f docker-compose.production.yml up -d
sudo docker compose -f docker-compose.production.yml exec backend python manage.py migrate
sudo docker compose -f docker-compose.production.yml exec backend python manage.py collectstatic
sudo docker compose -f docker-compose.production.yml exec backend cp -r /app/collected_static/. /backend_static/static/

sudo docker compose -f docker-compose.production.yml exec backend python manage.py createsuperuser

7. Для добавления ингредиентов в базу данных, выполните команду:
С проектом поставляются данные об ингредиентах.  
Заполнить базу данных ингредиентами можно выполнив следующую команду:
```bash
sudo docker compose exec backend python manage.py fill_data_base
```
на сервере развернуть 
sudo docker compose up 
sudo docker compose -f docker-compose.production.yml up 

sudo docker compose -f docker-compose.yml up -d


docker run -e POSTGRES_PASSWORD=foodgram_password -e POSTGRES_USER=foodgram_user postgres:13


sudo ssh root@45.91.8.241



sudo docker rm $(sudo docker ps -aq)
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
"docker rm" requires at least 1 argument.
See 'docker rm --help'.

Usage:  docker rm [OPTIONS] CONTAINER [CONTAINER...]

Remove one or more 






# Checking Docker version
docker --version

# Clean up resources from previous jobs
docker system prune -a

# Create local container network
docker network create my_network

# Starting Postgres service container
docker run -d --name postgres_container --network my_network -e POSTGRES_PASSWORD=password -p 5432:5432 postgres:latest

# Waiting for all services to be ready
# You can add a sleep or use a tool like `wait-for-it.sh` to wait for the Postgres container to be ready before proceeding.

# Service container postgres failed.
# Check logs for the postgres_container to identify the issue
docker logs postgres_container

# Error: One or more containers failed to start.
# Investigate the logs and fix the issue before retrying the container startup.

удалит все докер образы на сервере которые не используются
sudo docker system prune
Дальше необходимо создать суперпользователя для развернутого проекта. Для этого в терминале подключиться к серверу и выполнить команду:




sudo docker exec -it <id контейнера с бэкендом> python manage.py createsuperuser
можно также выполнить загрузку ингредиентов в базу данных командой:




sudo docker exec -it <id контейнера с бэкендом> python manage.py load_data

Certbot - это инструмент, разработанный Let's Encrypt, который упрощает получение и установку SSL-сертификатов. Вы можете установить Certbot на своем сервере с помощью команды:
sql
Copy code
sudo apt update
sudo apt-get install python3-certbot-nginx
sudo apt install certbot


sudo ssh-keygen -R 158.160.8.70

7. На сервере в редакторе nano откройте конфиг Nginx:
```bash
  sudo ssh -i /home/alex/Загрузки/555/yc-ea703557 c-user@158.160.8.70
key NRjeSf

chmod 600 /home/alex/Загрузки/555/yc-ea703557



...8Устанавливаем и настраиваем NGINX
Устанавливаем NGINX....




sudo apt install nginx -y
Запускаем
sudo systemctl start nginx
Настраиваем firewall
sudo ufw allow 'Nginx Full'
sudo ufw allow OpenSSH
Включаем firewall
sudo ufw enable




...Открываем конфигурационный файл NGINX
sudo nano /etc/nginx/sites-enabled/default
Полностью удаляем из него все и пишем новые настройки...




1.Пример файла nginx находится в default


...Сохраняем изменения и выходим из редактора
Проверяем корректность настроек...
sudo nginx -t




Запускаем NGINX
sudo systemctl start nginx




Перезапускаем Nginx




sudo service nginx reload




Настраиваем HTTPS на сервере
Установка пакетного менеджера snap.
У этого пакетного менеджера есть нужный вам пакет — certbot.
Шаг 1. Установка certbot
Чтобы установить certbot, вам понадобится пакетный менеджер snap. Установите его командой:
sudo apt install snapd
Далее сервер, скорее всего, попросит вам перезагрузить операционную систему. Сделайте это, а потом последовательно выполните команды:
# Установка и обновление зависимостей для пакетного менеджера snap.
sudo snap install core; sudo snap refresh core
# При успешной установке зависимостей в терминале выведется:
# core 16-2.58.2 from Canonical✓ installed




# Установка пакета certbot.
sudo snap install --classic certbot
# При успешной установке пакета в терминале выведется:
# certbot 2.3.0 from Certbot Project (certbot-eff✓) installed




# Создание ссылки на certbot в системной директории,
# чтобы у пользователя с правами администратора был доступ к этому пакету.
sudo ln -s /snap/bin/certbot /usr/bin/certbot
Шаг 2. Запускаем certbot и получаем SSL-сертификат
Чтобы начать процесс получения сертификата, введите команду:




sudo certbot --nginx




Откройте файл sudo nano /etc/nginx/sites-enabled/default и убедитесь в этом:




Перезагрузите конфигурацию Nginx:
sudo systemctl reload nginx


Чтобы узнать актуальный статус сертификата и сколько дней осталось до его перевыпуска, используйте команду:




sudo certbot certificates


Теперь убедитесь, что сертификат будет обновляться автоматически:
sudo certbot renew --dry-run


Вручную сертификат можно обновить командой:
sudo certbot renew --pre-hook "service nginx stop" --post-hook "service nginx start"



Запустите SSH-агент: Убедитесь, что SSH-агент запущен на вашем локальном компьютере и в него добавлен ваш приватный ключ с помощью ssh-add ...

chmod 600 yc-ea703557
ssh-add yc-ea703557

chmod 600 authorized_keys


eval "$(ssh-agent -s)"


ssh-add


ssh-add ~/.ssh/authorized_keys


полезное




sudo dnf upgrade




посмотреть все докер образы на сервере\


sudo docker images




sudo docker ps -a


sudo docker stop Image
sudo docker rm Image
sudo docker rmi Image Image



удалит все докер образы на сервере которые не используются
sudo docker system prune




sudo docker rmi -f $(sudo docker images -q)


ssh root@45.91.8.241


Откройте файл sudo nano /etc/nginx/sites-enabled/default и убедитесь в этом:




# /etc/nginx/sites-enabled/default
server {
    listen 80;
    server_name tehosagost88811.zapto.org;

    location / {
        proxy_pass http://127.0.0.1:8000;  # Замените YOUR_PORT на порт вашего приложения
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}


Чтобы создать SSL сертификат через терминал, вы можете использовать инструмент OpenSSL, который обычно доступен в большинстве UNIX-подобных систем, таких как Linux и macOS. Вот пример шагов для создания самоподписанного SSL сертификата:

Откройте терминал: Запустите терминал на вашем компьютере.

Установите OpenSSL (если не установлен): В большинстве случаев OpenSSL уже установлен в вашей системе. Если нет, установите его, используя менеджер пакетов вашей системы.

Создайте закрытый ключ (private key): Введите следующую команду в терминале:

csharp
Copy code

openssl genrsa -out ssl_certificate_key.pem 2048

Это создаст закрытый ключ в файле ключ.pem.

Создайте запрос на сертификат (certificate signing request, CSR): Введите следующую команду:

csharp
Copy code

openssl req -new -key ssl_certificate_key.pem -out ssl_certificate.csr

Это создаст CSR файл запрос.csr, который потребуется для создания самоподписанного сертификата.

Создайте самоподписанный сертификат: Введите следующую команду:

csharp
Copy code

openssl x509 -req -days 365 -in ssl_certificate.csr -signkey ssl_certificate_key.pem -out ssl_certificate.crt

сертификат.crt
Это создаст самоподписанный SSL сертификат сертификат.crt, который будет действителен в течение 365 дней. Можете изменить количество дней, указав другое значение после параметра -days.

Теперь у вас есть самоподписанный SSL сертификат сертификат.crt и закрытый ключ ключ.pem. Обратите внимание, что для использования в реальной продукционной среде лучше использовать сертификат, подписанный д


Чтобы ваш сайт открывался по протоколу HTTPS, вам необходимо настроить SSL сертификат для вашего сервера Nginx. Вот как вы можете изменить ваш конфигурационный файл /etc/nginx/sites-enabled/default:

server {
    listen 80;
    server_name tehosagost88811.zapto.org;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    server_name tehosagost88811.zapto.org;

    ssl_certificate /path/to/your/ssl_certificate.crt;
    ssl_certificate_key /path/to/your/private_key.key;

    location / {
        proxy_pass http://127.0.0.1:8000;  # Замените YOUR_PORT на порт вашего приложения
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        # Дополнительные настройки для проксирования, если необходимо
    }
}

В этом обновленном конфигурационном файле:

Первый серверный блок прослушивает порт 80 и перенаправляет все запросы на HTTPS с помощью кода состояния 301 (перемещено навсегда).

Второй серверный блок прослушивает порт 443 (стандартный порт HTTPS) и настраивает SSL. Пути к вашему SSL-сертификату и закрытому ключу должны быть указаны в параметрах ssl_certificate и ssl_certificate_key.

Внутри блока location / вы можете оставить ваши текущие настройки проксирования.

Прежде чем использовать этот конфигурационный файл, убедитесь, что у вас есть действующий SSL-сертификат и закрытый ключ. Помимо этого, убедитесь, что порт 443 открыт и доступен на вашем сервере.
