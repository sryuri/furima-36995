
# users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |  
| nickname           | string | null: false               |  
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

# Association
- has_many :items
- has_many :buys


# items テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |

# Association
- belongs_to :user
- has_one :buy


# buys テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- has_one :address


# addresses テーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| buy                | references | null: false, foreign_key: true |
| zip_code           | string     | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                | 
| phone_number       | string     | null: false                    |
 
# Association
- belongs_to :buy
