$(document).on('ready', function() {
  submitNewMessage();
  if($('#messages').length > 0){
    $("#messages").scrollTop($("#messages")[0].scrollHeight)
  }
});

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        // console.log(this)
        // $(this).val('');
        // $('input[name="message[content]"]').val("")
        return false;
     }
  });
}
