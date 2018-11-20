App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    print_message = (username, content) ->
      msgTable = $('#messages-table')
      msgTable.append '<div class="message">' +
        '<div class="message-user">' + username + ":" + '</div>' +
        '<div class="message-content">' + content + '</div>' + '</div>'
      offset = document.getElementById("messages-table").lastElementChild.offsetTop;
      document.getElementById("messages").scrollTop = offset;
    unless data.content.blank?
      if data.user_id is $("[data-behavior='room-info']").data("host-id")
        if data.content is "$play$"
          $('#player-status').text("playing")
        else if data.content is "$pulse$"
          $('#player-status').text("pulsed")
        else if data.content.substring(0,6) is "$time$"
          player.seekTo(data.content.substr(6))
        else
          print_message(data.username, data.content)
      else
        print_message(data.username, data.content)



     
  send_message: (room_id, message) ->
    @perform "send_message", {room_id: room_id, content: message}