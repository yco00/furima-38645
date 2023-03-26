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

| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | null: false  unique: true |
| encrypted_password    | string   | null: false               |
| firstname             | string   | null: fals                |
| lastname              | string   | null: false               |
| firstnam              | string   | null: false               |
| lastnameruby          | string   | null: false               |
| birthday              | date     | null: false               |

### Association
has_many :items
has_many :comments
has_many :buys


## items テーブル

| Column           | Type       |  Options                       |
| --------------   | ---------  | ------------------------------ |
| title            | string     | null: false                    |
| descripition     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| price            | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| shippingday_id   | integer    | null: false                    |
| user             | references | null: false, foreign_key: true | 

### Association
belongs_to :user
has_many :comments
has_many :buys


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

| Column          | Type       |  Options                       |
| --------------  | ---------  | ------------------------------ |
| user            | references | null: false, foreign_key: true | 
| item            | references | null: false, foreign_key: true | 

### Association
has_one :deliverys
belongs_to :user
belongs_to :item



## deliverys テーブル

| Column          | Type       |  Options                       |
| --------------  | ---------  | ------------------------------ |
| postno          | string     | null: false                    |
| area_id         | integer    | null: false                    |
| cities          | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false,                   | 
| buy             | references | null: false, foreign_key: true | 


### Association
belongs_to :buy
