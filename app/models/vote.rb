class Vote < ActiveRecord::Base
  has_and_belongs_to_many :translations
  has_and_belongs_to_many :users
end
