# テーブル設計

## users テーブル

| Column          | Type   | Options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | date   | null: false |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| item_name       | string     | null: false       |
| introduction    | text       | null: false       |
| category        | string     | null: false       |
| condition       | string     | null: false       |
| shipping_source | string     | null: false       |
| shipping_cost   | string     | null: false       |
| shipping_day    | string     | null: false       |
| price           | integer    | null: false       |
| user            | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase_records

## purchase_records テーブル

| Column           | Type       | Options          |
|------------------|------------|------------------|
| item             | references | foreign_key_true |
| user             | references | foreign_key_true |
| shipping_address | references | foreign_key_true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column        | Type    | Options     |
|---------------|---------|-------------|
| post_code     | integer | null:false  |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| tel           | integer | null: false |


### Association

belongs_to :purchase_record
