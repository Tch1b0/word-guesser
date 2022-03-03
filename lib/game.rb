require_relative 'utility'

class Game
  def initialize(word_letters)
    @solution = Word.random(letters: word_letters)
    @guessed_words = []
    @solved = false
    @lost = false
  end

  def guess_word(word)
    @guessed_words.append(word)
    if word == @solution
      @solved = true
    elsif @guessed_words.size == 5
      @lost = true
    end
  end

  def pretty_print(word)
    word.each_char {|c| print "----- "}
    puts
    (0..(word.length-1)).each do |i|
      c = word[i] 
      color = RESET
      if @solution[i] == c
        color = GREEN
      elsif @solution.include?(c)
        color = YELLOW
      end
      print "| #{color}#{c}#{RESET} | "
    end
    puts
    word.each_char {|c| print "----- "}
    puts
  end

  def solved?
    @solved
  end

  def solved!
    @solved = true
  end

  def solution
    @solution
  end

  def lost?
    @lost
  end
end
