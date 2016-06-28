require('rspec')
require('scrabble_score')

describe('String#scrabble_score') do
  it('returns a score for a letter') do
    expect("a".scrabble()).to(eq(1))
    expect("d".scrabble()).to(eq(2))
    expect("m".scrabble()).to(eq(3))
    expect("f".scrabble()).to(eq(4))
    expect("k".scrabble()).to(eq(5))
    expect("j".scrabble()).to(eq(8))
    expect("z".scrabble()).to(eq(10))
  end

  it('returns a score for one word') do
    expect("pizza".scrabble()).to(eq(25))
  end

  it('returns a score for a sentence') do
    expect("i want pizza".scrabble()).to(eq(33))
  end
end
