class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :picture
      t.string :description
      t.text :keyword

      t.timestamps
    end
  end
end
