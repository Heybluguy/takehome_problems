# frozen_string_literal: true
require './score_key'

class Scoring
  def initialize(language = ENGLISH)
    @score_key = handle_language(language)
  end

  def score_letter(letter)
    @score_key.each {|key, value| return value if key.include?(key.upcase)}
    # @score_key[letter]
  end

  def score_word(word)
    word.split(//).map {|letter| score_letter(letter)}.sum
  end

  def handle_language(language)
    language == :spanish ? SPANISH : language
  end
end