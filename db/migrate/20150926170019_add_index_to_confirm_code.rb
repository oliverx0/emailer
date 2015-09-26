class AddIndexToConfirmCode < ActiveRecord::Migration
  def change
    add_index :users, :confirm_code
  end
end
