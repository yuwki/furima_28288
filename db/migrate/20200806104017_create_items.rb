class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.string :text,               null: false, default: ""
      t.string :price,              null: false, default: ""
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
