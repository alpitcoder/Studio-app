class AddUserToStudios < ActiveRecord::Migration[5.1]
  def change
    add_reference :studios, :user, foreign_key: true
  end
end
