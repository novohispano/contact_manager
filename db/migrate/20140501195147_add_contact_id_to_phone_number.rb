class AddContactIdToPhoneNumber < ActiveRecord::Migration
  def up
    PhoneNumber.destroy_all
    add_column :phone_numbers, :contact_id, :integer
    add_column :phone_numbers, :contact_type, :string
    remove_column :phone_numbers, :person_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
