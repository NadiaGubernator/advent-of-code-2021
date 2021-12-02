require_relative 'advent_data'

data = AdventData.new(day: 2, session: ARGV[0]).get
horizontal = 0
depth = 0

data.each do |command|
  direction, units = command.split(' ')
  units = Integer(units)

  case direction
  when 'forward'
    horizontal += units
  when 'down'
    depth += units
  when 'up'
    depth -= units
  end
end

puts horizontal * depth
