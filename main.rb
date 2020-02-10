require 'paint'

def print_board(board)
  board.each do |row|
    row.each do |let|
      if let == 2
        print Paint[let, [50, 250, 50]]
      elsif let == 4
        print Paint[let, [50, 200, 150]]
      elsif let == 8
        print Paint[let, [50, 150, 250]]
      elsif let == 16
        print Paint[let, [150, 100, 250]]
      elsif let == 32
        print Paint[let, [250, 250, 100]]
      elsif let == 64
        print Paint[let, [250, 200, 150]]
      elsif let == 128
        print Paint[let, [250, 150, 200]]
      elsif let == 256
        print Paint[let, [250, 100, 150]]
      elsif let == 512
        print Paint[let, [250, 50, 100]]
      elsif let == 1024
        print Paint[let, [250, 250, 250]]
      elsif let == 2048
        print Paint[let, [150, 150, 150]]
      else
        print " " * let.to_s.length
      end
      print " " * (5 - let.to_s.length)
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
  empty = true
  board.each do |row|
    row.each do |item|
      if item == 0
        empty = false
        break
      end
    end
    if !empty
      break
    end
  end
  if empty
    print_board(board)
    puts "Game Over"
    break
  end
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

