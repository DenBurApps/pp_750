import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pp_750/core/app_export.dart';
import 'package:pp_750/core/services/database/database_service.dart';
import 'package:pp_750/data/models/models/enums.dart';
import 'package:pp_750/widgets/custom_elevated_button.dart';
import 'package:pp_750/widgets/custom_icon_button.dart';

import '../../data/models/models/models.dart';

@RoutePage()
class AddSleepDataScreen extends StatefulWidget {
  final SleepData? sleepData;
  final DateTime date;

  const AddSleepDataScreen({super.key, this.sleepData, required this.date});

  @override
  State<AddSleepDataScreen> createState() => _AddSleepDataScreenState();
}

class _AddSleepDataScreenState extends State<AddSleepDataScreen> {
  DatabaseService _databaseService = GetIt.instance<DatabaseService>();
  TimeOfDay fellAsleep = TimeOfDay(hour: 20, minute: 0);
  TimeOfDay wakeUp = TimeOfDay(hour: 8, minute: 0);
  double sleepQuality = 5;
  List<SleepFactorType> selectedFactors = [];
  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
        super.initState();
        _init();
  }

  _init()
  {
    if (widget.sleepData != null) {
      fellAsleep = TimeOfDay.fromDateTime(widget.sleepData!.fallAsleepTime);
      wakeUp = TimeOfDay.fromDateTime(widget.sleepData!.wakeUpTime);
      sleepQuality = widget.sleepData!.sleepQuality.toDouble();
      selectedFactors.addAll(widget.sleepData!.sleepFactors.map((e) => e.type));
      noteController.text = widget.sleepData!.note ?? '';
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsVisible = MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0;
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
            children: [
              // Fell Asleep and Wake Up
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSelector("Fell asleep", fellAsleep, (newTime) {
                    setState(() => fellAsleep = newTime);
                  }),
                  SizedBox(width: 16),
                  _buildTimeSelector("Wake up", wakeUp, (newTime) {
                    setState(() => wakeUp = newTime);
                  }),
                ],
              ),
              SizedBox(height: 16),
              // Quality Slider
              Container(
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Quality",
                      style: CustomTextStyles.displaySmall,
                    ),
                    Slider(
                      value: sleepQuality,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: sleepQuality.toStringAsFixed(0),
                      onChanged: (value) {
                        setState(() => sleepQuality = value);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              // Sleep Factors
              Container(
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Sleep factors",
                      style: CustomTextStyles.displaySmall,
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: SleepFactorType.values.map((factor) {
                        final isSelected =
                        selectedFactors.contains(factor);
                        return ChoiceChip(
                          padding: EdgeInsets.zero,
                          avatar: Container(
                            decoration: AppDecoration.fillIndigo.copyWith(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(4),
                            child: CustomImageView(
                              imagePath: factor.icon,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          backgroundColor: theme.colorScheme.onPrimary,
                          selectedColor: theme.colorScheme.primary,
                          showCheckmark: false,
                          selected: selectedFactors.contains(factor),
                          onSelected: (value) {
                            setState(() {
                              if (value) {
                                selectedFactors.add(factor);
                              } else {
                                selectedFactors.remove(factor);
                              }
                            });
                          },
                          label: Container(
                            padding: EdgeInsets.all(12),
                            // decoration: AppDecoration.primary.copyWith(
                            //   color: isSelected
                            //       ? theme.colorScheme.primary
                            //       : Colors.white,
                            //   borderRadius: BorderRadius.circular(8),
                            // ),
                            child: Text(
                              factor.name,
                              style: CustomTextStyles.bodyMedium.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),
              // Note
              Container(
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Note",
                      style: CustomTextStyles.displaySmall,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: noteController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Describe how you slept",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 120.h),

            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: !keyboardIsVisible,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: CustomElevatedButton(
              buttonStyle: CustomButtonStyles.fillPrimary,
              buttonTextStyle: CustomTextStyles.displayMedium.copyWith(
                color: Colors.white,
              ),
              text: 'Save',
              onPressed: () async {
                SleepData sleepData = SleepData(
                  id: widget.sleepData?.id ?? DateTime.now().toString(),
                  fallAsleepTime: DateTime(
                    widget.date.year,
                    widget.date.month,
                    widget.date.day,
                    fellAsleep.hour,
                    fellAsleep.minute,
                  ),
                  wakeUpTime: DateTime(
                    widget.date.year,
                    widget.date.month,
                    widget.date.day,
                    wakeUp.hour,
                    wakeUp.minute,
                  ),
                  sleepQuality: sleepQuality.toInt(),
                  sleepFactors: selectedFactors
                      .map((factor) =>
                      SleepFactor(
                        type: factor,
                        value: true,
                      ))
                      .toList(),
                  note: noteController.text,
                );
                await _databaseService.saveSleepData(sleepData);

                context.replaceRoute(HomeRoute());
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildTimeSelector(String title, TimeOfDay time,
      ValueChanged<TimeOfDay> onTimeChanged) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: AppDecoration.white.copyWith(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: CustomTextStyles.displaySmall),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                final newTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                );
                if (newTime != null) onTimeChanged(newTime);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time.format(context),
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
