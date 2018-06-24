ENV['RAILS_ENV'] = 'development'

require 'rails_helper'
require "sitespec/rspec"

describe "Sitespec", :sitespec do
  let(:app) do
    Rails.application
  end

  %w[
    /
    /assets/application.css
    /assets/application.js
  ].each do |path|
    describe "GET #{path}" do
      it "returns 200" do
        expect(get(path).status).to eq 200
      end
    end
  end


  Notebook.slug_hash.each do |slug, content|
    describe "GET /entries/#{slug}" do
      subject { get "/entries/#{slug}" }
      it { expect(subject.status).to eq 200 }
    end
  end
end
