require 'spec_helper'

describe AClass do
  subject { described_class.new }

  it { is_expected.to respond_to(:translate).with(1..2).arguments }
  it { is_expected.to respond_to(:localize).with_unlimited_arguments }

  it { expect(AClass).to respond_to(:translate).with(1..2).arguments }
  it { expect(AClass).to respond_to(:localize).with_unlimited_arguments }

  it { expect(I18n.locale).to eq :en }
  it { expect(subject.translate(:fake)).to eq 'fake' }
  it { expect(subject.translate('.fake')).to eq 'a_class.fake' }
  it { expect(AClass.translate(:fake)).to eq 'fake' }
  it { expect(AClass.translate('.fake')).to eq 'a_class.fake' }
end
