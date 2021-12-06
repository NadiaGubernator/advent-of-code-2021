require_relative 'advent_data'

data = AdventData.new(day: 6, session: ARGV[0]).get

fish = data.first.split(',').map(&:to_i)
this_day = []
next_day = fish

80.times do
  this_day = next_day
  next_day = []

  this_day.each do |fish|
    if fish == 0
      next_day << 6
      next_day << 8
    else
      next_day << (fish - 1)
    end
  end
end

p next_day.count
