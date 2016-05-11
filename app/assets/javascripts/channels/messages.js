App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    var id = $("#messages").data('id')
    // console.log(data, id)
    $('#messages').append(this.renderMessage(data,id))
    $('textarea[name="message[content]"]').val("")
    return  $("#messages").animate({
                scrollTop: $("#messages")[0].scrollHeight
            }, 'fast');
  },

  renderMessage: function(data,id) {
    // console.log(data, this.perform("render_message", data))
    // return this.perform("render_message", data)
    var message = '';
    message += '<div class="direct-chat-msg'+ (data.current_user === id ? '' : ' right') + '">'
    message +=  '<div class="direct-chat-info clearfix">'
    message +=    '<span class="direct-chat-name pull-left">'+ data.user +'</span>'
    message +=    '<span class="direct-chat-timestamp pull-right">'+data.time_ago +' ago</span>'
    message +=  '</div>'
    message +=  '<img alt="'+data.user+'" class="direct-chat-img" src="/assets/'+data.avatar+'">'
    message +=  '<div class="direct-chat-text">'+data.message
    message +=  '</div>'
    message += '</div>'
    return message;
    // return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
})
