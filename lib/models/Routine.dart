import 'package:firebase_database/firebase_database.dart';

class Routine {
  int key;
  String routinename;
  String tags;
  String category;
  String description;
  String images;
  String triggername;
  String trigger;
  String devicetrigger;
  String triggergroup;
  String schedule;
  String device;
  String devicegroup;
  String action;
  String actiongroup;
  String locationgroup;
  String location;
  String numberofaction;
  String url;

  Routine(
      this.key,
      this.routinename,
      this.tags,
      this.category,
      this.description,
      this.images,
      this.triggername,
      this.trigger,
      this.devicetrigger,
      this.triggergroup,
      this.schedule,
      this.device,
      this.devicegroup,
      this.action,
      this.actiongroup,
      this.locationgroup,
      this.location,
      this.numberofaction,
      this.url);

  Routine.fromSnapshot(DataSnapshot snapshot)
      : key = (snapshot.value as dynamic)['Routine_Key'],
        routinename = (snapshot.value as dynamic)['Routine_Name'],
        tags = (snapshot.value as dynamic)['Categories Tags'],
        category = (snapshot.value as dynamic)['Category'],
        description = (snapshot.value as dynamic)['Routine_Description'],
        images = (snapshot.value as dynamic)['Images'],
        triggername = (snapshot.value as dynamic)['Trigger_Name'],
        trigger = (snapshot.value as dynamic)['Trigger'],
        devicetrigger = (snapshot.value as dynamic)['Device_Trigger'],
        triggergroup = (snapshot.value as dynamic)['Trigger_Group'],
        schedule = (snapshot.value as dynamic)['Active_Days'],
        action = (snapshot.value as dynamic)['Action'],
        actiongroup = (snapshot.value as dynamic)['Action_Group'],
        device = (snapshot.value as dynamic)['Device'],
        devicegroup = (snapshot.value as dynamic)['Device_Group'],
        locationgroup = (snapshot.value as dynamic)['Location_Group'],
        location = (snapshot.value as dynamic)['Location'],
        numberofaction = (snapshot.value as dynamic)['NumberOfAction'],
        url = (snapshot.value as dynamic)['URL'];

  toJson() {
    return {
      'Routine Key': key,
      'Routine_Name': routinename,
      'Categories Tags': tags,
      'Category': category,
      'Routine_Description': description,
      'Images': images,
      'Trigger_Name': triggername,
      'Trigger': trigger,
      'Device_Trigger': devicetrigger,
      'Trigger_Group': triggergroup,
      'Active_Days': schedule,
      'Device': device,
      'Device_Group': devicegroup,
      'Location_Group': locationgroup,
      'Location': location,
      'NumberOfAction': numberofaction,
      'URL': url,
    };
  }
}
