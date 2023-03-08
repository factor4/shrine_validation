class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :file_data

      t.timestamps
    end
  end
end
