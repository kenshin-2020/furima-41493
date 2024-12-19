# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null:false  |
| email              | string  | null:false, unique:true  |
| encrypted_password | string  | null:false  |
| last_name          | string  | null:false  |
| first_name         | string  | null:false  |
| last_name_reading  | string  | null:false  |
| first_name_reading | string  | null:false  |
| birth_date         | date    | null:false  |

### Association

- has_many :items
- has_many :purchases



## itemsテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item_name          | string  | null:false  |
| item_text          | text    | null:false  |
| category_id        | integer | null:false  |
| situation_id       | integer | null:false  |
| shippingfee_id     | integer | null:false  |
| prefecture_id      | integer | null:false  |
| deliveryday_id     | integer | null:false  |
| price              | integer | null:false  |
| user               | references | null:false, foreign_key:true |

### Association

- has_one :purchase
- belongs_to :user
- has_one_attached :image



## purchasesテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null:false, foreign_key:true |
| item       | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null:false  |
| prefecture_id      | integer    | null:false  |
| city               | string     | null:false  |
| house_number       | string     | null:false  |
| building_name      | string     |             |
| phone_number       | string     | null:false  |
| purchase           | references | null:false, foreign_key:true |

### Association

- belongs_to :purchase