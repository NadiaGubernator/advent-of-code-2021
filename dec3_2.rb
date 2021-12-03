require_relative 'advent_data'

data = AdventData.new(day: 3, session: ARGV[0]).get

def select_values(values, rule)
  for index in 0..values.first.length
    values_one = values.select {|v| v[index] == '1' }
    values_zero = values.select {|v| v[index] == '0' }

    if values_one.size.public_send(rule, values_zero.size)
      values = values - values_zero
    else
      values = values - values_one
    end

    break if values.size == 1
  end

  values
end

o2_value = select_values(data, :>=).first
co2_value = select_values(data, :<).first

puts o2_value.to_i(2) * co2_value.to_i(2)
