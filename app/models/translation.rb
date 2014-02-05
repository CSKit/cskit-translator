class Translation < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :user

  validates :translation, presence: true
end
