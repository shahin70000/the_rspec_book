# module Codebreaker
#   class Game
#   	def initialize(output)
#   		@output = output
#   	end

#     def start(secret)
#     	@secret = secret
#       @output.puts 'Welcome to Codebreaker!'
#     	@output.puts 'Enter guess:'
#     end

#     def guess(guess)
#       plus_mark = ''
#       minus_mark = ''
#       mark = ''

#       (0..3).each do |index|
#         if exact_match?(guess, index)
#           plus_mark << '+'
#         elsif number_match?(guess, index)
#           minus_mark << '-'
#         end
#       end
#       mark << plus_mark
#       mark << minus_mark      
#       @output.puts mark
#     end

#     def exact_match?(guess, index)
#       @secret[index] == guess[index]
#     end

#     def number_match?(guess, index)
#       @secret.include?(guess[index])
#     end

#   end
# end

module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      @output.puts '+'*exact_match_count(guess) + '-'*number_match_count(guess)
    end

    def exact_match?(guess, index)
      guess[index] == @secret[index]
    end

    def number_match?(guess, index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)
    end

    def exact_match_count(guess)
      (0..3).inject(0) do |count, index|
        count + (exact_match?(guess, index) ? 1 : 0 )
      end
    end

    def number_match_count(guess)
      (0..3).inject(0) do |count, index|
        count + (number_match?(guess, index) ? 1 : 0 )
      end
    end
  end
end