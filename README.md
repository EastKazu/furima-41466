# テーブル設計

## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    | カタカナのみ
| last_name_kana     | string     | null: false                    | カタカナのみ
| birth_date         | date       | null: false                    |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
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
- has_one :purchase_address


## purchase_addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| street             | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false,foreign_key: true  |

### Association

- belongs_to :order