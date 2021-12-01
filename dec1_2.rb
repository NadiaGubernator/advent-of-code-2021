require_relative 'advent_data'

data = AdventData.new(day: 1, session: ARGV[0]).get

measurements = data.map(&:to_i)
increases = 0
previous_window_sum = measurements[0] + measurements[1] + measurements[2]

measurements.each_index do |index|
  break if measurements[index + 2].nil?

  window_sum = measurements[index] + measurements[index + 1] + measurements[index + 2]
  increases += 1 if window_sum > previous_window_sum
  previous_window_sum = window_sum
end

puts increases
