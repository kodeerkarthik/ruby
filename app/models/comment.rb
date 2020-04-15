class Comment < ActiveRecord::Base
  belongs_to :article
  validates :username, presence: true,
                    length: { minimum: 3 }
end
