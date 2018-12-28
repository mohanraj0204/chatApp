class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  def self.most_recent
    order(:created_at).last(20)
  end
end
