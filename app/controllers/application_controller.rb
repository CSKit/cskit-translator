class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def surrounding_text(current_phrase)
    key_number = current_phrase.id
    if key_number == 1
      Phrase.find(key_number + 1)
    else
      Phrase.find(key_number - 1, key_number + 1)
    end
  end
end
