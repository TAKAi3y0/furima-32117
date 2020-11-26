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
| year_id            | integer | null: false               |
| month_id           | integer | null: false               |
| day_id             | integer | null: false               |

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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zipcode       | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | integer    | null: false                    |
| phone         | string     | null: false                    |
| building      | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy