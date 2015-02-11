require './lib/environments'

describe Environments do
  describe '.current' do
    context 'when only RACK_ENV is set' do
      before do
        ENV['RACK_ENV'] = 'rack_env'
        described_class.reload
      end

      it 'returns the environment set on RACK_ENV var' do
        expect(described_class.current).to eq 'rack_env'
      end
    end

    context 'when only RAILS_ENV is set' do
      before do
        ENV.delete('RACK_ENV')
        ENV['RAILS_ENV'] = 'rails_env'
        described_class.reload
      end

      it 'returns the environment set on RAILS_ENV var' do
        expect(described_class.current).to eq 'rails_env'
      end
    end

    context 'when RACK_ENV and RAILS_ENV are set' do
      before do
        ENV['RACK_ENV'] = 'rack_env'
        ENV['RAILS_ENV'] = 'rails_env'
        described_class.reload
      end

      it 'returns the environment set on RACK_ENV var' do
        expect(described_class.current).to eq 'rack_env'
      end
    end

    context 'when none ENV vars are set' do
      before do
        ENV.delete('RACK_ENV')
        ENV.delete('RAILS_ENV')

        described_class.reload
      end

      it 'returns development' do
        expect(described_class.current).to eq 'development'
      end
    end
  end

  describe '.current=' do
    context 'when value is a String' do
      before do
        described_class.current = 'current'
      end

      it 'returns current' do
        expect(described_class.current).to eq 'current'
      end
    end

    context 'when value is not a String' do
      it 'returns current' do
        expect{ described_class.current = 1 }.to raise_error ArgumentError
      end
    end
  end

  describe '.production?' do
    context 'when current environment is production' do
      before do
        described_class.current = 'production'
      end

      it 'returns true' do
        expect(described_class.production?).to be
      end
    end

    context 'when current environment is not production' do
      before do
        described_class.current = 'environment'
      end

      it 'returns false' do
        expect(described_class.production?).not_to be
      end
    end
  end

  describe '.staging?' do
    context 'when current environment is staging' do
      before do
        described_class.current = 'staging'
      end

      it 'returns true' do
        expect(described_class.staging?).to be
      end
    end

    context 'when current environment is not staging' do
      before do
        described_class.current = 'environment'
      end

      it 'returns false' do
        expect(described_class.staging?).not_to be
      end
    end
  end

  describe '.development?' do
    context 'when current environment is development' do
      before do
        described_class.current = 'development'
      end

      it 'returns true' do
        expect(described_class.development?).to be
      end
    end

    context 'when current environment is not development' do
      before do
        described_class.current = 'environment'
      end

      it 'returns false' do
        expect(described_class.development?).not_to be
      end
    end
  end

  describe '.test?' do
    context 'when current environment is test' do
      before do
        described_class.current = 'test'
      end

      it 'returns true' do
        expect(described_class.test?).to be
      end
    end

    context 'when current environment is not test' do
      before do
        described_class.current = 'environment'
      end

      it 'returns false' do
        expect(described_class.test?).not_to be
      end
    end
  end

  describe '.deployed?' do
    context 'when current environment is production' do
      before do
        described_class.current = 'production'
      end

      it 'returns true' do
        expect(described_class.deployed?).to be
      end
    end

    context 'when current environment is staging' do
      before do
        described_class.current = 'staging'
      end

      it 'returns true' do
        expect(described_class.deployed?).to be
      end
    end

    context 'when current environment is something else' do
      before do
        described_class.current = 'deployed'
      end

      it 'returns false' do
        expect(described_class.deployed?).not_to be
      end
    end
  end
end
