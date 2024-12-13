import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/app_export.dart';

part 'enums.g.dart';

enum AgreementType {
  privacy,
  terms,
}
// Training difficulty enum
@HiveType(typeId: 10)
enum SleepFactorType{
  @HiveField(0)
  socks,
  @HiveField(1)
  noise,
  @HiveField(2)
  earplugs,
  @HiveField(3)
  alcohol,
  @HiveField(4)
  food,
  @HiveField(5)
  gadgets,
  @HiveField(6)
  sleepWithPet,
  @HiveField(7)
  openWindow,
  @HiveField(8)
  hot,
  @HiveField(9)
  cold,;


  String get name {
    switch (this) {
      case SleepFactorType.socks:
        return 'Socks';
      case SleepFactorType.noise:
        return 'Noise';
      case SleepFactorType.earplugs:
        return 'Earplugs';
      case SleepFactorType.alcohol:
        return 'Alcohol';
      case SleepFactorType.food:
        return 'Food';
      case SleepFactorType.gadgets:
        return 'Gadgets';
      case SleepFactorType.sleepWithPet:
        return 'Sleep with pet';
      case SleepFactorType.openWindow:
        return 'Open window';
      case SleepFactorType.hot:
        return 'Hot';
      case SleepFactorType.cold:
        return 'Cold';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case SleepFactorType.socks:
        return Assets.images.sockIcon1;
      case SleepFactorType.noise:
        return Assets.images.loudspeakerIcon1;
      case SleepFactorType.earplugs:
        return Assets.images.headphonesIcon1;
      case SleepFactorType.alcohol:
        return Assets.images.glassOfWineIcon1;
      case SleepFactorType.food:
        return Assets.images.appleIcon2;
      case SleepFactorType.gadgets:
        return Assets.images.iphoneIcon1;
      case SleepFactorType.sleepWithPet:
        return Assets.images.petSPawIcon1;
      case SleepFactorType.openWindow:
        return Assets.images.openWindowIcon1;
      case SleepFactorType.hot:
        return Assets.images.fireIcon1;
      case SleepFactorType.cold:
        return Assets.images.snowflakeIcon1;
      default:
        return '';
    }
  }

}

// Training type enum
@HiveType(typeId: 11)
enum EnergyFactorType {
  @HiveField(0)
  food,
  @HiveField(1)
  creation,
  @HiveField(2)
  rest,
  @HiveField(3)
  traveling,

  @HiveField(4)
  physicalTraining,
  @HiveField(5)
  nature,
  @HiveField(6)
  householdChores,
  @HiveField(7)
  communication,
  @HiveField(8)
  workStudy,;

  String get name {
    switch (this) {
      case EnergyFactorType.food:
        return 'Food';
      case EnergyFactorType.creation:
        return 'Creation';
      case EnergyFactorType.rest:
        return 'Rest';
      case EnergyFactorType.traveling:
        return 'Traveling';
      case EnergyFactorType.physicalTraining:
        return 'Physical training';
      case EnergyFactorType.nature:
        return 'Nature';
      case EnergyFactorType.householdChores:
        return 'Household chores';
      case EnergyFactorType.communication:
        return 'Communication';
      case EnergyFactorType.workStudy:
        return 'Work/study';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case EnergyFactorType.food:
        return Assets.images.food;
      case EnergyFactorType.creation:
        return Assets.images.blushBrush02;
      case EnergyFactorType.rest:
        return Assets.images.bedDouble;
      case EnergyFactorType.traveling:
        return Assets.images.van;
      case EnergyFactorType.physicalTraining:
        return Assets.images.dumbbell02;
      case EnergyFactorType.nature:
        return Assets.images.naturalFood;
      case EnergyFactorType.householdChores:
        return Assets.images.brush;
      case EnergyFactorType.communication:
        return Assets.images.messageMultiple01;
      case EnergyFactorType.workStudy:
        return Assets.images.work;
      default:
        return '';
    }
  }


}

//Day time enum
@HiveType(typeId: 12)
enum DayTime {
  @HiveField(0)
  morning,
  @HiveField(1)
  day,
  @HiveField(2)
  evening,;

  String get name {
    switch (this) {
      case DayTime.morning:
        return 'Morning';
      case DayTime.day:
        return 'Day';
      case DayTime.evening:
        return 'Evening';
      default:
        return '';
    }
  }

  String get icon {
    switch (this) {
      case DayTime.morning:
        return Assets.images.sunrise;
      case DayTime.day:
        return Assets.images.sun03;
      case DayTime.evening:
        return Assets.images.sunset;
      default:
        return '';
    }
  }
}

