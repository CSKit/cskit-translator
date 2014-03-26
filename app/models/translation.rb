class Translation < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :user
  has_many :votes

  validates :translation, presence: true

  def display_time
	  created_at.to_time.strftime('%B %e, %Y at %l:%M %p')
  end

  # def best_translations
  #   find_by_sql("select * from  translations
  #     left join (select translation_id, sum(value) as score from votes group by translation_id) on translations.id = translation_id
  #     where phrase_id = 1
  #     order by score desc
  #     limit 1")
  # end

  def self.robot_translations_hash(phrase_ids)
    robot_trans = Hash.new
    phrase_ids.each do |p_id|
      robot_trans[p_id] = self.where(user_id: 1).where(phrase_id: p_id).pluck(:translation).first
    end

    return robot_trans
  end

  def auto?
    user_id == 1
  end

end
