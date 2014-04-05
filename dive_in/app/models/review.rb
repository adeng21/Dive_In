class Review < ActiveRecord::Base

  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :rating, presence: true, inclusion: {:in => 1..5}
  validates :user_id, presence: true
  validates :divesite_id, presence: true

  belongs_to :user, inverse_of: :reviews
  belongs_to :divesite, inverse_of: :reviews

end
