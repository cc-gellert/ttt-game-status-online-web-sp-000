# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


def won?(board)
  WIN_COMBINATIONS.each do |combi|
    if(position_taken?(board, combi[0]) && board[combi[0]] == board[combi[1]] && board[combi[1]] == board[combi[2]])
      return combi 
    end
  end
  return nil 
end

def full?(board)
  board.all? { |space| space == "X" || space == "O" }
end 

def draw?(board)
  (full?(board) && !won?(board))
end

def over?(board)
  if(full?(board) || draw?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if(won?(board))
    char = won?(board)
    return board[char[0]] 
   else
     return nil 
   end
end