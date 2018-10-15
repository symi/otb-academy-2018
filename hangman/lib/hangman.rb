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
  def initialize
    @guesses = []
  end

  def add(char)
    if !@guesses.include?(char)
      @guesses << char
    end
  end

  def guesses
    @guesses
  end

  def guesses_count
    @guesses.length
  end
end

class WordGenerator
  def initialize(words)
    @words = words
  end

  def to_s
    @words.sample
  end
end

class Word
  def initialize(word_string)
    @letters = word_string.split('').map { |char| Letter.new(char) }
  end

  def letters
    @letters
  end

  def to_s
    (@letters.map { |letter| letter.char }).join
  end

  def progress
    (@letters.map { |letter| letter.to_s }).join
  end

  def matched_chars(char)
    @letters.select { |letter| letter.char == char }
  end

  def contains?(char)
    to_s.include?(char)
  end

  def mark_matches(char)
    matched_chars(char).each { |letter| letter.correct_guess }
  end
end

class Letter
  def initialize(char)
    @char = char
    @correct_guess = false
  end

  def char
    @char
  end

  def correct_guess
    @correct_guess = true
  end

  def to_s
    if @correct_guess
      char
    else
      '_'
    end
  end
end
