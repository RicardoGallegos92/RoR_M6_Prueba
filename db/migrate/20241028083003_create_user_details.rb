class CreateUserDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :photo
      t.string :position
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
