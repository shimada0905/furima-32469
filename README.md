# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_date         | date   | null: false              |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item_name        | string     | null: false       |
| introduction     | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| shipping_cost_id | integer    | null: false       |
| shipping_day_id  | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options          |
|--------|------------|------------------|
| item   | references | foreign_key_true |
| user   | references | foreign_key_true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column          | Type       | Options          |
|-----------------|------------|------------------|
| post_code       | string     | null:false       |
| prefecture_id   | integer    | null: false      |
| city            | string     | null: false      |
| house_number    | string     | null: false      |
| building_name   | string     |                  |
| tel             | string     | null: false      |
| purchase_record | references | foreign_key_true |


### Association

belongs_to :purchase_record
