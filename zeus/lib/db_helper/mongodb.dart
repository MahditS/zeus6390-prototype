
// import 'dart:developer';

// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:zeus/db_helper/constants.dart';
// import 'package:zeus/widgets/battery.dart';

// class MongoDatabase{
// static var  db , batteryCollection;
// static connect()
// async {
//   db = await Db.create(MONGO_CONN_URL);
//   await db.open();
//   inspect(db);
//   // if (kDebugMode) {
//   print("connected");
//   // }
//   batteryCollection = db.collection(BATTERY_COLLECTION);

// }

// static insertBattery(Battery battery)
// async {
//   print("Inserted into database");

//    await batteryCollection.insertMany([
//     {
//       'Name':battery.name,
//       'Status':battery.status.toString(),
//       'Percent':battery.percent,
//       'Voltage0':battery.voltage0,
//       'Voltage1':battery.voltage1,
//       'Voltage2':battery.voltage2,
//       'Resistance':battery.resistance,
//     },
//   ]);
// }

// static updateBattery(Battery battery)
// async {
//   print("Inserted into database");

//   var filter = where.eq('Name', battery.name);

//   var status = modify.push('Status', battery.status);
//   var percent = modify.push('Status', battery.percent);
//   var voltage0 = modify.push('Status', battery.voltage0);
//   var voltage1 = modify.push('Status', battery.voltage1);
//   var voltage2 = modify.push('Status', battery.voltage2);
//   var resistance = modify.push('Status', battery.resistance);

//   await batteryCollection.update(filter, status);
//   await batteryCollection.update(filter, percent);
//   await batteryCollection.update(filter, voltage0);
//   await batteryCollection.update(filter, voltage1);
//   await batteryCollection.update(filter, voltage2);
//   await batteryCollection.update(filter, resistance);
  
// }

// }