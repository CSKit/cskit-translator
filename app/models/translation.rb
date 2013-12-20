class Translation < ActiveRecord::Base
  belongs_to :phrase

  validates :translation, presence: true
end