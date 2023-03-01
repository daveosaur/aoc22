def parse_string_array(string) stack = [] # create an 
  empty stack result = [] # create an empty result 
  array current = "" # create an empty current string 
  string.each_char do |char| # iterate over each 
  character in the string
    if char == "[" # if the character is an opening 
    bracket
      stack.push(result) # push the current result 
      array to the stack stack.push(current) # push the 
      current string to the stack result = [] # reset 
      the result array
      current = "" # reset the current string
elsif char == "]" # if the character is a closing 
bracket
      result << current.to_i unless current.empty? # 
      append the current string as an integer to the 
      result array unless it is empty current = 
      stack.pop # pop the previous string from the 
      stack and assign it to current
      prev_result = stack.pop 
# pop the previous result array from the stack and 
# assign it to prev_result
      prev_result << result # append the current result 
      array to prev_result result = prev_result # 
      assign prev_result to result
    elsif char == "," # if the character is a comma 
      result << current.to_i unless current.empty? # 
      append the current string as an integer to the 
      result array unless it is empty current = "" # 
      reset the current string
    else # otherwise current << char # append the 
      character to the current string
    end end
  return result.first # return 
the first element of result, which is our final parsed 
array end string = "[[1],[2,3,4]]" array = 
parse_string_array(string)
puts array.inspect # prints [[1], [2, 3, 4]]
