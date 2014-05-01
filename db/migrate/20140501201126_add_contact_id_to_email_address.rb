class AddContactIdToEmailAddress < ActiveRecord::Migration
  def up
    EmailAddress.destroy_all
    add_column :email_addresses, :contact_id, :integer
    add_column :email_addresses, :contact_type, :string
    remove_column :email_addresses, :person_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
