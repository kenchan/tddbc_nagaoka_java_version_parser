class JavaVersion
  VERSION_FORMAT = /^JDK(\d+)u(\d+)$/

  def initialize(version_string)
    @version_string = version_string
  end

  def family_number
    @version_string =~ VERSION_FORMAT
    $1.to_i
  end

  def update_number
    @version_string =~ VERSION_FORMAT
    $2.to_i
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
