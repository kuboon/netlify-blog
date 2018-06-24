require 'rails_helper'

RSpec.describe "Notebook" do
  subject { Notebook.slug_hash }
  it { is_expected.not_to be_empty }
end
