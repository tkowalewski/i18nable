RSpec.describe AClass do
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

  context 'with options' do
    it { expect(subject.translate('.hello', name: 'Ann')).to eq 'Hi Ann' }
    it { expect(AClass.translate('.fake', locale: :pl)).to eq 'a_class.fake.pl' }
    it { expect(subject.translate('.missing', default: 'fallback')).to eq 'fallback' }
    it { expect(subject.translate(:greeting, name: 'Ann')).to eq 'Hello Ann' }
    it { expect { subject.translate('.missing', raise: true) }.to raise_error(I18n::MissingTranslationData) }
  end

  describe '#localize' do
    let(:date) { Date.new(2020, 1, 2) }

    before do
      I18n.backend.store_translations :en, date: { formats: { default: '%Y-%m-%d', short: '%d.%m' } }
    end

    it { expect(subject.localize(date)).to eq '2020-01-02' }
    it { expect(subject.localize(date, format: :short)).to eq '02.01' }
    it { expect(AClass.localize(date, format: :short)).to eq '02.01' }
  end
end
