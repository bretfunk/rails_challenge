require 'securerandom'
class EfinChannel < ApplicationCable::Channel
  def subscribed
    stream_from "efin"
  end
  def receive(data)
    #byebug
    #data is coming through here
    #server.broadcast is sending info but not correct format
    ActionCable.server.broadcast 'efin', data
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
