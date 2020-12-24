# アプリケーション名

furima-32117

# アプリケーション概要

フリーマーケットのアプリケーションを作成しました。

# URL

https://furima-32117.herokuapp.com/

# ID/Pass,テスト用アカウント

・ID/Pass

ID: admin

Pass: 2222

・テスト用アカウント

購入者用メールアドレス: xxxxxx@xxxxxx

パスワード: xxx111

出品者用メールアドレス名: xxxxxx@xxxxxxx

パスワード: xxx111

・購入用カード情報

番号：4242424242424242

期限：Wed Mar 01 2023 00:00:00 GMT+0900 (日本標準時)

セキュリティコード：123

# 利用方法

WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。

ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。

接続先およびログイン情報については、上記の通りです。

同時に複数の方がログインしている場合に、ログインできない可能性があります。

テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品

確認後、ログアウト処理をお願いします。

# 目指した課題解決

Heroku上で扱う画像ファイルは、アプリがデプロイされるか、もしくはアプリが再起動される度に消えてしまう点が課題であると考えました。画像ファイルの保存先を変更することで解決すると考えました。

# 洗い出した要件

| 機能 | 目的 | 詳細 | ユースケース |

| S3 | 画像を常に表示させるため。 | 画像の保存先をS3に設定することで登録した商品の画像は常に表示される。 | 特になし。 |

# 実装した機能についての説明

AWSのS3を実装しました。これにより画像が消える問題(Herokuの仕様)が解消されました。

# データベース設計(ER図)

<img width="434" alt="5452944e73711a36c0ae763ea7a41f91" src="https://user-images.githubusercontent.com/73812712/103096683-180c9700-4648-11eb-8826-a0494e4920f2.png">

# ローカルでの動作方法

Rubyのバージョン

6.0.0

追加パッケージ

・devise

・pry-rails

・mini_magick

・image_processing

・active_hash

・payjp

・aws-sdk-s3

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false, unique: true |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_kana          | string  | null: false               |
| first_kana         | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column       | Type       | Options                        |
| ----------   | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| explanation  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| send_date_id | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| zipcode  | string     | null: false                    |
| area_id  | integer    | null: false                    |
| city     | string     | null: false                    |
| street   | string     | null: false                    |
| phone    | string     | null: false                    |
| building | integer    |                                |
| buy      | references | null: false, foreign_key: true |

### Association

- belongs_to :buy