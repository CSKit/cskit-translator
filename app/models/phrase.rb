class Phrase < ActiveRecord::Base
  has_many :translations

  # Returns the translation in each locale with the highest number of votes
  # for the given list of phrase ids.
  def self.best_translations_for(phrase_ids)
    votes = Vote.arel_table
    phrases = Phrase.arel_table
    translations = Translation.arel_table

    # Find all the translations that belong to this phrase and sum up
    # their individual vote values.
    inner_query = Translation
      .select(translations[Arel.star])                   # All translation columns
      .select(votes[:value].sum.as("vote_sum"))          # Add all `value` fields together
      .joins(
        translations.join(phrases).on(                   # join 'phrases' to eventually filter by only desired phrases
          phrases[:id].eq(translations[:phrase_id])
        ).join_sources
      )
      .joins(
        translations.join(votes).on(                     # join 'votes' so we can sum their values (see above)
          votes[:translation_id].eq(translations[:id])
        ).join_sources
      )
      .where(phrases[:id].in(phrase_ids))                # only get translations for desired phrases
      .group(votes[:translation_id])                     # collapse on `translation_id` so there's
                                                         #   only one row returned per group of votes

    # dummy intermedate table that we'll use to reference all
    # the logic contained within inner_query
    trans_counts = Arel::Table.new('trans_counts')

    # Now that we've got a list of translations and their corresponding
    # summed vote values, we can select the maximum vote value per locale.
    Translation
      .select([                                                 # All relevant columns from inner_query
        trans_counts[:id], trans_counts[:translation],
        trans_counts[:phrase_id], trans_counts[:user_id],
        trans_counts[:locale]
      ])
      .select(trans_counts[:vote_sum].maximum.as('vote_sum'))   # Pick the translation with the maximum vote sum
      .from(inner_query.as(trans_counts.name))                  # Do all this on the inner_query's results
      .group(trans_counts[:locale])                             # Only return one result (translation) per locale
  end

  # Returns the translation in each locale with the highest number of votes
  # for this phrase.
  def best_translations
    self.class.best_translations_for([self.id])
  end
end