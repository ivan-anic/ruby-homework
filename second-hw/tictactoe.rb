require_relative 'Board'

# Create a game of tic-tac-toe
# mark fields with X and O
board = Board.new()

# you don't need to detect when somebody won
# you don't need to put in a quit condition (use Ctrl + C)
loop do
	# at the beginning of each round the full game board has to be drawn
	puts board
	# indicate which player's turn it is
	puts "Player '#{board.currentPlayer}' move."
	#  ask the user in which field they want to put their symbol
	puts "Where do you want to put a circle [0-8]?"
	field = gets.chomp.to_i

	#  don't allow users to override a previously set X or O
	if board.isOccupied(field)
		puts "That field is already occupied! Try again."
	else
		board.fill(field)
	end
end