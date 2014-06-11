
template '/tmp/partial_from_inside.txt' do
  cookbook 'inside'
end

template '/tmp/partial_from_outside.txt' do
  cookbook 'inside'
end

