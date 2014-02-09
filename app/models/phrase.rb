class Phrase < ActiveRecord::Base
  has_many :translations

  def self.rand_phrase 
    Phrase.find(rand(Phrase.count) + 1)
  end

  def phrase_context
    if self.id == 1
      ['',Phrase.find(self.id + 1)]
    elsif self.id == Phrase.count
      [Phrase.find(self.id - 1), '']
    else
      [Phrase.find(self.id - 1), Phrase.find(self.id + 1)]
    end
  end

  def top_translations
    self.translations.reverse_order.limit(10).includes(:user)
  end

  def best_translation
    # self.translations.joins("LEFT OUTER JOIN votes ON translations.id = votes.translation_id").group(:translation_id).sum("value")
  end

end
