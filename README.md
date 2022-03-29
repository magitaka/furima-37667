## usersテーブル

| Column                 | Type   | Options                  |
| ------------------     | ------ | ------------------------ |
| nickname               | string | null: false              |
| email                  | string | null: false, unique: true|
| encrypted_password     | string | null: false              |
| date                   | string | null: false              |
| first_name             | string | null: false              |
| last_name              | string | null: false              |
| first_kana_name        | string | null: false              |
| last_kana_name         | string | null: false              |

### Association

- has_many : items
- has_many : buys

## itemsテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| category_id             | Integer    | null: false                    |
| price_id                | Integer    | null: false                    |
| item_info               | string     | null: false                    |
| item_status             | string     | null: false                    |
| shipment_address        | string     | null: false                    |
| delivery_date_id        | Integer    | null: false                    |
| delivery_charge         | string     | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : buy

## buysテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : send


## shippingsテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| address                 | string     | null: false                    |
| post_code               | string     | null: false                    |
| city                    | string     | null: false                    |
| state                   | string     | null: false                    |
| phone_number_id         | Integer    | null: false                    |
| buy                     | references | null: false, foreign_key: true |

### Association

- belongs_to :buy