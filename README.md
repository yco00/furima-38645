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




# テーブル設計

## users テーブル

| Column                | Type     | Options     |
| --------------------- | -------- | ----------- |
| nicknama              | string   | null: false |
| email                 | string   | null: false |
| encrypted_password    | string   | null: false |
| firstname             | string   | null: false |
| lastname              | string   | null: false |
| firstnam              | string   | null: false |
| lastnameruby          | string   | null: false |
| birthyear             | integer  | null: false |
| birthmonth            | integer  | null: false |
| birthday              | integer  | null: false |

### Association
has_many :items
has_many :comments


## items テーブル

| Column         | Type       |  Options                       |
| -------------- | ---------  | ------------------------------ |
| title          | string     | null: false                    |
| descripition   | text       | null: false                    |
| image          |            | null: false                    |
| category       | string     | null: false                    |
| price          | integer    | null: false                    |
| postage        | string     | null: false                    |
| shippingarea   | string     | null: false                    |
| shippingdays   | string     | null: false                    |
| user           | references | null: false, foreign_key: true | 

### Association
belongs_to :user
has_many :comments


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false,                   |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
