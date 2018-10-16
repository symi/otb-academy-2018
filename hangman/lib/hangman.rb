class Hangman
  def initialize(words)
    @incorrect_guesses = IncorrectGuesses.new
    word_string = WordGenerator.new(words).to_s
    @word = Word.new(word_string)
  end

  def word
    @word.to_s
  end

  def guess(char)
    included = @word.contains?(char)
    if !included
      @incorrect_guesses.add(char)
    else
      @word.mark_matches(char)
    end

    included
  end

  def lives_lost
    @incorrect_guesses.guesses_count
  end

  def game_progress
    @word.progress
  end

  def incorrect_guesses
    @incorrect_guesses.guesses
  end

  def won
    word == game_progress
  end

  def lost
    lives_lost >= 3
  end
end

class IncorrectGuesses
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def add(char)
    if !guesses.include?(char)
      guesses << char
    end
  end

  def guesses_count
    guesses.length
  end
end

class WordGenerator
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def to_s
    words.sample
  end
end

class Word
  attr_reader :letters

  def initialize(word_string)
    @letters = word_string.split('').map { |char| Letter.new(char) }
  end

  def to_s
    (letters.map { |letter| letter.char }).join
  end

  def progress
    (letters.map { |letter| letter.to_s }).join
  end

  def contains?(char)
    to_s.include?(char)
  end

  def mark_matches(char)
    letters
      .select { |letter| letter.char == char }
      .each { |letter| letter.correct_guess }
  end
end

class Letter
  attr_reader :char, :display_char

  def initialize(char)
    @char = char
    @display_char = '_'
  end

  def correct_guess
    @display_char = char
  end

  def to_s
    display_char
  end
end
