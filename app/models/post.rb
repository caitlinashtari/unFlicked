class Post < ActiveRecord::Base
  has_attached_file :asset, styles: { medium: "300x300>", small: "140x140>", thumb: "64x64!" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\z/

  has_many :tags
  has_many :users, through: :tags

  validates :owner_id, :presence => true
end
