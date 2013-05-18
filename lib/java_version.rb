class JavaVersion
  def self.valid?(str)
    str =~ /^JDK\d+u\d+$/
  end

  def self.parse(str)
    raise "Invalid Version Format: #{str}" unless valid?(str)
    self.new
  end
end
