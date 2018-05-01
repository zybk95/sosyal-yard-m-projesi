class AddUserToAid < ActiveRecord::Migration[5.1]
  def change
    add_reference :aids, :user, foreign_key: true
  end
end
