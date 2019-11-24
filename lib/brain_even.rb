# frozen_string_literal: true

require 'brain_games_ruby/engine'

module BrainEven
  TASK = 'Answer "yes" if the number is even, otherwise answer "no".'

  def self.start!
    game_data = lambda {
      question = Random.rand(100)
      answer = Integer.even?(question) ? 'yes' : 'no'

      { question: question, answer: answer }
    }

    BrainGamesRuby::Engine.new(TASK, game_data).run!
  end
end
