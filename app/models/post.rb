class Post < ApplicationRecord

  has_one_attached :image
  acts_as_taggable_on :tags
  belongs_to :user

  validates :image, presence: true
  validates :title, presence: true
  validates :body, presence: true



  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-post-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
