class AddByAdminToGallery < ActiveRecord::Migration[6.0]
  def change
    add_column :galleries, :by_admin, :boolean, null: false, default: false
  end
end
