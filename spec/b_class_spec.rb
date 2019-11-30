require 'spec_helper'

describe BClass do
  subject { described_class.new }

  it { expect(subject.translate('.fake')).to eq 'b_class.fake' }
  it { expect(BClass.translate('.fake')).to eq 'b_class.fake' }
end
