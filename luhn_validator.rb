module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    # reverse nums_a 
    nums_rev = nums_a.reverse

    # iterate through the reversed array, n double every second digit, from idx 0
    nums_rev.each_with_index do |num, idx|
      if idx.odd?
        nums_rev[idx] = num * 2
        # if doubling result > 9, subtract by 9
        if nums_rev[idx] > 9
          nums_rev[idx] -= 9
        end
      end
    end

    # sum all the digits
      total_num = nums_rev.sum

      # if sum % 10 == 0, return true, else false
      rem = total_num % 10

      if rem == 0 
        return true
      else 
        return false
      end


  end
end
