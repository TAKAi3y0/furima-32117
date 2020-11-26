# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| nickname   | string | null: false, unique: true |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column      | Type          | Options                        |
| ----------  | ------------- | ------------------------------ |
| name        | string        | null: false                    |
| explanation | text          | null: false                    |
| category    | string        | null: false                    |
| status      | string        | null: false                    |
| charge      | string        | null: false                    |
| area        | string        | null: false                    |
| send_date   | integer       | null: false                    |
| price       | integer       | null: false                    |
| user        | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| buy_date   | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| zipcode    | integer    | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| street     | integer    | null: false                    |
| phone      | integer    | null: false                    |
| buy        | references | null: false, foreign_key: true |

### Association

- belongs_to :buy