module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      puts "subscribed"

    end

  end
end
