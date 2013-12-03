require 'pry'
class PigLatinTranslation
  attr_reader :new_phrase
  def initialize(phrase)
    @phrase = phrase
  end

  #provide the pig latin translation
  def translate
    @new_phrase = []
    words
    @phrase.each do |word|
      starts_with_vowel?(word) ? @new_phrase << vowel_changer(word) : @new_phrase << consonant_changer(word)
    end
  end

  def output
    @new_phrase.each do |word|
      print word + ' '
    end
    puts
  end
  private
  #an array of words in the phrase
  def words
    @phrase = @phrase.split(' ')
  end

  def starts_with_vowel?(word)
    word.downcase[0] =~ /[aeiou]/
  end

  def vowel_changer(word)
    word + 'way'
  end

  def consonant_changer(word)
    @word_array = word.split('')
    until starts_with_vowel?(@word_array.join)
    @word_array.insert(@word_array.length - 1, @word_array.delete_at(0))
    end
    @word_array.join + 'ay'
  end
end

phrase = PigLatinTranslation.new("apple of the morning channel school")
phrase.translate
phrase.output