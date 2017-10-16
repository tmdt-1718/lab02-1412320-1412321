function getConversation(id){
  $.get('/conversations/' + id);
}

$(document).on('turbolinks:load', function(){
  var conversation = $('.conversation-single').find('.card-title');
  conversation[0].click();
})