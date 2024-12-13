import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../../data/models/models/enums.dart';
import '../../../data/models/models/models.dart';

class DatabaseService {
  late final Box _common;

  late final Box<SleepData> _sleepDataBox;
  late final Box<EnergyData> _energyDataBox;
  late final Box<ChartDataNotes> _chartDataNotesBox;

  // Инициализация Hive
  Future<DatabaseService> init() async {
    try {
      final appDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDirectory.path);

      // Register adapters
      Hive.registerAdapter(SleepDataAdapter());
      Hive.registerAdapter(SleepFactorAdapter());
      Hive.registerAdapter(SleepFactorTypeAdapter());
      Hive.registerAdapter(EnergyDataAdapter());
      Hive.registerAdapter(EnergyFactorAdapter());
      Hive.registerAdapter(EnergyFactorTypeAdapter());
      Hive.registerAdapter(DayTimeAdapter());
      Hive.registerAdapter(ChartDataNotesAdapter());

      // Open boxes
      _sleepDataBox = await Hive.openBox<SleepData>('sleepData');
      _energyDataBox = await Hive.openBox<EnergyData>('energyData');
      _chartDataNotesBox = await Hive.openBox<ChartDataNotes>('chartDataNotes');

      // deleteAll();

      _common = await Hive.openBox('common');

      return this;
    } catch (e, stackTrace) {
      print('Error initializing database: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  void deleteAll() {
    Hive.deleteBoxFromDisk('sleepData');
    Hive.deleteBoxFromDisk('energyData');
    Hive.deleteBoxFromDisk('chartDataNotes');
  }

  void put(String key, dynamic value) => _common.put(key, value);

  dynamic get(String key) => _common.get(key);

  static final DatabaseService _instance = DatabaseService._internal();

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  Future<void> saveSleepData(SleepData sleepData) async {
    await _sleepDataBox.put(sleepData.id, sleepData);
  }

  Future<List<SleepData>> getSleepData() async {
    return _sleepDataBox.values.toList();
  }

  Future<void> deleteSleepData(String id) async {
    await _sleepDataBox.delete(id);
  }

  Future<void> saveEnergyData(EnergyData energyData) async {
    await _energyDataBox.put(energyData.id, energyData);
  }

  Future<List<EnergyData>> getEnergyData() async {
    return _energyDataBox.values.toList();
  }

  Future<void> deleteEnergyData(String id) async {
    await _energyDataBox.delete(id);
  }

  Future<void> saveChartDataNotes(ChartDataNotes chartDataNotes) async {
    await _chartDataNotesBox.put(
        chartDataNotes.date.copyWith(
          hour: 0,
          microsecond: 0,
          millisecond: 0,
          minute: 0,
          second: 0,).toString(),
        chartDataNotes);
  }

  Future<List<ChartDataNotes>> getChartDataNotes() async {
    return _chartDataNotesBox.values.toList();
  }

  Future<void> deleteChartDataNotes(DateTime date) async {
    await _chartDataNotesBox.delete(date.toString());
  }

  // Cleanup method
  Future<void> dispose() async {
    await _sleepDataBox.close();
    await _energyDataBox.close();
    await _chartDataNotesBox.close();
    await _common.close();
    await Hive.close();
  }
}
