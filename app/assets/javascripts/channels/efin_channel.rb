class EfinChannel < ApplicationCable::Channel
  def subscribed
    stream_from "efin_#{params[:room]}"
  end
end
