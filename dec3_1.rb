require_relative 'advent_data'

data = AdventData.new(day: 3, session: ARGV[0]).get

bit_table = data.map(&:chars)
gamma_rate = ''
epsilon_rate = ''

bit_table.transpose.each do |column|
  times_one = 0
  times_zero = 0

  column.each do |bit|
    bit == '1' ? times_one += 1 : times_zero += 1
  end

  if times_one > times_zero
    gamma_rate << '1'
    epsilon_rate << '0'
  else
    gamma_rate << '0'
    epsilon_rate << '1'
  end
end

puts gamma_rate.to_i(2) * epsilon_rate.to_i(2)
