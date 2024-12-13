import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:pp_750/core/services/database/database_service.dart';
import 'package:pp_750/data/models/models/models.dart';
import 'package:pp_750/widgets/custom_elevated_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';

@RoutePage()
class ChartDataScreen extends StatefulWidget {
  const ChartDataScreen({super.key});

  @override
  State<ChartDataScreen> createState() => _ChartDataScreenState();
}

class _ChartDataScreenState extends State<ChartDataScreen> {
  DatabaseService _databaseService = GetIt.instance<DatabaseService>();
  final TextEditingController _sleepNoteController = TextEditingController();
  final TextEditingController _energyNoteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // Функция для получения дат недели
  List<DateTime> getWeekDates() {
    // День начала недели (понедельник)
    final monday =
        _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
    // Создаем список дат с понедельника по воскресенье
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  List<SleepData> _sleepData = [];
  List<EnergyData> _energyData = [];
  List<ChartDataNotes> _chartDataNotes = [];
  final List<ChartData> _sleepDataChart = [];
  final List<ChartData> _energyDataChart = [];

  bool _isSleepNoteEditing = false;
  bool _isEnergyNoteEditing = false;

  @override
  void initState() {
    super.initState();

    _init();
  }

  _init() async {
    _sleepData = await _databaseService.getSleepData();
    _energyData = await _databaseService.getEnergyData();
    _chartDataNotes = await _databaseService.getChartDataNotes();
    _sleepDataChart.clear();
    _energyDataChart.clear();

    _sleepNoteController.text = _currentChartDataNotes.sleepNote;
    _energyNoteController.text = _currentChartDataNotes.energyNote;

//get sleep data by date range
    for (var i = 0; i < _sleepData.length; i++) {
      if (_sleepData[i].fallAsleepTime.isAfter(getWeekDates()[0]) &&
          _sleepData[i].fallAsleepTime.isBefore(getWeekDates()[6])) {
        _sleepDataChart.add(ChartData(
            DateFormat('E').format(_sleepData[i].fallAsleepTime),
            _sleepData[i].sleepQuality.toDouble()));
      }
    }

    //get energy data by date range
    for (var i = 0; i < _energyData.length; i++) {
      if (_energyData[i].dateTime.isAfter(getWeekDates()[0]) &&
          _energyData[i].dateTime.isBefore(getWeekDates()[6])) {
        _energyDataChart.add(ChartData(
            DateFormat('E').format(_energyData[i].dateTime),
            _energyData[i].energyLevelMid));
        // .energyFactors
        // .map((e) => e.energyLevel)
        // .reduce((value, element) => value + element)
        // .toDouble()));
      }
    }

    setState(() {});
  }

  ChartDataNotes get _currentChartDataNotes => _chartDataNotes.firstWhere(
        (element) =>
            element.date.day == getWeekDates()[0].day &&
            element.date.month == getWeekDates()[0].month &&
            element.date.year == getWeekDates()[0].year,
        orElse: () => ChartDataNotes(
            date: getWeekDates()[0].copyWith(
              hour: 0,
              microsecond: 0,
              millisecond: 0,
              minute: 0,
              second: 0,
            ),
            sleepNote: '',
            energyNote: ''),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomIconButton(
            decoration: IconButtonStyleHelper.fillPrimaryContainer.copyWith(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate =
                            _selectedDate.subtract(const Duration(days: 7));
                        _init();
                      });
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(DateFormat('d MMM').format(getWeekDates()[0]) +
                        ' - ' +
                        DateFormat('d MMM').format(getWeekDates()[6])),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate =
                            _selectedDate.add(const Duration(days: 7));
                        _init();
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Hours of sleep',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(maximum: 24),
                series: <CartesianSeries>[
                  ColumnSeries<ChartData, String>(
                    dataSource: _sleepDataChart,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.colorScheme.primary,
                        appTheme.blueGray100,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Note',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _sleepNoteController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isSleepNoteEditing = true;
                        });
                      },
                      maxLines: null,
                    ),
                    if (_isSleepNoteEditing)
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomElevatedButton(
                          height: 40,
                          width: 100,
                          text: 'Save',
                          onPressed: () {
                            _databaseService.saveChartDataNotes(
                                _currentChartDataNotes.copyWith(
                                    sleepNote: _sleepNoteController.text));
                            setState(() {
                              _isSleepNoteEditing = false;
                            });

                            _init();
                          },
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Energy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(maximum: 100),
                series: <CartesianSeries>[
                  ColumnSeries<ChartData, String>(
                    dataSource: _energyDataChart,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    //color: const Color(0xFF8BC34A),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        appTheme.green0,
                        appTheme.blueGray100,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Note',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _energyNoteController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          _isEnergyNoteEditing = true;
                        });
                      },
                    ),
                    if (_isEnergyNoteEditing)
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomElevatedButton(
                          height: 40,
                          width: 100,
                          text: 'Save',
                          onPressed: () {
                            _databaseService.saveChartDataNotes(
                                _currentChartDataNotes.copyWith(
                                    energyNote: _energyNoteController.text));
                            setState(() {
                              _isEnergyNoteEditing = false;
                            });
                            _init();
                          },
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
