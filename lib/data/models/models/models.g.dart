// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepDataAdapter extends TypeAdapter<SleepData> {
  @override
  final int typeId = 0;

  @override
  SleepData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepData(
      id: fields[4] as String,
      fallAsleepTime: fields[0] as DateTime,
      wakeUpTime: fields[1] as DateTime,
      sleepQuality: fields[2] as int,
      sleepFactors: (fields[3] as List).cast<SleepFactor>(),
      note: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SleepData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fallAsleepTime)
      ..writeByte(1)
      ..write(obj.wakeUpTime)
      ..writeByte(2)
      ..write(obj.sleepQuality)
      ..writeByte(3)
      ..write(obj.sleepFactors)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SleepFactorAdapter extends TypeAdapter<SleepFactor> {
  @override
  final int typeId = 1;

  @override
  SleepFactor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SleepFactor(
      type: fields[0] as SleepFactorType,
      value: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SleepFactor obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepFactorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnergyDataAdapter extends TypeAdapter<EnergyData> {
  @override
  final int typeId = 2;

  @override
  EnergyData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnergyData(
      dateTime: fields[0] as DateTime,
      energyFactors: (fields[1] as List).cast<EnergyFactor>(),
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EnergyData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.energyFactors)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnergyDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnergyFactorAdapter extends TypeAdapter<EnergyFactor> {
  @override
  final int typeId = 3;

  @override
  EnergyFactor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnergyFactor(
      type: fields[0] as EnergyFactorType,
      energyLevel: fields[1] as int,
      dayTime: fields[2] as DayTime,
    );
  }

  @override
  void write(BinaryWriter writer, EnergyFactor obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.energyLevel)
      ..writeByte(2)
      ..write(obj.dayTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnergyFactorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChartDataNotesAdapter extends TypeAdapter<ChartDataNotes> {
  @override
  final int typeId = 4;

  @override
  ChartDataNotes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChartDataNotes(
      date: fields[0] as DateTime,
      sleepNote: fields[1] as String,
      energyNote: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChartDataNotes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.sleepNote)
      ..writeByte(2)
      ..write(obj.energyNote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartDataNotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
