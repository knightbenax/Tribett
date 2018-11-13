const api_url = "/features/api/v1.0";

function NewFeatureRequest(title, desc, date, client, area, priority){
  var post_data = [];

  post_data.push({
      title: title,
      desc: desc,
      date: date,
      client: client,
      area: area,
      priority: priority
  });

  return post_data;
}

function FeatureRequest(title, desc, date, client, area, priority){
  let self = this;
  self.title = title;
  self.desc = desc;
  self.date = moment(date).format('ddd, Do MMM YYYY');
  self.client = client;
  self.area = area;
  self.priority = priority;
}

function FeaturesRequestViewModel(){
  let self = this;

  //Declare the new feature request bindings here
  self.featureTitle = ko.observable("");
  self.desc = ko.observable("");
  self.clients = ko.observableArray(["Select Client"]);
  self.clientSelected = ko.observable("");
  self.targetDate = ko.observable("");
  self.productArea = ko.observableArray(["Select Product Area"]);
  self.productAreaSelected = ko.observable("");
  self.priority = ko.observable("");

  self.featuresNotStarted = ko.observableArray([]);
  self.featuresInProgress = ko.observableArray([]);
  self.featuresDone = ko.observableArray([]);

  //Attach the client values to the observable
  for (var key in clients_json){
    self.clients.push(clients_json[key].name);
  }

  //Attach the product area values to the observable
  for (var key in product_area_json){
    self.productArea.push(product_area_json[key].name);
  }

  //Attach the product area values to the observable
  for (var key in features_json){
    console.log(features_json[key].status);
    if (features_json[key].status == "not-started"){
      self.featuresNotStarted.push(
        new FeatureRequest(features_json[key].title, features_json[key].description, features_json[key].date, features_json[key].client, features_json[key].product_area, features_json[key].priority)
      );
    } else if (features_json[key].status == "in-progress"){
      self.featuresInProgress.push(
        new FeatureRequest(features_json[key].title, features_json[key].description, features_json[key].date, features_json[key].client, features_json[key].product_area, features_json[key].priority)
      );
    } else if (features_json[key].status == "done"){
      self.featuresDone.push(
        new FeatureRequest(features_json[key].title, features_json[key].description, features_json[key].date, features_json[key].client, features_json[key].product_area, features_json[key].priority)
      );
    }
  }

  self.whichFeature = function(){

  }

  self.addNewRequest = function(){
    showNewFeatureDialog();
  }

  self.closeRequest = function(){
    hideNewFeatureDialog();
  }

  self.attachDragula = function (){
    var drake = dragula([document.getElementById("left"), document.getElementById("center"), document.getElementById("right")],{
      /*revertOnSpill: true,*/
      direction: 'horizontal'
    });
    //console.log(drake);
  }

  //Here even though we are using the HTML number tag, we still
  //want to check on browsers that are not supported if the user entered
  //an integer
  self.checkIfPriorityNum = function(){
    let priority_int = Number(self.priority());
    if(isNaN(priority_int))
      return true;

    return false;
  }

  self.addNewRequestToServer = function(){
    //Send the new feature request to the server. But perform check first
    if (self.featureTitle().length <= 0){
      showTopNotification("You need to enter a title", "error");
    } else if (self.desc().length <= 0) {
      showTopNotification("You need to describe the feature", "error");
    } else if (self.clientSelected() == "Select Client" || self.clientSelected().length <= 0) {
      showTopNotification("Select the client who requested this feature", "error");
    } else if (self.priority().length <= 0){
      showTopNotification("Enter the priority of this feature", "error");
    } else if (self.checkIfPriorityNum()){
      showTopNotification("Priority entered is not a number", "error");
    } else if (self.productAreaSelected() == "Select Product Area" || self.productAreaSelected().length <= 0) {
      showTopNotification("Select the product area related to this feature", "error");
    } else if (self.targetDate() == "dd/mm/yyyy" || self.targetDate().length <= 0) {
      showTopNotification("Enter the target date for this feature", "error");
    } else {
      NProgress.start();
      let new_feature_request = new NewFeatureRequest(self.featureTitle(), self.desc(), self.targetDate(), self.clientSelected(), self.productAreaSelected(), self.priority());
      $.post(api_url + "/add", { new_feature_request }, function(data) {
        data = JSON.parse(data);
        if (data.message == "success"){
          NProgress.done();
          hideNewFeatureDialog();
          showTopNotification("Feature has been added", "info");
        }
      });
    }

  }
}

ko.applyBindings(new FeaturesRequestViewModel());
