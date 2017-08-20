class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :user_id
      t.integer :genre_id
      t.string :prep_time
      t.text :decription
      t.text :recipe_text

      t.timestamps

    end
  end
end
