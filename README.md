# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null:false  |
| email              | string  | null:false, unique:true  |
| password           | string  | null:false  |
| last-name          | string  | null:false  |
| first-name         | string  | null:false  |
| last-name-reading  | string  | null:false  |
| first-name-reading | string  | null:false  |
| birth-year         | integer | null:false  |
| birth-month        | integer | null:false  |
| birth-day          | integer | null:false  |

### Association

- has_many :items
- has_many :purchases



## itemsテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item-image         | text    | null:false  |
| item-name          | string  | null:false  |
| item-text          | text    | null:false  |
| item-category      | integer | null:false  |
| item-situation     | integer | null:false  |
| shipping-fee       | integer | null:false  |
| delivery-region    | integer | null:false  |
| delivery-day       | integer | null:false  |
| price              | string  | null:false  |
| user               | references | null:false, foreign_key:true |

### Association

- has_one :purchases
- belongs_to :user



## purchasesテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null:false, foreign_key:true |
| item       | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address



## addressesテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal-code        | string     | null:false  |
| prefecture         | integer    | null:false  |
| city               | string     | null:false  |
| house-number       | string     | null:false  |
| building-name      | string     |             |
| phone-number       | string     | null:false  |
| purchase           | references | null:false, foreign_key:true |

### Association

- belongs_to :purchase