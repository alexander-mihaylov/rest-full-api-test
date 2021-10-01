<?php

namespace frontend\controllers;

use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\Cors;
use yii\rest\ActiveController;
use frontend\models\Message;
use yii\web\ForbiddenHttpException;

class MessageController extends ActiveController
{
    public $modelClass = Message::class;
    public $enableCsrfValidation = false;


    public function checkAccess($action, $model = null, $params = [])
    {
        if ($action === 'update' || $action === 'view' || $action === 'delete') {
            if ($model->user_id != Yii::$app->user->identity->getId())
                throw new ForbiddenHttpException(sprintf('You can only %s messages that you\'ve created.', $action));
        }

        if ($action === 'create') {
            if (Yii::$app->request->post()['user_id'] != Yii::$app->user->identity->getId())
                throw new ForbiddenHttpException(sprintf('You can only %s messages that you\'ve created.', $action));
        }
    }

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        return new ActiveDataProvider([
            'query' => Message::find()->where(['status' => '1']),
            'pagination' => [
                'pageSize' => 15,
            ],

        ]);
    }

    public function behaviors()
    {
        $behaviors = parent::behaviors();

        unset($behaviors['authenticator']);

        // add CORS filter
        $behaviors['corsFilter'] = [
            'class' => Cors::class,
        ];

        $behaviors['authenticator'] = [
            'class' => HttpBearerAuth::class,
        ];
        // avoid authentication on CORS-pre-flight requests (HTTP OPTIONS method)
        $behaviors['authenticator']['except'] = ['index'];

        return $behaviors;
    }

    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];
}

