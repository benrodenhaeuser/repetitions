def zip(ary1, ary2)
  (0...ary1.length).map do |index|
    [ary1[index],ary2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
