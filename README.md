#テーブル設計

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false, カタカナのみ       |
| last_name_kana     | string     | null: false, カタカナのみ       |
| birth_date         | date       | null: false                    |

### Association
 (brand)
- has_many :items
- has_many :orders


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| postage            | integer    | null: false                    |
| area               | integer    | null: false                    |
| shipping_days      | integer    | null: false                    |
| price              | integer    | null: false,only_integer: true |
| user               | references | null: false,foreign_key: true  |

### Association

- has_one :order
- belongs_to :user


## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false,foreign_key: true  |
| user               | references | null: false,foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user