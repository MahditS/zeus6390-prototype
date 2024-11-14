import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zeus/widgets/battery.dart';

class Database{
  static var table = "Batteries";
  static Future<void> addBattery(Battery battery) async {
    try {
      print("SUPABASE ADDED BATTERY");
      await Supabase.instance.client
          .from(table)
          .insert({
        'Name': battery.name,
        'Status': battery.status.toString(),
        'Percent': battery.percent,
        'Voltage 0': battery.voltage0,
        'Voltage 1': battery.voltage1,
        'Voltage 2': battery.voltage2,
        'Resistance': battery.resistance,
      });
    } catch (error) {
      print(error);
    }
  }

  static Future<void> updateBattery(Battery battery) async {
    try {
      await Supabase.instance.client.from('Batteries')
      .update({'Status' : battery.status.toString()})
      .eq('Name', battery.name); 
      await Supabase.instance.client.from('Batteries')
      .update({'Percent' : battery.percent})
      .eq('Name', battery.name); 
      await Supabase.instance.client.from('Batteries')
      .update({'Voltage 0' : battery.voltage0})
      .eq('Name', battery.name); 
       await Supabase.instance.client.from('Batteries')
      .update({'Voltage 1' : battery.voltage1})
      .eq('Name', battery.name); 
       await Supabase.instance.client.from('Batteries')
      .update({'Voltage 2' : battery.voltage2})
      .eq('Name', battery.name); 
       await Supabase.instance.client.from('Batteries')
      .update({'Resistance' : battery.resistance})
      .eq('Name', battery.name); 
      print("SUPABASE UPDATING BATTERY");
    } catch (error) {
      print(error);
    }
  }


  static Status parseStatus(String status) {
  var newStatus = status.replaceAll("Status.", "");
  return Status.values.firstWhere((e) => e.toString().split('.').last == newStatus);
  }


   static Future<List<Battery>?> fetchData() async {
    try {
      final data = await Supabase.instance.client.from('Batteries').select();
      List<Battery> batteries = [];
      for(var item in data)
      {
        Battery battery = Battery(parseStatus(item['Status']), item['Name'], item['Percent'], item['Resistance'], item['Voltage 0'], item['Voltage 1'], item['Voltage 2']);
        batteries.add(battery);
      }
      return batteries;
    } catch (error) {
      print(error);
      return null;
    }
  }
}