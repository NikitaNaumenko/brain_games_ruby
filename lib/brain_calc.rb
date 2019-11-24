# frozen_string_literal: true

require 'brain_games_ruby/engine'

module BrainCalc
  TASK = 'What is the result of the expression?'
  OPERATORS = %w[+ - *].freeze

  def self.start!
    game_data = lambda {
      first = Random.rand(100)
      second = Random.rand(100)
      operator = OPERATORS.sample
      question = make_question(first, second, operator)
      answer = make_answer(first, second, operator)

      { question: question, answer: answer }
    }

    BrainGamesRuby::Engine.new(TASK, game_data).run!
  end

  def self.make_question(first, second, operator)
    "#{first} #{operator} #{second}"
  end

  def self.make_answer(first, second, operator)
    first.send(operator, second).to_s
  end
end
