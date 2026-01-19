import 'package:equatable/equatable.dart';

enum BaseStatus { initial, loading, success, error, empty, noInternet }

abstract class BaseState extends Equatable {
  final BaseStatus status;
  final String? errorMessage;

  const BaseState({this.status = BaseStatus.initial, this.errorMessage});

  @override
  List<Object?> get props => [status, errorMessage];
}
