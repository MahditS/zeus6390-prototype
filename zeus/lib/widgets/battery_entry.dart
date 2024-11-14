import 'package:flutter/material.dart';
import 'battery.dart';

class BatteryEntry extends StatefulWidget {
  final Battery? batteryContainer; 
  const BatteryEntry({super.key, this.batteryContainer});

  @override
  State<BatteryEntry> createState() => _BatteryEntryState();
}

class _BatteryEntryState extends State<BatteryEntry> {
  @override
  Widget build(BuildContext context) {
    if (widget.batteryContainer == null) {
      return const Text('No battery data available');
    }

    final battery = widget.batteryContainer!;

    return ExpansionTile(
      title: Text(battery.name),
      backgroundColor: Color.fromARGB(255, 255, 245, 107),
      children: <Widget>[
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Status:"),
              Text(battery.status.toString().split('.').last),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Percent:"),
              Text("${battery.percent}%"),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Voltage 0:"),
              Text("${battery.voltage0}V"),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Voltage 1:"),
              Text("${battery.voltage1}V"),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Voltage 2:"),
              Text("${battery.voltage2}V"),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Resistance:"),
              Text("${battery.resistance}Ω"),
            ],
          ),
        ),
      ],
    );
  }
}
