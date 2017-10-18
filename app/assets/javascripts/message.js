function showMessage(id){
  $.ajax({url: '/messages/' + id, dataType: "script"});
}