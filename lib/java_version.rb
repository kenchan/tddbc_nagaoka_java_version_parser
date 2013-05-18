class JavaVersion
  include Comparable

  attr_reader :family_number, :update_number

  VERSION_FORMAT = /^JDK(\d+)u(\d+)$/

  def initialize(family_number, update_number)
    @family_number = family_number
    @update_number = update_number
  end

  def <=>(target)
    if (self.family_number <=> target.family_number).zero?
      self.update_number <=> target.update_number
    else
      self.family_number <=> target.family_number
    end
  end

  class << self
    def valid?(str)
      str =~ VERSION_FORMAT
    end

    def parse(str)
      if str =~ VERSION_FORMAT
        self.new($1.to_i, $2.to_i)
      else
        raise "Invalid Version Format: #{str}"
      end
    end
  end
end
