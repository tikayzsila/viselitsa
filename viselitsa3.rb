if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
  end

current_path = "./" + File.dirname(__FILE__)

require_relative 'game'
require_relative 'ResultPrinter'
require_relative 'word_reader'

reader = WordReader.new

printer = ResultPrinter.new

word_reader = WordReader.new

slovo = File.dirname(__FILE__) + '/data/words.txt'

game = Game.new(word_reader.read_from_file(slovo))

while game.status == 0 do 

    printer.print_status(game)

    game.ask_next_letter

end

printer.print_status(game)