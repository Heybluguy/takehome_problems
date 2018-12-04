# frozen_string_literal: true
require './score_key'

class Scoring
  def initialize(language = ENGLISH)
    @score_key = handle_language(language)
  end

    def handle_language(language)
      return SPANISH if language == :spanish
      language
    end

  def score_letter(letter)
    return @score[letter.upcase] if defined? @score[letter.upcase]
    @score = {}
    @score_key.each {|letters, points| letters.each {|letter| @score[letter] = points}}
    @score[letter.upcase]
  end

  def score_word(word)
    word.split(//).map { |letter| score_letter(letter)}.sum
  end
end