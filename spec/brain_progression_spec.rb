# frozen_string_literal: true

RSpec.describe BrainProgression do
  before do
    stub_const("BrainProgression::PROGRESSION_LENGTH", 3)
    allow(BrainProgression).to receive(:generate_progression).and_return([10, 11, 12])
  end

  it 'run three times' do
    allow(Random).to receive(:rand).and_return(1, 10, 1, 1, 10, 1, 1, 10, 1)
    allow($stdin).to receive(:gets).and_return('apple', '11', '11', '11')

    expected = "Welcome to the Brain Games\nWhat number is missing in the progression?\nMay, I have your name?\nHello, apple\nQuestion: 10 .. 12\nYour answer?\nQuestion: 10 .. 12\nYour answer?\nQuestion: 10 .. 12\nYour answer?\nGrazias amigo apple\n"
    expect { BrainProgression.start! }.to output(expected).to_stdout_from_any_process
  end

  it 'run once' do
    allow(Random).to receive(:rand).and_return(1, 10, 1)
    allow($stdin).to receive(:gets).and_return('apple', '12')
    expected = "Welcome to the Brain Games\nWhat number is missing in the progression?\nMay, I have your name?\nHello, apple\nQuestion: 10 .. 12\nYour answer?\n12 is wrong answer ;( Correct answer is 11\nLets try again apple\n"
    expect { BrainProgression.start! }.to output(expected).to_stdout_from_any_process
  end

end
