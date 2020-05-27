class Article < ActiveRecord::Base
  resourcify
  has_many :comments
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
  validates :text, presence: true

  mount_uploaders :images, FileUploader
end
