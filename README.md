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

| Column                | Type     | Options      |
| --------------------- | -------- | ------------ |
| nickname              | string   | null: false  |
| email                 | string   | unique: true |
| encrypted_password    | string   | null: false  |
| firstname             | string   | null: false  |
| lastname              | string   | null: false  |
| firstnam              | string   | null: false  |
| lastnameruby          | string   | null: false  |
| birthday              | date     | null: false  |

### Association
has_many :items
has_many :comments


## items テーブル

| Column         | Type       |  Options                       |
| -------------- | ---------  | ------------------------------ |
| title          | string     | null: false                    |
| descripition   | text       | null: false                    |
| category       | integer    | null: false                    |
| condition      | integer    | null: false                    |
| price          | integer    | null: false                    |
| postage        | integer    | null: false                    |
| shippingarea   | integer    | null: false                    |
| shippingdays   | integer    | null: false                    |
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

## buys テーブル

| Column         | Type       |  Options                       |
| -------------- | ---------  | ------------------------------ |
| cardno         | string     | null: false                    |
| expiration     | string     | null: false                    |
| securitycd     | integer    | null: false                    |
| postno         | string     | null: false                    |
| prefectures    | integer    | null: false                    |
| cities         | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                   |
| user           | references | null: false, foreign_key: true | 
| item           | references | null: false, foreign_key: true | 

### Association
belongs_to :user
belongs_to :item
