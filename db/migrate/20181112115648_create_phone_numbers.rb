class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.bigint :number
      t.boolean :custom, default: false
    end
    add_index :phone_numbers, :custom
  end
end
