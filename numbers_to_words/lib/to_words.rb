class Fixnum
  define_method(:to_words) do
    numbers_words_base = {
      nil=>"", 0=>"", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"
    }
    numbers_words_teens = {
      nil=>"", 0=>"ten", 1=>"eleven", 2=>"twelve", 3=>"thirteen", 4=>"fourteen", 5=>"fifteen", 6=>"sixteen", 7=>"seventeen", 8=>"eighteen", 9=>"nineteen"
    }
    numbers_words_tens = {
      nil=>"", 0=>"", 1=>"ten", 2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"
    }


    split_digits = to_s.split('').reverse.map(&:to_i)

    base = numbers_words_base.fetch(split_digits[0])
    if (numbers_words_tens.fetch(split_digits[1]) == "ten") && (numbers_words_tens.fetch(split_digits[0]) != "")
      tens = numbers_words_teens.fetch(split_digits[0])
      base = ""
    else
      tens = numbers_words_tens.fetch(split_digits[1])
    end
    hundreds = numbers_words_base.fetch(split_digits[2])
    thousands = numbers_words_base.fetch(split_digits[3])
    if (numbers_words_tens.fetch(split_digits[4]) == "ten") && (numbers_words_tens.fetch(split_digits[3]) != "")
      ten_thousands = numbers_words_teens.fetch(split_digits[3])
      thousands = ""
    else
      ten_thousands = numbers_words_tens.fetch(split_digits[4])
    end
    hundred_thousands = numbers_words_base.fetch(split_digits[5])
    millions = numbers_words_base.fetch(split_digits[6])
    if (numbers_words_tens.fetch(split_digits[7]) == "ten") && (numbers_words_tens.fetch(split_digits[6]) != "")
      ten_millions = numbers_words_teens.fetch(split_digits[6])
      millions = ""
    else
      ten_millions = numbers_words_tens.fetch(split_digits[7])
    end
    hundred_millions = numbers_words_base.fetch(split_digits[8])
    billions = numbers_words_base.fetch(split_digits[9])
    if (numbers_words_tens.fetch(split_digits[10]) == "ten") && (numbers_words_tens.fetch(split_digits[9]) != "")
      ten_billions = numbers_words_teens.fetch(split_digits[9])
      billions = ""
    else
      ten_billions = numbers_words_tens.fetch(split_digits[10])
    end
    hundred_billions = numbers_words_base.fetch(split_digits[11])


    if hundreds != ""
      h = " hundred "
    else
      h = ""
    end
    if thousands != "" || ten_thousands != "" || ten_thousands && hundred_thousands != ""
      t = " thousand "
    else
      t = ""
    end
    if hundred_thousands != ""
      ht = " hundred "
    else
      ht = ""
    end
    if millions != "" || ten_millions != "" || ten_millions && hundred_millions != ""
      m = " million "
    else
      m = ""
    end
    if hundred_millions != ""
      hm = " hundred "
    else
      hm = ""
    end
    if billions != "" || ten_billions != "" || ten_billions && hundred_billions != ""
      b = " billion "
    else
      b = ""
    end
    if hundred_billions != ""
      hb = " hundred "
    else
      hb = ""
    end


    if self == 0
      "zero"
    elsif self > 0 && self < 10
      base
    elsif self >= 10 && self < 100
      (tens + " " + base).gsub(/[ \t]+$/, "")
    elsif self >= 100 && self < 1000
      (hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 1000 && self < 10000
      (thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "")
    elsif self >= 10000 && self < 100000
      (ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 100000 && self < 1000000
      (hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 1000000 && self < 10000000
      (millions + m + hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 10000000 && self < 100000000
      (ten_millions + " " + millions + m + hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 100000000 && self < 1000000000
      (hundred_millions + hm + ten_millions + " " + millions + m + hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 1000000000 && self < 10000000000
      (billions + b + hundred_millions + hm + ten_millions + " " + millions + m + hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 10000000000 && self < 100000000000
      (ten_billions + " " + billions + b + hundred_millions + hm + ten_millions + " " + millions + m + hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self >= 100000000000 && self < 1000000000000
      (hundred_billions + hb + ten_billions + " " + billions + b + hundred_millions + hm + ten_millions + " " + millions + m + hundred_thousands + ht + ten_thousands + " " + thousands + t + hundreds + h + tens + " " + base).gsub(/[ \t]+$/, "").gsub(/\s\s+/, " ")
    elsif self == 1000000000000
      "one trillion"
    end
  end
end

# three hundred forty five thousand four hundred forty five"
