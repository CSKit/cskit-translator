class User < ActiveRecord::Base
  has_many :translations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
	if name.blank?
		"Anonymous"
		else
		name
	end
  end

end
