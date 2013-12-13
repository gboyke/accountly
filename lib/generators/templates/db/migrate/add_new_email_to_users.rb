class AddNewEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :new_email, :string, :default => nil
    add_column :users, :new_email_token, :string, :default => nil
  end

  def self.down
    remove_column :users, :new_email
    remove_column :users, :new_email_token
  end
end
