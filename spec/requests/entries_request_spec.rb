require 'rails_helper'

RSpec.describe EntriesController do
  describe 'index' do
    subject { get '/' }
    it { is_expected.to eq 200 }
  end
end
