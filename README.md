## usersテーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| birth                  | string | null: false |
| full-name              | string | null: false |
| kana-name              | string | null: false |
| encrypted_password     | string | null: false |

### Association

- has_many : item_users
- has_many : buy_users

## itemsテーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| item-name               | string | null: false |
| category                | string | null: false |
| price                   | string | null: false |
| image                   | string | null: false |
| item-info               | string | null: false |
| item-status             | string | null: false |
| send-address            | string | null: false |
| send-day                | string | null: false |
| delivery-charge         | string | null: false |
| seller                  | string | null: false |

### Association

- belongs_to :user
- has_one : buys

## buysテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| buyer                   | string     | null: false                    |
| users_id                | references | null: false, foreign_key: true |
| items_id                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : sends


## sendsテーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| address                 | string     | null: false                    |
| phone-number             | string    | null: false                    |
| users_id                | references | null: false, foreign_key: true |

### Association

- belongs_to :buy