import 'package:flutter/material.dart';
import 'package:zeus/db_helper/supabase.dart';
import 'package:zeus/widgets/battery.dart';
import 'package:zeus/widgets/battery_entry.dart';

class Dashboard extends StatefulWidget {
  
  Dashboard({super.key});
  List<Battery> batteries = [];
  final TextEditingController statusController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController percentController = TextEditingController();
  final TextEditingController voltage0Controller = TextEditingController();
  final TextEditingController voltage1Controller = TextEditingController();
  final TextEditingController voltage2Controller = TextEditingController();
  final TextEditingController resController = TextEditingController();

   final TextEditingController statusController2 = TextEditingController();
  final TextEditingController nameController2 = TextEditingController();
  final TextEditingController percentController2 = TextEditingController();
  final TextEditingController voltage0Controller2 = TextEditingController();
  final TextEditingController voltage1Controller2 = TextEditingController();
  final TextEditingController voltage2Controller2 = TextEditingController();
  final TextEditingController resController2 = TextEditingController();
  @override
  State<Dashboard> createState() => _DashboardState();


  void addBattery(Battery battery)
  {
    Database.addBattery(battery);
    showBatteries();
    print("Added Battery");
  }

  Future<void> showBatteries() async {
    batteries = await Database.fetchData() ?? [];
    print("Fetched Batteries");
  }

  void updateBattery(Battery battery)
  {
    // var batteryToUpdate = batteries.firstWhere((batteryLoop) => batteryLoop.name == battery.name);
    // batteryToUpdate.percent = battery.percent;
    // batteryToUpdate.resistance = battery.resistance;
    // batteryToUpdate.status = battery.status;
    // batteryToUpdate.voltage0 = battery.voltage0;
    // batteryToUpdate.voltage1 = battery.voltage1;
    // batteryToUpdate.voltage2 = battery.voltage2;
    Database.updateBattery(battery);
    showBatteries();
    print("Updated battery");
  }

  Status parseStatus(String status) {
  return Status.values.firstWhere((e) => e.toString().split('.').last == status);
  }

  
}


class _DashboardState extends State<Dashboard> {
  @override
  initState()  {
    super.initState();
    print("Init");
    setState(() {
      widget.showBatteries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(0, 28, 28, 28),
      body:
    Column(
      children: 
      [Expanded(child: ListView.builder
      (
        padding: const EdgeInsets.all(8),
        itemCount: widget.batteries.length,
        itemBuilder: (BuildContext context, int index) 
          {
            return BatteryEntry(batteryContainer: widget.batteries[index],);
          }
      )
    ),
    GestureDetector(
            onTap: ()
            {
              showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
              title: Text("Battery Information"),
              content:  Column(children: 
              [
                TextField(
                  controller: widget.nameController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.statusController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Status',
                ),
                ),
                SizedBox(height: 3,),  
                 TextField(
                  controller: widget.percentController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Percent',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.voltage0Controller,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Voltage 0',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.voltage1Controller,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Voltage 1',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.voltage2Controller,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Voltage 2',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.resController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Resistance',
                ),
                ),
            SizedBox(height: 3,),
            GestureDetector(
            onTap: ()
            {
            setState((){widget.addBattery(Battery(widget.parseStatus(widget.statusController.text), widget.nameController.text, double.parse(widget.percentController.text), double.parse(widget.resController.text), double.parse(widget.voltage0Controller.text), double.parse(widget.voltage1Controller.text), double.parse(widget.voltage2Controller.text)));});
            },
            child: const Center(
              child: Card(
                  color: Color.fromARGB(223, 255, 199, 88),
                  child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Create", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 20),),
                ),),
            ),
          ),

              ],),
              );
              });
            },
            child: Center(
              child: Card(
                  color: Color.fromARGB(223, 255, 199, 88),
                  child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Add Battery", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 20),),
                ),),
            ),
          ),
       GestureDetector(
            onTap: ()
            {
              showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
              title: Text("Battery Information"),
              content:  Column(children: 
              [
                TextField(
                  controller: widget.nameController2,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.statusController2,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Status',
                ),
                ),
                SizedBox(height: 3,),  
                 TextField(
                  controller: widget.percentController2,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Percent',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.voltage0Controller2,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Voltage 0',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.voltage1Controller2,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Voltage 1',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.voltage2Controller2,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Voltage 2',
                ),
                ),
                SizedBox(height: 3,),
                 TextField(
                  controller: widget.resController2,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Resistance',
                ),
                ),
            SizedBox(height: 3,),
            GestureDetector(
            onTap: ()
            {
            setState(()
            {
              widget.updateBattery(
              Battery(widget.parseStatus(widget.statusController2.text), 
                      widget.nameController2.text, 
                      double.parse(widget.percentController2.text), 
                      double.parse(widget.resController2.text), 
                      double.parse(widget.voltage0Controller2.text),
                      double.parse(widget.voltage1Controller2.text), 
                      double.parse(widget.voltage2Controller2.text))); 
            }
            );
            },
            child: const Center(
              child: Card(
                  color: Color.fromARGB(223, 255, 199, 88),
                  child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Update", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 20),),
                ),),
            ),
          ),

              ],),
              );
              });
            },
            child: Center(
              child: Card(
                  color: Color.fromARGB(223, 255, 199, 88),
                  child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Update Battery", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 20),),
                ),),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              setState(() {
                widget.showBatteries();
              });
            },
            child: Center(
              child: Card(
                  color: Color.fromARGB(223, 255, 199, 88),
                  child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Refresh", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 20),),
                ),),
            ),
          ),
    ]));
  }
}