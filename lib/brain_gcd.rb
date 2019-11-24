# frozen_string_literal: true

require 'brain_games_ruby/engine'

module BrainGcd
  TASK = 'Find the greatest common divisor of given numbers.'

  def self.start!
    game_data = lambda {
      first = Random.rand(100)
      second = Random.rand(100)
      question = "#{first} #{second}"
      answer = find_gcd(first, second)

      { question: question, answer: answer }
    }

    BrainGamesRuby::Engine.new(TASK, game_data).run!
  end

  def self.find_gcd(first, second)
    return first.to_s if second.zero?

    find_gcd(second, first % second)
  end
end
