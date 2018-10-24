class Board
	attr_accessor :fields
	attr_accessor :currentPlayer

#  mark empty fields with numbers from 0 to 8, starting in the top left field
#  the user O always goes first
#  the user X always goes second
	def initialize()
		@fields = [0, 1, 2, 3, 4, 5, 6, 7, 8]

		@currentPlayer = "O"
	end

	def to_s
		"\n[ #{@fields[0]} ] [ #{@fields[1]} ] [ #{@fields[2]} ]\n" +
		"[ #{@fields[3]} ] [ #{@fields[4]} ] [ #{@fields[5]} ]\n" +
		"[ #{@fields[6]} ] [ #{@fields[7]} ] [ #{@fields[8]} ]"
	end

	def fill(field)
		@fields[field] = @currentPlayer
		if @currentPlayer == "O"
			@currentPlayer = "X"
		else 
			@currentPlayer = "O"
		end
	end

	def isOccupied(field)
		if @fields[field] == field
			return false
		else 
			return true
		end
	end
end