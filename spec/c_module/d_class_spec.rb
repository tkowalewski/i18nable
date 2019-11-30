require 'spec_helper'

describe CModule::DClass do
  subject { described_class.new }

  it { expect(subject.translate('.fake')).to eq 'c_module.d_class.fake' }
  it { expect(CModule::DClass.translate('.fake')).to eq 'c_module.d_class.fake' }
end
