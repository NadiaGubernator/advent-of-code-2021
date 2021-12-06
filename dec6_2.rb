require_relative 'advent_data'

data = AdventData.new(day: 6, session: ARGV[0]).get

fish = data.first.split(',').map(&:to_i)
this_day = {}
next_day = fish.tally

256.times do |i|
  this_day = next_day
  next_day = {}

  this_day.each do |day, count|
    case day
    when 0
      next_day[6] = next_day[6].to_i + count
      next_day[8] = count
    else
      next_day[day - 1] = next_day[day - 1].to_i + count
    end
  end
end

puts next_day.values.sum
