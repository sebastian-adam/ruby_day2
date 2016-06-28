require('rspec')
require('to_words')

describe('Fixnum#to_words') do
  it('can change numbers into words that are less than 20') do
    expect(0.to_words).to(eq("zero"))
    expect(9.to_words).to(eq("nine"))
    expect(13.to_words).to(eq("thirteen"))
    expect(18.to_words).to(eq("eighteen"))
  end

  it('can change numbers into words that are less than 100') do
    expect(34.to_words).to(eq("thirty four"))
    expect(58.to_words).to(eq("fifty eight"))
    expect(80.to_words).to(eq("eighty"))
  end

  it('can change numbers into words that are less than 1000') do
    expect(345.to_words).to(eq("three hundred forty five"))
    expect(581.to_words).to(eq("five hundred eighty one"))
    expect(800.to_words).to(eq("eight hundred"))
  end

  it('can change numbers into words that are less than 1,000,000') do
    expect(10432.to_words).to(eq("ten thousand four hundred thirty two"))
    expect(345445.to_words).to(eq("three hundred forty five thousand four hundred forty five"))
    expect(800000.to_words).to(eq("eight hundred thousand"))
  end

  it('can change numbers into words that are less than 1,000,000,000') do
    expect(10432111.to_words).to(eq("ten million four hundred thirty two thousand one hundred eleven"))
    expect(345445232.to_words).to(eq("three hundred forty five million four hundred forty five thousand two hundred thirty two"))
    expect(800000000.to_words).to(eq("eight hundred million"))
  end

  it('can change numbers into words that are less than or equal to 1,000,000,000,000') do
    expect(10432111111.to_words).to(eq("ten billion four hundred thirty two million one hundred eleven thousand one hundred eleven"))
    expect(345445232222.to_words).to(eq("three hundred forty five billion four hundred forty five million two hundred thirty two thousand two hundred twenty two"))
    expect(800000000000.to_words).to(eq("eight hundred billion"))
    expect(111111111111.to_words).to(eq("one hundred eleven billion one hundred eleven million one hundred eleven thousand one hundred eleven"))
    expect(1000000000000.to_words).to(eq("one trillion"))
  end
end
