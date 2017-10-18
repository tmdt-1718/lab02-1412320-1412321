function getConversation(id){
  $.get('/conversations/' + id);
}

$(document).on('turbolinks:load', function(){
  $("#sent").click(function(){
    $.get('/messages/sent')
  });
  $("#inbox").click(function(){
    $.ajax({url: '/messages', dataType: "script"})
  });
  var conversation = $('.conversation-single').find('.card-title');
  if(conversation.length > 0)
    conversation[0].click();
})