class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id #for evry profile it will always have a user id
      t.string:first_name 
      t.string:last_name
      t.string:job_title
      t.string:phone_number  # pro memebr will be able to view
      t.string:contact_email # pro memebr will be able to view
      t.text:description # text field
    end
  end
end
