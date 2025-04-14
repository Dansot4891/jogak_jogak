// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class HomeState {
  final int level;
  final File? file;

  const HomeState({this.level = 3, this.file});

  HomeState copyWith({int? level, File? file}) {
    return HomeState(level: level ?? this.level, file: file);
  }
}
