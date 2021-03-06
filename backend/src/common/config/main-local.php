<?php

return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
           'dsn' => 'mysql:host=mysql5.7;dbname=yii2',
            //'dsn' => 'mysql:host=localhost;port=3306;dbname=yii2rest;unix_socket=/Applications/MAMP/tmp/mysql/mysql.sock',

            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
    ],
];
