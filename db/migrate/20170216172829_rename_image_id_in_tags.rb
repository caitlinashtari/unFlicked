class RenameImageIdInTags < ActiveRecord::Migration[5.0]
  def change
    rename_column :tags, :image_id, :post_id
  end
end
