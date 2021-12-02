require_relative 'advent_data'

data = AdventData.new(day: 2, session: ARGV[0]).get

horizontal = 0
depth = 0
aim = 0

data.each do |command|
  direction, units = command.split(' ')
  units = Integer(units)

  case direction
  when 'forward'
    horizontal += units
    depth += units * aim
  when 'down'
    aim += units
  when 'up'
    aim -= units
  end
end

puts horizontal * depth
