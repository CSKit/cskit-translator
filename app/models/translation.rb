class Translation < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :user

  validates :translation, presence: true
  
  def display_time
	  created_at.to_time.strftime('%B %e, %Y at %l:%M %p')
  end
  
end
