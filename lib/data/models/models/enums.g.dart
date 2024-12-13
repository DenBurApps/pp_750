// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepFactorTypeAdapter extends TypeAdapter<SleepFactorType> {
  @override
  final int typeId = 10;

  @override
  SleepFactorType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SleepFactorType.socks;
      case 1:
        return SleepFactorType.noise;
      case 2:
        return SleepFactorType.earplugs;
      case 3:
        return SleepFactorType.alcohol;
      case 4:
        return SleepFactorType.food;
      case 5:
        return SleepFactorType.gadgets;
      case 6:
        return SleepFactorType.sleepWithPet;
      case 7:
        return SleepFactorType.openWindow;
      case 8:
        return SleepFactorType.hot;
      case 9:
        return SleepFactorType.cold;
      default:
        return SleepFactorType.socks;
    }
  }

  @override
  void write(BinaryWriter writer, SleepFactorType obj) {
    switch (obj) {
      case SleepFactorType.socks:
        writer.writeByte(0);
        break;
      case SleepFactorType.noise:
        writer.writeByte(1);
        break;
      case SleepFactorType.earplugs:
        writer.writeByte(2);
        break;
      case SleepFactorType.alcohol:
        writer.writeByte(3);
        break;
      case SleepFactorType.food:
        writer.writeByte(4);
        break;
      case SleepFactorType.gadgets:
        writer.writeByte(5);
        break;
      case SleepFactorType.sleepWithPet:
        writer.writeByte(6);
        break;
      case SleepFactorType.openWindow:
        writer.writeByte(7);
        break;
      case SleepFactorType.hot:
        writer.writeByte(8);
        break;
      case SleepFactorType.cold:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepFactorTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnergyFactorTypeAdapter extends TypeAdapter<EnergyFactorType> {
  @override
  final int typeId = 11;

  @override
  EnergyFactorType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EnergyFactorType.food;
      case 1:
        return EnergyFactorType.creation;
      case 2:
        return EnergyFactorType.rest;
      case 3:
        return EnergyFactorType.traveling;
      case 4:
        return EnergyFactorType.physicalTraining;
      case 5:
        return EnergyFactorType.nature;
      case 6:
        return EnergyFactorType.householdChores;
      case 7:
        return EnergyFactorType.communication;
      case 8:
        return EnergyFactorType.workStudy;
      default:
        return EnergyFactorType.food;
    }
  }

  @override
  void write(BinaryWriter writer, EnergyFactorType obj) {
    switch (obj) {
      case EnergyFactorType.food:
        writer.writeByte(0);
        break;
      case EnergyFactorType.creation:
        writer.writeByte(1);
        break;
      case EnergyFactorType.rest:
        writer.writeByte(2);
        break;
      case EnergyFactorType.traveling:
        writer.writeByte(3);
        break;
      case EnergyFactorType.physicalTraining:
        writer.writeByte(4);
        break;
      case EnergyFactorType.nature:
        writer.writeByte(5);
        break;
      case EnergyFactorType.householdChores:
        writer.writeByte(6);
        break;
      case EnergyFactorType.communication:
        writer.writeByte(7);
        break;
      case EnergyFactorType.workStudy:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnergyFactorTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DayTimeAdapter extends TypeAdapter<DayTime> {
  @override
  final int typeId = 12;

  @override
  DayTime read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayTime.morning;
      case 1:
        return DayTime.day;
      case 2:
        return DayTime.evening;
      default:
        return DayTime.morning;
    }
  }

  @override
  void write(BinaryWriter writer, DayTime obj) {
    switch (obj) {
      case DayTime.morning:
        writer.writeByte(0);
        break;
      case DayTime.day:
        writer.writeByte(1);
        break;
      case DayTime.evening:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
