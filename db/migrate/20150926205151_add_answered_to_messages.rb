class AddAnsweredToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :answered, :boolean, :default => false
  end
end
