<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "{{%message}}".
 *
 * @property int $id
 * @property int $user_id
 * @property string|null $text
 * @property string $date
 * @property int $status
 *
 * @property User $user
 */
class Message extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%message}}';
    }

    public function fields()
    {
        return [
            // название поля совпадает с именем атрибута
            'id',
            // название поля "email", атрибут "email_address"
            'text',
            'date',
            'status',
        ];
    }

    public function extraFields()
    {
        return ['user'];
    }


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'required'],
            [['user_id', 'status'], 'integer'],
            [['text'], 'string'],
            [['date'], 'safe'],
            //[['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'text' => 'Text',
            'date' => 'Date',
            'status' => 'Status',
        ];
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    /*public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }*/

    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id'])->select(['id','name',]);
    }
}
