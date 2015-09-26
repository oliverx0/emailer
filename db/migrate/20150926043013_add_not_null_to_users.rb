class AddNotNullToUsers < ActiveRecord::Migration
  def change

    change_column_null :messages, :email, false
    change_column_null :messages, :content, false
    change_column_null :messages, :title, false
  end
end
