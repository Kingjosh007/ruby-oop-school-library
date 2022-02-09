require_relative '../corrector'

describe Corrector do
  context 'When testing the Corrector class' do
    it 'it should correct the name' do
      corrector = Corrector.new
      expect(corrector.correct_name('kingjosaphat').match?(/\A[A-Z]/)).to be true
      expect(corrector.correct_name('kingjosaphat').length).to be_between(1, 10).inclusive
    end
  end
end
