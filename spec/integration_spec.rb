require 'webmachine/sprockets'

describe Webmachine::Sprockets do
  it 'has a version' do
    Webmachine::Sprockets::VERSION.should match(/^\d\.\d\.\d$/)
  end
end
