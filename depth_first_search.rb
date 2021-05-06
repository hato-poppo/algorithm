def depth_first_search
  patterns = []
  stack = ['']
  until stack.empty?
    string = stack.pop
    p string
    patterns << string unless string.empty?
    if string.length != 3
      stack << string + 'C'
      stack << string + 'B'
      stack << string + 'A'
    end
  end
  patterns
end

patterns = depth_first_search
p patterns

# strung
# => ""
# => "A"
# => "AA"
# => "AAA"
# => "AAB"
# => "AAC"
# => "AB"
# => "ABA"
# => "ABB"
# => "ABC"
# => "AC"
# => "ACA"
# => "ACB"
# => "ACC"
# => "B"
# => "BA"
# => "BAA"
# => "BAB"
# => "BAC"
# => "BB"
# => "BBA"
# => "BBB"
# => "BBC"
# => "BC"
# => "BCA"
# => "BCB"
# => "BCC"
# => "C"
# => "CA"
# => "CAA"
# => "CAB"
# => "CAC"
# => "CB"
# => "CBA"
# => "CBB"
# => "CBC"
# => "CC"
# => "CCA"
# => "CCB"
# => "CCC"

# patterns
# => ["A", "AA", "AAA", "AAB", "AAC", "AB", "ABA", "ABB", "ABC", "AC", "ACA", "ACB", "ACC", "B", "BA", "BAA", "BAB", "BAC", "BB", "BBA", "BBB", "BBC", "BC", "BCA", "BCB", "BCC", "C", "CA", "CAA", "CAB", "CAC", "CB", "CBA", "CBB", "CBC", "CC", "CCA", "CCB", "CCC"]
