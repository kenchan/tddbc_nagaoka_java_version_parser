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

  context '"JDK7u40" parsed object' do
    subject { JavaVersion.parse('JDK7u40') }

    its(:family_number) { should == 7 }
    its(:update_number) { should == 40 }
  end

  describe '#<=>' do
    let(:v7u40) { JavaVersion.parse('JDK7u40') }
    let(:v7u51) { JavaVersion.parse('JDK7u51') }
    let(:v8u0) { JavaVersion.parse('JDK8u0') }

    context 'compare update number' do
      it { v7u40.should be < v7u51 }
    end

    context 'compare family number' do
      it { v7u40.should be < v8u0 }
    end
  end
end
