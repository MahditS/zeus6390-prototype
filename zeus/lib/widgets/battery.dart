class Battery
{
  String name;
  Status status;
  double percent;
  double voltage0;
  double voltage1;
  double voltage2;
  double resistance;
  Battery(this.status, this.name, this.percent, this.resistance, this.voltage0, this.voltage1, this.voltage2);
}

enum Status
{
  Good,
  Fair,
  Bad,
  ChargeBattery
}