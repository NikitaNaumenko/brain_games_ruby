# frozen_string_literal: true

require 'brain_games_ruby/engine'

module BrainEven
  def self.start!
    task = 'Answer "yes" if the number is even, otherwise answer "no".'

    game_data = lambda {
      question = Random.rand(100)
      answer = is_even?(question) ? 'yes' : 'no'

      { question: question, answer: answer }
    }

    BrainGamesRuby::Engine.new(task, game_data).run!
  end

  def self.is_even?(num)
    num % 2 == 0
  end
end
