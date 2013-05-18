class JavaVersion
  attr_reader :family_number, :update_number

  VERSION_FORMAT = /^JDK(\d+)u(\d+)$/

  def initialize(version_string)
    version_string =~ VERSION_FORMAT
    @family_number = $1.to_i
    @update_number = $2.to_i
  end

  class << self
    def valid?(str)
      str =~ VERSION_FORMAT
    end

    def parse(str)
      raise "Invalid Version Format: #{str}" unless valid?(str)
      self.new(str)
    end
  end
end
