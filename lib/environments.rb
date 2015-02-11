require "environments/version"

module Environments
  @@current_environment = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'

  def self.current
    @@current_environment
  end

  def self.current=(value)
    raise ArgumentError.new('Value must be a String') unless value.is_a? String

    @@current_environment = value
  end

  def self.production?
    @@current_environment == 'production'
  end

  def self.staging?
    @@current_environment == 'staging'
  end

  def self.development?
    @@current_environment == 'development'
  end

  def self.test?
    @@current_environment == 'test'
  end

  def self.deployed?
    production? || staging?
  end

  def self.reload
    @@current_environment = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
  end
end
