# README



## УСТАНОВКА

Установливается как стандартное rails app

### 1. Выполнить
`git pull git@github.com:Khanitskiy/notification_service.git`
`cd notification_service`
`bundle install`
`cp /config/database.example.yml /config/database.yml`

### 2. Прописать 
в /config/database.yml логин пароль и название базы данных для подключения к базе
Положить в корень проекта .env

### 3. Установка базы - выполнить
`rake db:create`
`rake db:migrate`


#### Работа с приложением через консоль

##### Создание юзера (Пример)

`User.create(email: "test@gmail.com", phone: "380664856394", first_name: "Pablo", last_name: "Escobar")`

Формат телефона международный без +. Начинается с 380

##### Создание 2 уведомления (Пример)

`Notification.create(notification_type: "confirm", text: "Hello %first_name% %last_name% with email - %email and phone - %phone%")`
`Notification.create(notification_type: "notice", text: "Notice %first_name% %last_name% with email - %email and phone - %phone%")`

###### Отправка email-a пользователю

- берем пользователя по email
	`user = User.find_by(email: "test@gmail.com")`
- отправляем email с уведомлением типа "confirm"
	`NotificationCreator.new.confirm.to_user(user).send_email`
- отправляем email с уведомлением типа "notice"	
	`NotificationCreator.new.notice.to_user(user).send_email`	

###### Отправка sms пользователю
- берем пользователя по phone
	`user = User.find_by(phone: "380664856394")`
- отправляем sms с уведомлением типа "confirm"
	`NotificationCreator.new.confirm.to_user(user).send_email`
- отправляем sms с уведомлением типа "notice"
	`NotificationCreator.new.confirm.to_user(user).send_email`	