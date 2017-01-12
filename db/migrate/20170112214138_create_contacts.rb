class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|   # creating name,email, comments tables with a timestamp
      t.string :name
      t.string :email
      t.text :comments
      
      t.timestamps
    end
  end
end
