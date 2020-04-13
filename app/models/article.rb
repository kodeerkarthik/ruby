class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :admin
  validates :title, presence: true, length: {minimum: 5}
end
