function getConversation(id){
  $.get('/conversations/' + id);
}