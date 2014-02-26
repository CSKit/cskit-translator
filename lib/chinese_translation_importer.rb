class ChineseTranslationImporter
  class << self

    def import
      clear_table("translations")
      user = create_autotranslation_user
      create_translations_from("lib/cskit-translator-seed-zh.txt", user)
    end

    private

    def clear_table(table)
      if Rails.env.development?
        ActiveRecord::Base.connection.execute(
          "delete from `#{table}`; delete from sqlite_sequence where name='#{table}';"
        )
      else
        ActiveRecord::Base.connection.execute(
          "truncate table `#{table}`;"
        )
      end
    end

    def create_autotranslation_user
      User
        .where(:email => 'cshackathon@gmail.com')
        .first_or_create(
          :password => 'this_is_not_a_password',
          :name => 'autotranslation'
        )
    end

    def create_translations_from(file, user)
      File.open(file, "r").each_line do |line|
        translation, phrase_id, locale = line.split('|')
        Translation.where(
          user_id: user.id,
          phrase_id: phrase_id,
          locale: "zh"
        ).first_or_create(
          translation: translation
        )
      end
    end

  end
end