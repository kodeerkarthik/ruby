class Post < ActiveRecord::Base
	belongs_to :user
    mount_uploader :image, ImageUploader
    validates :title, presence: true, length: {minimum: 3}
  	validates :image, presence: true
	validates :body, presence: true
	
	scope :published, -> { where(published: false) }
	scope :notpublished, -> { where(published: true) }
end
