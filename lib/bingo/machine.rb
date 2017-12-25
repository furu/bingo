module Bingo
  class Machine
    attr_reader :numbers, :drawed_numbers

    def initialize(numbers = nil)
      @numbers = numbers.clone || [*1..75].shuffle
      @drawed_numbers = []
    end

    def draw
      drawed_number = @numbers.shift
      @drawed_numbers << drawed_number
      drawed_number
    end
  end
end
