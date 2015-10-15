class HomesController < ApplicationController
  def index
    @entry = Entry.new
  end
end
