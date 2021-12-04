require_relative 'advent_data'
require 'pry'

data = AdventData.new(day: 4, session: ARGV[0]).get

draw_numbers = data.shift.split(',')
boards = data.reject(&:empty?).map { |s| s.split(' ') }.each_slice(5).to_a

def board_sum(board)
  board.flatten.reject { |char| char == 'x' }.map(&:to_i).inject(:+)
end

draw_numbers.each do |draw_number|
  boards.each_with_index do |board, board_index|
    board.each_with_index do |line, line_index|
      element_index = line.index(draw_number)
      boards[board_index][line_index][element_index] = 'x' if element_index
      elements = line.uniq
      return p "Bingo! #{board_sum(board) * draw_number.to_i}" if elements.length == 1 && elements.first == 'x'
    end

    columns = board.transpose

    columns.each_with_index do |column, column_index|
      element_index = column.index(draw_number)
      boards[board_index][element_index][column_index] = 'x' if element_index
      elements = column.uniq
      return p "Bingo! #{board_sum(board) * draw_number.to_i}" if elements.length == 1 && elements.first == 'x'
    end
  end
end
