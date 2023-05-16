# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- ユーザー情報 -->
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | string | null: false |

### Association

- has_many :items
- has_many :orders
<!-- ユーザー情報ここまで -->


<!-- 商品情報 -->
## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| explain   | text       | null: false                    |
| category  | string     | null: false                    |
| condition | string     | null: false                    |
| delivery  | string     | null: false                    |
| area      | string     | null: false                    |
| schedule  | string     | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
<!-- 商品情報ここまで -->


<!-- 発送先情報 -->
## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
<!-- 発送先情報ここまで -->