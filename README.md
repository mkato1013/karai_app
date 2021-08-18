# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| introduction       | text    |                           |
| total_like         | string  | null: false               |

### Association

- has_many :foods
- has_many :likes
<!-- 後で実装予定 -->
<!-- source: :モデル名 関連するモデルを指定する -->
<!-- 上：フォロワー 下：フォロー -->
- has_many :follower_user, through: :followed, source: :follower
- has_many :following_user, through: :follower, source: :followed


## foods テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| meal_type_id    | integer    | null: false                  |
| shop_name       | string     | null: false                  |
| shop_name_kana  | string     | null: false                  |
| food_name       | string     | null: false                  |
| food_price      | string     | null: false                  |
| spicy_level_id  | integer    | null: false                  |
| taste_id        | integer    | null: false                  |
| station         | string     | null: false                  |
| shop_mood_id    | integer    | null: false                  |
| waiting_time_id | integer    | null: false                  |
| user            | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- has_many :likes
- has_many :food_tags
- has_many :tags, through: :food_tags

## tags テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| tag_name        | string     |                              |

### Association

- has_many :food_tags
- has_many :foods, through: :food_tags

## food_tags テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| food            | string     | null:false, foreign_key:true |
| tag             | string     | null:false, foreign_key:true |

### Association

- belongs :food
- belongs :tag

## likes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key:true  |
| item          | references | null: false, foreign_key:true  |

### Association

- belongs_to :user
- belongs_to :item

## relationships テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| follower     | references | null: false, foreign_key: true |
| followed     | references | null: false, foreign_key: true |

### Association

- belongs_to :follower
- belongs_to :followed