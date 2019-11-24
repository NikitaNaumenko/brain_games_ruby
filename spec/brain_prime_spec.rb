# frozen_string_literal: true

RSpec.describe BrainPrime do
  it 'run three times' do
    allow(Random).to receive(:rand).and_return(10, 11, 12)
    allow($stdin).to receive(:gets).and_return('apple', 'no', 'yes', 'no')

    expected = "Welcome to the Brain Games\nAnswer \"yes\" if given number is prime. Otherwise answer \"no\".\nMay, I have your name?\nHello, apple\nQuestion: 10\nYour answer?\nQuestion: 11\nYour answer?\nQuestion: 12\nYour answer?\nGrazias amigo apple\n"
    expect { BrainPrime.start! }.to output(expected).to_stdout_from_any_process
  end

  it 'run once' do
    allow(Random).to receive(:rand).and_return(10)
    allow($stdin).to receive(:gets).and_return('apple', 'yes')
    expected = "Welcome to the Brain Games\nAnswer \"yes\" if given number is prime. Otherwise answer \"no\".\nMay, I have your name?\nHello, apple\nQuestion: 10\nYour answer?\nyes is wrong answer ;( Correct answer is no\nLets try again apple\n"
    expect { BrainPrime.start! }.to output(expected).to_stdout_from_any_process
  end
end
