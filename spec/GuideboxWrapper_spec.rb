require 'spec_helper'

describe GuideboxWrapper do
  let(:guidebox) { GuideboxWrapper::Movie.new(ENV["MY_API_KEY"], "all")}
  it 'has a version number' do
    expect(GuideboxWrapper::VERSION).not_to be nil
  end
  it 'returns a integer between 0 and 100,000' do
    expect(guidebox.quota).to be_between(0, 100000).inclusive
  end
end
