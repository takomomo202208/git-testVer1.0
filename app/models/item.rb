class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy


  belongs_to :genre, optional: true
  has_one_attached :image

  enum is_active: { "sale": true, "soldout": false }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def taxin_price
    price*1.1
  end

  def add_tax_price
    (self.price * 1.1).round
  end

end
