# README


## customers テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

## association

- has_many :orders
- has_many :favorites
- has_many :carts
- has_many :comments


## items テーブル

| Column             | Type    | Option       |
| ------------------ | ------  | ------------ |
| name               | string  | null: false  |
| description        | text    | null: false  |
| category_id        | integer | null: false  |
| color_id           | integer | null: false  |
| size_id            | integer | null: false  |
| price              | integer | null: false  |

## association

- has_many :item_orders
- has_many :orders, through: :item_orders

- has_many :favorites
- has_many :carts


## orders テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| shipping_cost      | integer    | null: false                     |
| total_price        | integer    | null: false                     |
| customer           | references | null: false, foreign_key: true  |

## association

- has_many :item_orders
- has_many :items, through: :item_orders

- belongs_to :customer
- has_one :destination


## item_orders テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| quantity           | integer    | null: false                     |
| sub_price          | integer    | null: false                     |
| item               | references | null: false, foreign_key: true  |
| order              | references | null: false, foreign_key: true  |

## association

- belongs_to :item
- belongs_to :order


## destinations テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| postcode           | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| city               | string     | null: false                     |
| block              | string     | null: false                     |
| building           | string     |                                 |
| phone_number       | string     | null: false                     |
| order              | references | null: false, foreign_key: true  |

## association

- belongs_to :order


## carts テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| quantity           | integer    | null: false                     |
| item               | references | null: false, foreign_key: true  |
| customer           | references | null: false, foreign_key: true  |

## association

- belongs_to :item
- belongs_to :customer


## favorites テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| item               | references | null: false, foreign_key: true  |
| customer           | references | null: false, foreign_key: true  |

## association

- belongs_to :item
- belongs_to :customer


## products テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| description        | text       | null: false                     |

## association

- has_many :comments


## comments テーブル

| Column             | Type       | Option                          | 
| ------------------ | ---------- | ------------------------------- |
| comment            | text       | null: false                     |
| product            | references | null: false, foreign_key: true  |
| customer           | references | null: false, foreign_key: true  |

## association

- belongs_to :product
- belongs_to :customer



