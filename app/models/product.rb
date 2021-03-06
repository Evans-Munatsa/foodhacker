class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "500x500>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :comments
  belongs_to :user
end
