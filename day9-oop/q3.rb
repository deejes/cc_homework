def is_prime (num)
  for x in 2...num
    if num%x ==0
      return false
    end
    return true
  end
end


puts is_prime(10000)
