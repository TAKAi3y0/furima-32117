class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name,               null: false
      t.text       :explanation,        null: false
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :charge_id,          null: false
      t.integer    :area_id,            null: false
      t.integer    :send_date_id,       null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
