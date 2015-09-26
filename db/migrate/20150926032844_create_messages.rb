class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
