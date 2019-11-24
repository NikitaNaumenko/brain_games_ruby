# frozen_string_literal: true

require 'brain_games_ruby/engine'
require 'prime'

module BrainPrime
  TASK = 'Answer "yes" if given number is prime. Otherwise answer "no".'

  def self.start!
    game_data = lambda {
      question = Random.rand(100)
      answer = question.prime? ? 'yes' : 'no'

      { question: question, answer: answer }
    }

    BrainGamesRuby::Engine.new(TASK, game_data).run!
  end
end
