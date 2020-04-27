class Question
  attr_accessor :value1, :value2, :answer
  def initialize
    @value1 = rand(21)
    @value2 = rand(21)
    @answer = @value1 + @value2
  end
end
