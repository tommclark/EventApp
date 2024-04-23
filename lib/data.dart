import 'event_type_model.dart';


List<EventTypeModel> getEventTypes(){

  List<EventTypeModel> events = [];
  EventTypeModel eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "assets/concert.png";
  eventModel.eventType = "Concert";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //2
  eventModel.imgAssetPath = "assets/sports.png";
  eventModel.eventType = "Sports";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //3
  eventModel.imgAssetPath = "assets/education.png";
  eventModel.eventType = "Education";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //4
  eventModel.imgAssetPath = "assets/visitors.png";
  eventModel.eventType = "Exibitions";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  //5
  eventModel.imgAssetPath = "assets/seminar.png";
  eventModel.eventType = "Seminar";
  events.add(eventModel);

  eventModel = new EventTypeModel();

  return events;
}
