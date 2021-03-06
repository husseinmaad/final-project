class Comment < ApplicationRecord
  belongs_to :commentor , class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :likes , as: :likeable

  validates :body, :commentor_id, :commentable_type, :commentable_id, presence: true


  def liked?(user)
    return self.likes.find_by(liker_id: user.id )
  end

end
