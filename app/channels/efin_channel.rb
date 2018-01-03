require 'securerandom'
class EfinChannel < ApplicationCable::Channel
  def subscribed
    stream_from "efin"
  end
  def receive(data)
    response = EfinUpdateJob.perform_later(data)
    ActionCable.server.broadcast 'efin', response
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
