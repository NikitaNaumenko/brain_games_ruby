# frozen_string_literal: true

require 'brain_games_ruby/engine'

module BrainProgression
  TASK = 'What number is missing in the progression?'
  PROGRESSION_LENGTH = 10

  def self.start!
    game_data = lambda {
      step = Random.rand(100)
      start = Random.rand(100)
      progression = generate_progression(start, step)
      hidden_element_index = Random.rand(PROGRESSION_LENGTH - 1)
      answer = (start + hidden_element_index * step).to_s
      question = create_question(progression, hidden_element_index)

      { question: question, answer: answer }
    }

    BrainGamesRuby::Engine.new(TASK, game_data).run!
  end

  def self.generate_progression(start, step)
    finish = start + step * PROGRESSION_LENGTH
    progression = start..finish
    progression.step(step).to_a
  end

  def self.create_question(progression, hidden_element_index)
    progression.map.with_index { |x, i| i == hidden_element_index ? '..' : x }.join(' ')
  end
end
