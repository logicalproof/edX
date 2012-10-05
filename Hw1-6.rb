# Extend the currency-conversion example from lecture so that code such as the following will work:
# 
# 5.dollars.in(:euros)
# 10.euros.in(:rupees)


# You should support the currencies dollars, euros, rupees, yen where the conversions are:
# 
# rupees to dollars, multiply by 0.019,
# yen to dollars, multiply by 0.013,
# euro to dollars, multiply by 1.292.
# Both the singular and plural forms of each currency should be acceptable, e.g. 1.dollar.in(:rupees) 
# and 10.rupees.in(:euro) should work.


class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    self / @@currencies[singular_currency.to_s]
  end
end


# Adapt your solution from the "palindromes" question so that instead of writing palindrome?("foo") you 
# can write "foo".palindrome? (Hint: this should require fewer than 5 lines of code.)

class String
  def palindrome?
    string = self.gsub(/[^a-zA-Z0-9]/, '').gsub(" ", "").downcase
    if string == string.reverse
      return true
    else 
      return false
    end
  end
end


# It's not necessary for the collection's elements to be palindromes themselves--only that the top-level 
# collection be a palindrome. (Hint: this should require fewer than 5 lines of code.) Although hashes are 
# considered Enumerables, your solution does not need to work with hashes, though it should not error.

module Enumerable
  def palindrome?
    array = []
    self.each do |x|
      array << x
    end
    if array == array.reverse
      return true
    else return false
    end
  end
end



