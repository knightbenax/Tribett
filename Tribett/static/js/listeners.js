var notification;

function showNewFeatureDialog(){
  $("body").css("overflow", "hidden");
  $(".modal-bg").css('display', 'flex');
}

function hideNewFeatureDialog(){
  $("body").css("overflow", "auto");
  $(".modal-bg").css('display', 'none');
}

function sendNewFeatureToServer(){

}

function showTopNotification(message, type){
  if(notification != null){
    notification.dismiss();
  }
  //setTimeout( function() {
    // create the notification
    notification = new NotificationFx({
      wrapper : document.body,
      message : '<p>' + message + '</p>',
      layout : 'bar',
      effect : 'slidetop',
      type : type, // notice, warning or error
      onClose : function() {
        //bttn.disabled = false;
      }
    });
    // show the notification
    notification.show();

  //}, 1200 );
}
