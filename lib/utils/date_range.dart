

import 'package:intl/intl.dart';

class DateRange {
  final String id;
  final String name;
  final int Function() start;
  final int Function() end;

  DateRange(this.id, this.name, this.start, this.end);

  @override
  String toString() {
    return {'id': id, 'name': name, 'start': start, 'end': end}.toString();
  }
}

DateTime get lastMidnight => now.subtract(Duration(
      hours: now.hour,
      minutes: now.minute,
      seconds: now.second,
      milliseconds: now.millisecond,
      microseconds: now.microsecond,
    ));

DateTime get now => DateTime.now();

int get year => now.year;

int get month => now.month;