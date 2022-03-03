require_relative 'word'
require_relative 'game'
require_relative 'utility'

LETTERS = 5
game = Game.new(LETTERS)

clear_screen()
until game.solved? or game.lost?
  print "Guess a #{LETTERS}-letter long word: "
  answ = gets.chomp.upcase
  clear_line_above()
  next if answ.length != LETTERS or not Word.exists?(answ)
  game.guess_word(answ)
  game.pretty_print(answ)
end

if game.solved?
  puts "#{GREEN}You guessed the word!#{RESET}"
else
  puts "#{YELLOW}You lost. The word was #{GREEN}#{game.solution}#{RESET}"
end
