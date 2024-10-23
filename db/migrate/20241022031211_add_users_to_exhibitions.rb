class AddUsersToExhibitions < ActiveRecord::Migration[7.2]
  def change
    add_reference :exhibitions, :user, null: false, foreign_key: true
  end
end
