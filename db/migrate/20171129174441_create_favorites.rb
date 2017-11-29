class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.column :user_id, :integer
      t.column :image_id, :integer
      t.timestamps
    end
  end
end
