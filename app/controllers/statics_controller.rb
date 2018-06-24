class StaticsController < ApplicationController
  before_action do
    expires_in(1.minutes, public: true)
  end
end
