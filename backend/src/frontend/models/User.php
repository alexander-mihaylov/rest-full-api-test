<?php

namespace frontend\models;


class User extends \common\models\User
{
    public function fields()
    {
        return [
            'id',
            'email',
            'username',
            'auth_key',
            'fio' => function($model) {
                return $model->lastname . ' ' . $model->name . ' ' . $model->patronymic;
            },
            'date',
            'city',
            'phone',
            'avatar',
            'message'
        ];
    }


    public function extraFields()
    {
        return ['message'];
    }

    public function getMessage()
    {
        return $this->hasMany(Message::class, ['user_id' => 'id']);
    }
}

