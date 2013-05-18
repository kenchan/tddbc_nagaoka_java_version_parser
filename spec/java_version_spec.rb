require 'bundler/setup'
require_relative '../lib/java_version'

describe JavaVersion do
  describe '.valid?' do
    subject { JavaVersion.valid?('JDK7u40') }
    it { should be_true }
  end
end
