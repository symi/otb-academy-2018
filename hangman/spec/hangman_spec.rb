require 'hangman'

describe 'the game hangman' do
  let (:single_dictonary) { ['test'] }

  it 'return word from dictionary' do
    hangman = Hangman.new(single_dictonary)

    expect(hangman.word).to eq('test')
  end

  it 'detects when a correct char guess' do
    hangman = Hangman.new(single_dictonary)
    expect(hangman.guess('e')).to be(true)
  end

  it 'detects when an incorrect char guess' do
    hangman = Hangman.new(single_dictonary)
    expect(hangman.guess('z')).to be(false)
  end

  it 'increments lives lost when an incorrct guess' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('z')
    expect(hangman.lives_lost).to be(1)
  end

  it 'shows game process of no matches as underscores' do
    hangman = Hangman.new(single_dictonary)
    expect(hangman.game_progress).to eq('____')
  end

  it 'shows a bucket of incorrect guesses' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('z')
    expect(hangman.incorrect_guesses).to eq(['z'])
  end

  it 'keeps incorrect guesses after a correct guess' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('z')
    expect(hangman.incorrect_guesses).to eq(['z'])
    hangman.guess('t')
    expect(hangman.incorrect_guesses).to eq(['z'])
    expect(hangman.lives_lost).to eq(1)
  end

  it 'shows game progress of a single match as the matched letter' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('e')
    expect(hangman.game_progress).to eq('_e__')
  end

  it 'shows game progress of a double match as the matche letters' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('t')
    expect(hangman.game_progress).to eq('t__t')
  end

  it 'returns won as false when the game is on going' do
    hangman = Hangman.new(single_dictonary)
    expect(hangman.won).to eq(false)
  end

  it 'returns won as true when the game if successfully finished' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('t')
    hangman.guess('e')
    hangman.guess('s')
    expect(hangman.won).to eq(true)
  end

  it 'return lost as false when the game is on going' do
    hangman = Hangman.new(single_dictonary)
    expect(hangman.lost).to eq(false)
  end

  it 'return lost as true when no lives remaining' do
    hangman = Hangman.new(single_dictonary)
    hangman.guess('x')
    hangman.guess('y')
    hangman.guess('z')
    expect(hangman.lost).to eq(true)
  end

  context 'WordGenerator' do
    it 'picks a word' do
      word_generator = WordGenerator.new(['test'])
      expect(word_generator.to_s).to eq('test')
    end

    it 'returns a random word' do
      word_generator = WordGenerator.new(['test', 'apple'])
      expect(['test', 'apple']).to include(word_generator.to_s)
    end
  end

  context 'Word' do
    it 'returns array of Letters for a word string' do
      word = Word.new('a')
      expect(word.letters[0].char).to eq('a')
    end

    it 'returns if a char exists in the word' do
      word = Word.new('abc')
      expect(word.contains?('a')).to be(true)
    end

    it 'marks all characters in the word which matched' do
      word = Word.new('abc')
      word.mark_matches('a')
      expect(word.letters[0].to_s).to eq('a')
      expect(word.letters[1].to_s).to eq('_')
    end
  end


  context 'sucessful full game' do
    hangman = Hangman.new(['test'])

    it 'turn 0' do
      expect(hangman.lives_lost).to eq(0)
      expect(hangman.game_progress).to eq('____')
      expect(hangman.incorrect_guesses).to eq([])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(false)
    end

    it 'turn 1' do
      hangman.guess('x')

      expect(hangman.lives_lost).to eq(1)
      expect(hangman.game_progress).to eq('____')
      expect(hangman.incorrect_guesses).to eq(['x'])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(false)
    end

    it 'turn 2' do
      hangman.guess('t')

      expect(hangman.lives_lost).to eq(1)
      expect(hangman.game_progress).to eq('t__t')
      expect(hangman.incorrect_guesses).to eq(['x'])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(false)
    end

    it 'turn 3 and 4' do
      hangman.guess('e')
      hangman.guess('s')

      expect(hangman.lives_lost).to eq(1)
      expect(hangman.game_progress).to eq('test')
      expect(hangman.incorrect_guesses).to eq(['x'])
      expect(hangman.won).to be(true)
      expect(hangman.lost).to be(false)
    end
  end

  context 'not successful full game' do
    hangman = Hangman.new(['test'])

    it 'turn 0' do
      expect(hangman.lives_lost).to eq(0)
      expect(hangman.game_progress).to eq('____')
      expect(hangman.incorrect_guesses).to eq([])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(false)
    end

    it 'turn 1' do
      hangman.guess('x')

      expect(hangman.lives_lost).to eq(1)
      expect(hangman.game_progress).to eq('____')
      expect(hangman.incorrect_guesses).to eq(['x'])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(false)
    end

    it 'turn 2' do
      hangman.guess('t')

      expect(hangman.lives_lost).to eq(1)
      expect(hangman.game_progress).to eq('t__t')
      expect(hangman.incorrect_guesses).to eq(['x'])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(false)
    end

    it 'turn 3 and 4' do
      hangman.guess('x')
      hangman.guess('y')
      hangman.guess('z')

      expect(hangman.lives_lost).to eq(3)
      expect(hangman.game_progress).to eq('t__t')
      expect(hangman.incorrect_guesses).to eq(['x', 'y', 'z'])
      expect(hangman.won).to be(false)
      expect(hangman.lost).to be(true)
    end
  end
end
