require 'spec_helper'

describe I18nable::KeyBuilder do
  let(:key_builder) { described_class.new base_class }
  let(:base_class) { double('Class', name: name) }
  let(:name) { 'Class' }

  describe '#build' do
    subject { key_builder.build key }

    context 'when key is not string' do
      let(:key) { :key }

      it { is_expected.to eq :key }
    end

    context 'when key is string' do
      context 'and did starts with dot' do
        let(:key) { 'key' }

        it { is_expected.to eq 'key' }
      end

      context 'and starts with dot' do
        let(:key) { '.key' }

        it { is_expected.to eq 'class.key' }
      end
    end

    context 'when class name is' do
      let(:key) { '.key' }

      context 'low level camel cased' do
        let(:name) { 'Class' }

        it { is_expected.to eq 'class.key' }
      end

      context 'hight level camel cased' do
        let(:name) { 'AmazingClass' }

        it { is_expected.to eq 'amazing_class.key' }
      end

      context 'modularized' do
        let(:name) { 'GroupOf::AmazingClass' }

        it { is_expected.to eq 'group_of.amazing_class.key' }
      end
    end
  end
end
