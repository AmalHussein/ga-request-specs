class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
