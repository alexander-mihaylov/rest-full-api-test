# rest-test-api
#hosts
``127.0.0.1 rest-test.com``

``127.0.0.1 rest-api.com``

# composer install

``cd backend/src``

``composer install``

#Ресурс http://rest-api.com/message

``GET http://rest-api.com/message Общедоступный, выводит информацию по сообщениям со статусом 1``

# http://rest-api.com/message/1

``GET http://rest-api.com/message``

````Приватный выводит сообщения, которые относятся к конкретному пользователю````

````Авторизация по Bearer token````

# Приватные
``GET http://rest-api.com/message/1``

``POST http://rest-api.com/message``

``PUT PATCH http://rest-api.com/message/1``

``DELETE http://rest-api.com/message/1``

# Пользователи
``alex 123456789``

``ivan 123456789``

# Что не успел

``Сделать миграции``

``Фильтрации данных на actionSignup() и проверка по email``

``веб морду реализовывал примитивно, хотелось бы сделать на Vue.js ``

``Много времени потратил на повторение фреймворка, по хорошему есть над чем еще поработать``
