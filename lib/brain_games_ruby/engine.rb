# frozen_string_literal: true

module BrainGamesRuby
  class Engine
    ROUNDS_COUNT = 3
    INIT_ROUND = 1

    def initialize(task, game)
      @task = task
      @game = game
    end


    attr_reader :task, :game

    def run!
      STDOUT.puts 'Welcome to the Brain Games'
      STDOUT.puts task

      puts 'May, I have your name?'
      name = STDIN.gets.chomp
      STDOUT.puts "Hello, #{name}"

      iter = lambda { |counter|
        if counter > ROUNDS_COUNT
          STDOUT.puts "Grazias amigo #{name}"
          return
        end

        game_data = game.call
        question = game_data[:question]
        answer = game_data[:answer]
        
        STDOUT.puts "Question: #{question}"
        STDOUT.puts "Your answer?"
        user_answer = STDIN.gets.chomp
        if answer != user_answer
          STDOUT.puts "#{user_answer} is wrong answer ;( Correct answer is #{answer}"
          STDOUT.puts "Lets try again #{name}"
          return
        end

        iter.call(counter + 1)
      }

      iter.call(1)
    end
  end
end
