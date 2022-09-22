class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genres
  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/no_image.jpg')
      image.attache(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
