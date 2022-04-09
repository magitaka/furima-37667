## usersテーブル

| Column                 | Type   | Options                  |
| ------------------     | ------ | ------------------------ |
| nickname               | string | null: false              |
| email                  | string | null: false, unique: true|
| encrypted_password     | string | null: false              |
| birthday               | date   | null: false              |
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
| price                   | Integer    | null: false                    |
| item_info               | string     | null: false                    |
| item_status_id          | Integer    | null: false                    |
| shipment_address_id     | Integer    | null: false                    |
| delivery_date_id        | Integer    | null: false                    |
| delivery_charge_id      | Integer    | null: false                    |
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
- has_one : shipping


## shippingsテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| post_code               | string     | null: false                    |
| city                    | string     | null: false                    |
| shipment_address_id     | Integer    | null: false                    |
| address                 | string     | null: false                    |
| building                | string     |                                |
| phone_number            | string     | null: false                    |
| buy                     | references | null: false, foreign_key: true |

### Association

- belongs_to :buy