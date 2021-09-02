import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List? properties;

  Failure([this.properties]);

  List<Object?> get props => [properties];
}
