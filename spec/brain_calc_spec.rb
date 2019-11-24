# frozen_string_literal: true

RSpec.describe BrainCalc do
  before do
    stub_const('BrainCalc::OPERATORS', %w[+ - *])
    allow(BrainCalc::OPERATORS).to receive(:sample).and_return('+')
  end

  it 'run three times' do
    allow(Random).to receive(:rand).and_return(10, 10, 11, 11, 12, 12)
    allow($stdin).to receive(:gets).and_return('apple', '20', '22', '24')

    expected = "Welcome to the Brain Games\nWhat is the result of the expression?\nMay, I have your name?\nHello, apple\nQuestion: 10 + 10\nYour answer?\nQuestion: 11 + 11\nYour answer?\nQuestion: 12 + 12\nYour answer?\nGrazias amigo apple\n"
    expect { BrainCalc.start! }.to output(expected).to_stdout_from_any_process
  end

  it 'run once' do
    allow(Random).to receive(:rand).and_return(10, 10)
    allow(BrainCalc::OPERATORS).to receive(:sample).and_return('+')
    allow($stdin).to receive(:gets).and_return('apple', '12')
    expected = "Welcome to the Brain Games\nWhat is the result of the expression?\nMay, I have your name?\nHello, apple\nQuestion: 10 + 10\nYour answer?\n12 is wrong answer ;( Correct answer is 20\nLets try again apple\n"
    expect { BrainCalc.start! }.to output(expected).to_stdout_from_any_process
  end
end
