class JavaVersion
  def self.valid?(str)
    str =~ /^JDK\d+u\d+$/
  end
end
