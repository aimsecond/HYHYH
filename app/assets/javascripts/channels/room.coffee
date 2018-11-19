App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      msgTable = $('#messages-table')
      msgTable.append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'
      offset = document.getElementById("messages-table").lastElementChild.offsetTop;
      document.getElementById("messages").scrollTop = offset;
      if data.content is "$play$"
        $('#player-status').text("playing")
      if data.content is "$pulse$"
        $('#player-status').text("pulsed")
     
  send_message: (room_id, message) ->
    @perform "send_message", {room_id: room_id, content: message}