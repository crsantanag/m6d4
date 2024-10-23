class CreateExhibitions < ActiveRecord::Migration[7.2]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.string :description
      t.string :picture

      t.timestamps
    end
  end
end
