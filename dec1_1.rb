require_relative 'advent_data'

data = AdventData.new(day: 1, session: ARGV[0]).get

measurements = data.map(&:to_i)
increases = 0
previous_measurement = measurements.first

measurements.each do |measurement|
  increases += 1 if measurement > previous_measurement
  previous_measurement = measurement
end

puts increases
