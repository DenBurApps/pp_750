import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pp_750/core/services/database/database_service.dart';
import 'package:pp_750/data/models/models/models.dart';
import 'package:pp_750/widgets/app_bar/custom_app_bar.dart';
import 'package:pp_750/widgets/custom_elevated_button.dart';
import 'package:pp_750/widgets/custom_icon_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/app_export.dart';
import '../../data/models/models/enums.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseService _databaseService = GetIt.I<DatabaseService>();
  TextEditingController _searchController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<EnergyData> _energyDatas = [];
  List<SleepData> __selectedSleepDatas = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    __selectedSleepDatas = await _databaseService.getSleepData();
    _energyDatas = await _databaseService.getEnergyData();
    setState(() {});
  }

  SleepData get _selectedSleepData => __selectedSleepDatas.firstWhere(
      (element) =>
          element.fallAsleepTime.day == _selectedDate.day &&
          element.fallAsleepTime.month == _selectedDate.month &&
          element.fallAsleepTime.year == _selectedDate.year,
      orElse: () => SleepData(
            id: '',
            fallAsleepTime: _selectedDate,
            wakeUpTime: _selectedDate,
            sleepQuality: 0,
            sleepFactors: [],
          ));

  EnergyData get _selectedEnergyData => _energyDatas.firstWhere(
      (element) =>
          element.dateTime.day == _selectedDate.day &&
          element.dateTime.month == _selectedDate.month &&
          element.dateTime.year == _selectedDate.year,
      orElse: () => EnergyData(
            id: '',
            dateTime: _selectedDate,
            energyFactors: [],
          ));
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          height: 80.h,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.h),
              decoration: AppDecoration.surface.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null && picked != _selectedDate) {
                          setState(() {
                            _selectedDate = picked;
                          });
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomImageView(
                                imagePath: Assets.images.calendar04,
                              ),
                              SizedBox(width: 8.h),
                              Text(
                                '${DateFormat('E, dd').format(_selectedDate)}',
                                style: CustomTextStyles.displaySmall18,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '${DateFormat('MMMM, yyyy').format(_selectedDate)}',
                            style: CustomTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomIconButton(
                    height: 34.h,
                    width: 34.h,
                    decoration: AppDecoration.secondary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Icon(
                      Icons.insert_chart_outlined_outlined,
                      color: theme.colorScheme.surface,
                      size: 24.h,
                    ),
                    onTap: () {
                      context.pushRoute(ChartDataRoute());
                    },
                  ),
                  SizedBox(width: 8.h),
                  CustomElevatedButton(
                      decoration: AppDecoration.primary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      height: 34.h,
                      buttonStyle: CustomButtonStyles.fillPrimary.copyWith(),
                      buttonTextStyle: CustomTextStyles.bodyMedium.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                      leftIcon: Icon(
                        Icons.settings_outlined,
                        color: theme.colorScheme.surface,
                        size: 24.h,
                      ),
                      width: 100.h,
                      text: 'Settings',
                      onPressed: () {
                        context.pushRoute(SettingsRoute());
                      }),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //  _buildAppBar(context, state.balanceModel),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: _buildSleepData(),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: _buildEnergyData(),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSleepData() {
    return Container(
      child: Column(
        children: [
          if (_selectedSleepData.id.isEmpty) ...[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 16.h,
              ),
              decoration: AppDecoration.bluegradient.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sleep data',
                    style: CustomTextStyles.displayMedium,
                  ),
                  SizedBox(height: 16.h),
                  CustomImageView(
                    // height: 200.h,
                    imagePath: Assets.images.img1.path,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Fill in the data about today\'s sleep',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.displayMedium.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomElevatedButton(
                    buttonStyle:
                        CustomButtonStyles.fillPrimaryContainer.copyWith(),
                    text: '',
                    rightIcon: Icon(
                      Icons.add,
                      size: 40.h,
                      color: theme.colorScheme.primary,
                    ),
                    onPressed: () {
                      context.pushRoute(AddSleepDataRoute(date: _selectedDate));
                    },
                  ),
                ],
              ),
            ),
          ],
          if (_selectedSleepData.id.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sleep data',
                        style: CustomTextStyles.displayMedium,
                      ),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          color: theme.colorScheme.primary,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('Edit'),
                            value: 'edit',
                            onTap: () {
                              context.pushRoute(AddSleepDataRoute(
                                  date: _selectedSleepData.fallAsleepTime, sleepData: _selectedSleepData));
                            },
                          ),
                          PopupMenuItem(
                            child: Text('Delete'),
                            value: 'delete',
                            onTap: () async {
                              await _databaseService.deleteSleepData(_selectedSleepData.id);
                              _init();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.h, vertical: 8.h),
                                    decoration: AppDecoration.primary.copyWith(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration:
                                              AppDecoration.white.copyWith(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: CustomImageView(
                                            imagePath: Assets.images.moon02,
                                            width: 24.h,
                                            height: 24.h,
                                          ),
                                        ),
                                        SizedBox(width: 8.h),
                                        Text(
                                            '${DateFormat('HH:mm').format(_selectedSleepData.fallAsleepTime)}',
                                            style: CustomTextStyles.bodyLarge
                                                .copyWith(
                                                    color: theme
                                                        .colorScheme.surface)),
                                      ],
                                    )),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 8.h),
                                  decoration: AppDecoration.primary.copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration:
                                            AppDecoration.white.copyWith(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: CustomImageView(
                                          imagePath: Assets.images.sun03,
                                          width: 24.h,
                                          height: 24.h,
                                        ),
                                      ),
                                      SizedBox(width: 8.h),
                                      Text(
                                          '${DateFormat('HH:mm').format(_selectedSleepData.wakeUpTime)}',
                                          style: CustomTextStyles.bodyLarge
                                              .copyWith(
                                                  color: theme
                                                      .colorScheme.surface)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 8.h),
                              decoration: AppDecoration.secondary.copyWith(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: AppDecoration.white.copyWith(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.all(4),
                                    child: CustomImageView(
                                      imagePath: Assets.images.stars,
                                      width: 24.h,
                                      height: 24.h,
                                    ),
                                  ),
                                  SizedBox(width: 8.h),
                                  Expanded(
                                    child: Text('Quality:',
                                        style: CustomTextStyles
                                            .bodyLargeBluegray100),
                                  ),
                                  SizedBox(width: 8.h),
                                  Text('${_selectedSleepData.sleepQuality}',
                                      style: CustomTextStyles
                                          .bodyLargeBluegray100),
                                  SizedBox(width: 16.h),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 8.h),
                              decoration: AppDecoration.background.copyWith(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Sleep factors:',
                                      style: CustomTextStyles.bodyLarge),
                                  const SizedBox(height: 8.0),
                                  Flexible(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        /*spacing: 8.0,
                                        runSpacing: 8.0*/
                                        children: _selectedSleepData
                                            .sleepFactors
                                            .map((factor) {
                                          return Container(
                                            child: CustomImageView(
                                              imagePath: factor.type.icon,
                                              width: 24,
                                              height: 24,
                                            ),
                                            padding: EdgeInsets.all(8),
                                            decoration:
                                                AppDecoration.white.copyWith(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              decoration: AppDecoration.background.copyWith(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Note: ',
                                      style: CustomTextStyles.bodyMedium),
                                  Text(
                                    _selectedSleepData.note ?? 'No notes',
                                    style: CustomTextStyles.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.h),
                      Row(
                        //  crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 260.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '24',
                                  style: CustomTextStyles.bodyMedium,
                                ),
                                Text(
                                  '12',
                                  style: CustomTextStyles.bodyMedium,
                                ),
                                Text(
                                  '0',
                                  style: CustomTextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.h),
                          RotatedBox(
                            quarterTurns: 3,
                            child: LinearPercentIndicator(
                              barRadius: Radius.circular(10.h),
                              width: 280.h,
                              lineHeight: 20.h,
                              percent: _selectedSleepData.sleepDurationPercent,
                              linearGradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.surface,
                                  theme.colorScheme.primary,
                                ],
                              ),
                              backgroundColor: theme.colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ],
      ),
    );
  }

  Widget _buildEnergyData() {
    if (_selectedEnergyData.id.isEmpty) {
      return Container(
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Energy data',
              style: CustomTextStyles.displayMedium,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: LinearPercentIndicator(
                        barRadius: Radius.circular(10.h),
                        width: 200.h,
                        lineHeight: 20.h,
                        percent: 0,
                        linearGradient: LinearGradient(
                          colors: [
                            theme.colorScheme.surface,
                            appTheme.green0,
                          ],
                        ),
                        backgroundColor: theme.colorScheme.surface,
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Container(
                      height: 180.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '100',
                            style: CustomTextStyles.bodyMedium,
                          ),
                          Text(
                            '50',
                            style: CustomTextStyles.bodyMedium,
                          ),
                          Text(
                            '0',
                            style: CustomTextStyles.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Fill in the energy\nlevel data',
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.displayMedium,
                    ),
                    SizedBox(height: 8.h),
                    CustomElevatedButton(
                      width: 120.h,
                      height: 30.h,
                      decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      buttonStyle: CustomButtonStyles.none.copyWith(),
                      leftIcon: Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: CustomImageView(
                          imagePath: Assets.images.sunrise,
                          width: 24.h,
                          height: 24.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      text: 'Morning',
                      onPressed: () async {
                        var result = await showModalBottomSheet(
                            context: context,
                            builder: (context) => EnergyFactorsDialog(
                                selectedTime: DayTime.morning));
                        if (result != null) {
                          EnergyData data = EnergyData(
                            id: _selectedDate.toString(),
                            dateTime: _selectedDate,
                            energyFactors: [result],
                          );
                          await _databaseService.saveEnergyData(data);
                          _init();
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(height: 8.h),
                    CustomElevatedButton(
                      width: 80.h,
                      height: 30.h,
                      decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      buttonStyle: CustomButtonStyles.none.copyWith(),
                      leftIcon: Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: CustomImageView(
                          imagePath: Assets.images.sun03,
                          width: 24.h,
                          height: 24.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      text: 'Day',
                      onPressed: () async {
                        var result = await showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                EnergyFactorsDialog(selectedTime: DayTime.day));

                        if (result != null) {
                          EnergyData data = EnergyData(
                            id: _selectedDate.toString(),
                            dateTime: _selectedDate,
                            energyFactors: [result],
                          );
                          await _databaseService.saveEnergyData(data);
                          _init();
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(height: 8.h),
                    CustomElevatedButton(
                      width: 120.h,
                      height: 30.h,
                      decoration: AppDecoration.white.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      buttonStyle: CustomButtonStyles.none.copyWith(),
                      leftIcon: Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: CustomImageView(
                          imagePath: Assets.images.sunset,
                          width: 24.h,
                          height: 24.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      text: 'Evening',
                      onPressed: () async {
                        var result = await showModalBottomSheet(
                            context: context,
                            builder: (context) => EnergyFactorsDialog(
                                selectedTime: DayTime.evening));

                        if (result != null) {
                          EnergyData data = EnergyData(
                            id: _selectedDate.toString(),
                            dateTime: _selectedDate,
                            energyFactors: [result],
                          );
                          await _databaseService.saveEnergyData(data);
                          _init();
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(width: 16.h),
              ],
            ),
          ],
        ),
      );
    }
    return Container(
      decoration: AppDecoration.surface.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Energy data',
            style: CustomTextStyles.displayMedium,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: LinearPercentIndicator(
                      barRadius: Radius.circular(10.h),
                      width: 200.h,
                      lineHeight: 20.h,
                      percent: _selectedEnergyData.energyLevelMid / 100,
                      linearGradient: LinearGradient(
                        colors: [
                          theme.colorScheme.surface,
                          appTheme.green0,
                        ],
                      ),
                      backgroundColor: theme.colorScheme.surface,
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Container(
                    height: 180.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '100',
                          style: CustomTextStyles.bodyMedium,
                        ),
                        Text(
                          '50',
                          style: CustomTextStyles.bodyMedium,
                        ),
                        Text(
                          '0',
                          style: CustomTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: SfCartesianChart(
                        annotations: <CartesianChartAnnotation>[
                          ..._selectedEnergyData.energyFactors
                              .map((e) => CartesianChartAnnotation(
                                    widget: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration:
                                          AppDecoration.background.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder20,
                                      ),
                                      child: CustomImageView(
                                        imagePath: e.type.icon,
                                        width: 24.h,
                                        height: 24.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    coordinateUnit: CoordinateUnit.point,
                                    x: e.dayTime.name,
                                    y: e.energyLevel.toDouble(),
                                  ))
                              .toList(),
                        ],
                        primaryXAxis: CategoryAxis(
                          isVisible: true,
                          labelRotation: 270,
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          isVisible: false,
                          minimum: 0,
                          maximum: 100,
                          interval: 20,
                          //   title: AxisTitle(text: 'Energy Data'),
                        ),
                        series: <CartesianSeries<EnergyFactor, String>>[
                          LineSeries<EnergyFactor, String>(
                            dataSource: [
                              ..._selectedEnergyData.energyFactors,
                            ],
                            xValueMapper: (EnergyFactor data, _) =>
                                data.dayTime.name,
                            yValueMapper: (EnergyFactor data, _) =>
                                data.energyLevel,
                            //  name: 'Energy Data',
                            color: Colors.blue,
                            width: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.h,
                ),
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(children: [
                    CustomImageView(
                      imagePath: Assets.images.sunrise,
                      width: 20.h,
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 8.h),
                    Text('Morning', style: CustomTextStyles.bodyMedium),
                  ]),
                  onPressed: () async {
                    var result = await showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            EnergyFactorsDialog(selectedTime: DayTime.morning));

                    if (result != null) {
                      _selectedEnergyData.energyFactors.add(result);
                      await _databaseService
                          .saveEnergyData(_selectedEnergyData);
                      _init();
                      setState(() {});
                    }
                  },
                ),
              ),
              SizedBox(width: 8.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.h,
                ),
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  // height: 30.h,
                  // decoration: AppDecoration.white.copyWith(
                  //   borderRadius: BorderRadiusStyle.roundedBorder20,
                  // ),
                  // buttonStyle: CustomButtonStyles.none.copyWith(),
                  // leftIcon: Padding(
                  //   padding: EdgeInsets.only(right: 8.h),
                  //   child: CustomImageView(
                  //     imagePath: Assets.images.sun03,
                  //     width: 20.h,
                  //     height: 20.h,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  // text: 'Day',
                  child: Row(
                    children: [


                      CustomImageView(
                        imagePath: Assets.images.sun03,
                        width: 20.h,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8.h),
                      Text('Day', style: CustomTextStyles.bodyMedium),
                    ],
                  ),
                  onPressed: () async {
                    var result = await showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            EnergyFactorsDialog(selectedTime: DayTime.day));

                    if (result != null) {
                      _selectedEnergyData.energyFactors.add(result);
                      await _databaseService
                          .saveEnergyData(_selectedEnergyData);
                      _init();
                      setState(() {});
                    }
                  },
                ),
              ),
              SizedBox(width: 8.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.h,
                ),
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  // height: 30.h,
                  // decoration: AppDecoration.white.copyWith(
                  //   borderRadius: BorderRadiusStyle.roundedBorder20,
                  // ),
                  // buttonStyle: CustomButtonStyles.none.copyWith(),
                  // leftIcon: Padding(
                  //   padding: EdgeInsets.only(right: 8.h),
                  //   child: CustomImageView(
                  //     imagePath: Assets.images.sunset,
                  //     width: 20.h,
                  //     height: 20.h,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  //text: 'Evening',
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: Assets.images.sunset,
                        width: 20.h,
                        height: 20.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8.h),
                      Text('Evening', style: CustomTextStyles.bodyMedium),
                    ],
                  ),
                  onPressed: () async {
                    var result = await showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            EnergyFactorsDialog(selectedTime: DayTime.evening));
                    if (result != null) {
                      _selectedEnergyData.energyFactors.add(result);
                      await _databaseService
                          .saveEnergyData(_selectedEnergyData);
                      _init();
                      setState(() {});
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EnergyFactorsDialog extends StatefulWidget {
  final DayTime selectedTime;

  const EnergyFactorsDialog({super.key, required this.selectedTime});

  @override
  State<EnergyFactorsDialog> createState() => _EnergyFactorsDialogState();
}

class _EnergyFactorsDialogState extends State<EnergyFactorsDialog> {
  int _quality = 0;
  EnergyFactorType? _selectedFactors;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        //padding: EdgeInsets.all(16),
        //  width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: CustomImageView(
                      imagePath: widget.selectedTime.icon,
                      width: 24,
                      height: 24,
                    ),
                    label: Text(
                      widget.selectedTime.name,
                      style: CustomTextStyles.bodyLarge,
                    ),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  valueIndicatorTextStyle: CustomTextStyles.bodyLarge.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  valueIndicatorColor:
                      Colors.blue, // Background color for value indicator
                ),
                child: Slider(
                  activeColor: appTheme.blueGray100,
                  inactiveColor: appTheme.blueGray100,
                  thumbColor: theme.colorScheme.primary,
                  label: _quality.toStringAsFixed(0),
                  value: _quality.toDouble(),
                  secondaryActiveColor: theme.colorScheme.primary,
                  onChanged: (value) {
                    setState(() {
                      _quality = value.round();
                    });
                  },

                  //semanticFormatterCallback: (value) => "$value",
                  min: 0,
                  max: 100,
                  divisions: 10,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Energy factors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: EnergyFactorType.values
                    .map((e) => ChoiceChip(
                        padding: EdgeInsets.zero,
                        avatar: Container(
                          decoration: AppDecoration.fillIndigo.copyWith(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(4),
                          child: CustomImageView(
                            imagePath: e.icon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        backgroundColor: theme.colorScheme.onPrimary,
                        selectedColor: theme.colorScheme.primary,
                        showCheckmark: false,
                        selected: _selectedFactors == e,
                        onSelected: (value) {
                          setState(() {
                            _selectedFactors = e;
                          });
                        },
                        label:
                            _buildFactor(e, isSelected: _selectedFactors == e)))
                    .toList(),
              ),
              SizedBox(height: 24),
              CustomElevatedButton(
                onPressed: () {
                  EnergyFactor factor = EnergyFactor(
                    type: _selectedFactors!,
                    energyLevel: _quality,
                    dayTime: widget.selectedTime,
                  );

                  context.maybePop(factor);
                },
                text: "Apply",
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle:
                    CustomTextStyles.bodyMediumBluegray100.copyWith(
                        //color: theme.colorScheme.surface,
                        ),
                // style: ElevatedButton.styleFrom(
                //   padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFactor(EnergyFactorType factor, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          // decoration: AppDecoration.white.copyWith(
          //   borderRadius: BorderRadius.circular(8),
          // ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                factor.name,
                style: CustomTextStyles.bodyMedium.copyWith(
                  color: isSelected
                      ? appTheme.blueGray10001
                      : theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
