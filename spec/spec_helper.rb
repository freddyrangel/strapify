require "coveralls"
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter "/spec/"
  add_filter 'vendor/cache'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'strapify'
require "tmpdir"
require "godot"
require 'fileutils'
require 'webmock/rspec'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.order = "random"

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

# Copied from minitest.
def capture_io
  begin
    require 'stringio'

    captured_stdout, captured_stderr = StringIO.new, StringIO.new

    orig_stdout, orig_stderr = $stdout, $stderr
    $stdout, $stderr         = captured_stdout, captured_stderr

    yield

    return captured_stdout.string, captured_stderr.string
  ensure
    $stdout = orig_stdout
    $stderr = orig_stderr
  end
end
