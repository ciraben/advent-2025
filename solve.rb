# grab the problem set number from input args
problem_to_solve = ARGV[0].match(/^([0-9]+)(b)?$/)

# expect somn like `ruby solve.rb 1b`
if not problem_to_solve
  puts "idk that arg - try somn like '1b'"
  exit
end

require_relative "solve/" << problem_to_solve[0]

problem_num, bee = problem_to_solve.captures

if bee
  soln = Solution_B.new data problem_num
else
  soln = Solution.new data problem_num
end

puts soln.password
