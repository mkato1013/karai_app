class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.integer     :meal_type,              null: false
      t.string      :shop_name,              null: false
      t.string      :shop_name_kana,         null: false
      t.string      :food_name,              null: false
      t.integer     :spicy_level,            null: false
      t.string      :station,                null: false
      t.integer     :shop_mood,              null: false
      t.integer     :waiting_time,           null: false
      t.text        :food_comment,           null: false
      t.references  :user,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
