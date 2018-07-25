class Micropost < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.content_max_length}
  validate  :picture_size

  scope :created_at_desc, ->{order created_at: :desc}
  following_ids = "SELECT followed_id FROM relationships
    WHERE follower_id = :user_id"
  scope :feed_microposts, (lambda do |id|
    where "user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id
  end)

  private

  def picture_size
    return unless picture.size > Settings.image_max_size_mb.megabytes
    errors.add :picture, I18n.t("less_than") +
                         Settings.image_max_size_mb.to_s + " MB"
  end
end
