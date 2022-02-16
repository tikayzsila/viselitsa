require 'rspec'
require_relative '../game'
describe 'Game' do

  it 'user wins the game' do

    # Загадываем слово
    game = Game.new('слово')
    expect(game.status).to eq :in_progress

    # Удачно отгадаем несколько букв, симулируя действия игрока
    game.next_step 'с'
    game.next_step 'о'
    game.next_step 'в'
    game.next_step 'л'
    #состояние экземпляра game: количество ошибок и статус
    expect(game.errors).to eq 0
    expect(game.status).to eq :won
  end
  it 'user wins the game' do

    # Загадываем слово
    game = Game.new('астма')
    game.next_step 'к'
    game.next_step 'п'
    game.next_step 'р'
    game.next_step 'о'
    game.next_step 'л'
    game.next_step 'щ'
    game.next_step 'н'
    game.next_step 'й'
    expect(game.errors).to eq 7
    expect(game.status).to eq :lost
    end
end