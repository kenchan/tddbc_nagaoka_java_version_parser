require 'bundler/setup'
require_relative '../lib/java_version'

describe JavaVersion do
  describe '.valid?' do
    context 'valid version string' do
      subject { JavaVersion.valid?('JDK7u40') }

      it { should be_true }
    end

    context 'invalid version string' do
      subject { JavaVersion.valid?('hoge') }

      it { should be_false }
    end
  end

  describe '.parse' do
    context 'valid version string' do
      subject { JavaVersion.parse('JDK7u40') }

      it { should be }
    end

    context 'invalid version string' do
      it { expect { JavaVersion.parse('hoge') }.to raise_error }
    end
  end
end
