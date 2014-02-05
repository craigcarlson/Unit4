class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.string :species
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :age

      t.timestamps
    end
  end
  def self.down
    drop_table :pets
  end
end

