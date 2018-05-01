class CreateAids < ActiveRecord::Migration[5.1]
  def change
    create_table :aids do |t|
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :category
      t.string :aid_type
      t.text :explanation
      t.string :needy_name
      t.string :il
      t.string :ilce
      t.string :mahalle
      t.string :cadde
      t.string :sokak
      t.integer :no
      t.string :address

      t.timestamps
    end
  end
end
