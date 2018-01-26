# frozen_string_literal: true

class Scoring
  DEFAULT_LANGUAGE = :english

  LANGUAGE_SCORES = {
    :english => {
      1 => %w[E A I O N R T L S U],
      2 => %w[D G],
      3 => %w[B C M P],
      4 => %w[F H V W Y],
      5 => %w[K],
      8 => %w[J X],
      10 => %w[Q Z],
    },
    :spanish => {
      1 => %w[A E O S I U N L R T],
      2 => %w[C D G],
      3 => %w[B M P],
      4 => %w[F H V Y],
      6 => %w[J],
      8 => %w[K LL Ñ Q RR W X],
      10 => %w[Z],
    }
  }

  def initialize(language)
    raise ArgumentError.new("invalid language: #{language}") unless LANGUAGE_SCORES.keys.include?(language)
    @letter_hash = {}
    LANGUAGE_SCORES[language].keys.each{|k| LANGUAGE_SCORES[language][k].each{|v| @letter_hash[v] = k}}
  end

  def score_letter(letter)
    val = @letter_hash[letter]
    raise ArgumentError.new("invalid letter: #{letter}") unless val
    val
  end
end
