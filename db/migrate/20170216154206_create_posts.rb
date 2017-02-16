class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.column :name, :string
      t.column :content, :string
      t.column :source, :string
      t.column :owner_id, :integer

      t.timestamp
    end

    create_table :tags do |t|
      t.column :image_id, :integer
      t.column :user_id, :integer
    end
  end
end
