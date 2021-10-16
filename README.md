
# users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |  
| nickname           | string | null: false               |  
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

# Association
- has_many :items
- has_many :buys
- belongs_to :addless


# items テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false,                   |
| text               | text       | null: false,                   |
| catedory           | string     | null: false,                   |
| condition          | string     | null: false,                   |
| shipping_cost      | string     | null: false,                   |
| shipping_area      | string     | null: false,                   |
| shipping_days      | string     | null: false,                   |
| price              | string     | null: false,                   |

# Association
- belongs_to :user
- hus_one :buy


# buys テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- belongs_to :address


# addresses テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| user               | references | null: false, foreign_key: true |
| zip_code           | integer    | null: false,                   |
| prefecture         | string     | null: false,                   |
| city               | string     | null: false,                   |
| address            | string     | null: false,                   |
| address2           | string     | null: false,                   |
| phone_number       | integer    | null: false,                   |

# Association
- belongs_to :user
- belongs_to :buy
