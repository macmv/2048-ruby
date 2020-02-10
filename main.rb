
def print_board(board)
  board.each do |row|
    row.each do |let|
      print let
      print " " * (4 - let.to_s.length)
    end
    puts
    puts
  end
end

def calc_dir(row, col, dir)
  if dir == "w"
    return row, col
  elsif dir == "s"
    return row, -col + 3
  elsif dir == "a"
    return col, row
  elsif dir == "d"
    return -col + 3, row
  end
end

def update_board(board, dir)
  4.times do |row|
    col_items = []
    4.times do |col|
      x, y = calc_dir(row, col, dir)
      if board[y][x] != 0
        if col_items.last == board[y][x]
          col_items[-1] *= 2
        else
          col_items.push board[y][x]
        end
      end
      board[y][x] = 0
    end
    col_items.each_with_index do |item, col|
      x, y = calc_dir(row, col, dir)
      board[y][x] = item
    end
  end
end

board = []

4.times do |y|
  row = []
  4.times do |x|
    row.push 0
  end
  board.push row
end

while true
  while true
    x = rand(4)
    y = rand(4)
    if board[y][x] == 0
      board[y][x] = 2
      break
    end
  end
  print_board(board)
  print("Enter Direction: (w a s d): ")
  dir = gets.chomp
  while true
    if ["w", "a", "s", "d"].include? dir
      break
    end
    print("Please enter a valid direction: ")
    dir = gets.chomp
  end
  update_board(board, dir)
end

