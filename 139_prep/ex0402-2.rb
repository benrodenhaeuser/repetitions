class TextAnalyzer
  def process
    file = File.open('./sample.txt', "w") # upper half of sandwich
    yield(file.read) # yield file content to the block
    file.close # lower half of sandwich
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |string| puts "#{string.split("\n\n").count} paragraphs" }
analyzer.process { |string| puts "#{string.split("\n").count} lines" }
analyzer.process { |string| puts "#{string.split(" ").count} words" }
