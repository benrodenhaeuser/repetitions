def grouper(array)
  yield(array)
end

grouper(%w(raven finch hawk eagle)) { |_, _, *raptors| puts raptors }
