def display_board(board)
    p "|" + " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} " + "|"
    p "|" + "-----------" + "|"
    p "|" + " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} " + "|"
    p "|" + "-----------" + "|"
    p "|" + " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} " + "|"
end

def check_space_valid(board, row, column)
    board[row][column] == " "
end

def check_winner(board)
    winning_lines = [
    [board[0][0], board[0][1], board[0][2]],
    [board[1][0], board[1][1], board[1][2]],
    [board[2][0], board[2][1], board[2][2]],
    [board[0][0], board[1][0], board[2][0]],
    [board[0][1], board[1][1], board[2][1]],
    [board[0][2], board[1][2], board[2][2]],
    [board[0][0], board[1][1], board[2][2]],
    [board[0][2], board[1][1], board[2][0]]
    ]
    winning_lines.any? { |line| line.uniq.length == 1 && line[0] != " " }
end

def player_move(board)
    loop do
        print "Player turn! Enter a row:  "
        row = gets.chomp.to_i - 1
        print "Player turn! Enter a column:  "
        column = gets.chomp.to_i - 1
        if row < 0 || row > 2 || column < 0 || column > 2
            puts "Invalid move. Please enter a row and column between 1 and 3."
            next
        elsif !check_space_valid(board, row, column)
            puts "Invalid move. Space is already taken."
            next
        else
            board[row][column] = "X"
            return true
            break
        end
    end
end

def computer_move(board)
    if board[1][1] == " "                                         # Take the center if available
        board[1][1] = "O"
        return true
    end
    loop do
        row = Random.new.rand(3)
        column = Random.new.rand(3)
        if check_space_valid(board, row, column)
            board[row][column] = "O"
            return true
            break
        end
    end
end

def main()
    board = Array.new(3) { Array.new(3, " ") }                    # Initialize the board
    player_turn = [true, false].sample                            # Randomize who goes first
    running = true
    while running
        puts "\e[H\e[2J"                                          # Clear the screen
        puts "Tic-Tac-Toe " + " Player: X | Computer: O"
        puts "**************************************"
        puts "Turn of: #{player_turn ? "X" : "O"}"
        display_board(board)
        if player_turn
            player_move(board)
            if check_winner(board)
                puts "\e[H\e[2J"                                  # Clear the screen
                puts "********* GAME OVER *********"
                display_board(board)
                puts "Player wins!"
                running = false
            end
        else
            computer_move(board)
            if check_winner(board)
                puts "\e[H\e[2J"                                  # Clear the screen
                puts "********* GAME OVER *********"
                display_board(board)
                puts "Computer wins!" + " You suck, bruh!"
                running = false
            end
        end
        player_turn = !player_turn
    end
end

main()
