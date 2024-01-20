class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :creater, class_name: 'User', optional:true
  belongs_to :developer, class_name: 'User', optional:true
  has_one_attached :image
  validate :image_format
  validates :title, presence: true, uniqueness: true
  private

  def image_format
    return unless image.attached?

    if !image.blob.content_type.in?(%w(image/png image/gif))
      errors.add(:image, 'must be a PNG or GIF')
    end
  end
  
end
