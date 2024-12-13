import 'package:hive/hive.dart';
import 'package:pp_750/data/models/models/enums.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class SleepData extends HiveObject {
  @HiveField(0)
  DateTime fallAsleepTime;
  @HiveField(1)
  DateTime wakeUpTime;
  @HiveField(2)
  int sleepQuality;
  @HiveField(3)
  List<SleepFactor> sleepFactors;
  @HiveField(4)
  String id;
  @HiveField(5)
  String? note;

  SleepData({
    required this.id,
    required this.fallAsleepTime,
    required this.wakeUpTime,
    required this.sleepQuality,
    required this.sleepFactors,
    this.note,
  });

  double get sleepDurationPercent =>
      (fallAsleepTime.difference(wakeUpTime).inHours / 24).abs();
}

@HiveType(typeId: 1)
class SleepFactor extends HiveObject {
  @HiveField(0)
  SleepFactorType type;
  @HiveField(1)
  bool value;

  SleepFactor({
    required this.type,
    required this.value,
  });
}

@HiveType(typeId: 2)
class EnergyData extends HiveObject {
  @HiveField(0)
  DateTime dateTime;
  @HiveField(1)
  List<EnergyFactor> energyFactors;
  @HiveField(2)
  String id;

  EnergyData({
    required this.dateTime,
    required this.energyFactors,
    required this.id,
  });

  double get energyLevelMid =>
      energyFactors.map((e) => e.energyLevel).reduce((a, b) => a + b) /
      energyFactors.length;
}

@HiveType(typeId: 3)
class EnergyFactor extends HiveObject {
  @HiveField(0)
  EnergyFactorType type;
  @HiveField(1)
  int energyLevel;
  @HiveField(2)
  DayTime dayTime;

  EnergyFactor({
    required this.type,
    required this.energyLevel,
    required this.dayTime,
  });
}


@HiveType(typeId: 4)
class ChartDataNotes extends HiveObject {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  String  sleepNote;
  @HiveField(2)
  String  energyNote;

  ChartDataNotes({
    required this.date,
    required this.sleepNote,
    required this.energyNote,
  });

  //copy with method
  ChartDataNotes copyWith({
    DateTime? date,
    String? sleepNote,
    String? energyNote,
  }) {
    return ChartDataNotes(
      date: date ?? this.date,
      sleepNote: sleepNote ?? this.sleepNote,
      energyNote: energyNote ?? this.energyNote,
    );
  }
}