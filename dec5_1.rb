require_relative 'advent_data'

data = AdventData.new(day: 5, session: ARGV[0]).get
diagram = [[]]

def prepare_coordinates(data)
  data.map do |line|
    first_pair, second_pair = line.split(' -> ')
    x1, y1 = first_pair.split(',')
    x2, y2 = second_pair.split(',')

    { x1: x1.to_i, y1: y1.to_i, x2: x2.to_i, y2: y2.to_i }
  end
end

def mark_vents(coordinates, diagram)
  coordinates.each do |set|
    next unless set[:x1] == set[:x2] || set[:y1] == set[:y2]

    if set[:x1] == set[:x2]
      y1y2 = [set[:y1], set[:y2]]
      for y in y1y2.min..y1y2.max do
        diagram[y] = [] if diagram[y].nil?
        diagram[y][set[:x1]] = diagram[y][set[:x1]].to_i + 1
      end
    else
      x1x2 = [set[:x1], set[:x2]]
      for x in x1x2.min..x1x2.max do
        diagram[set[:y1]] = [] if diagram[set[:y1]].nil?
        diagram[set[:y1]][x] = diagram[set[:y1]][x].to_i + 1
      end
    end
  end

  diagram
end

coordinates = prepare_coordinates(data)
diagram = mark_vents(coordinates, diagram)

puts diagram.flatten.select { |point| point.to_i > 1 }.count
