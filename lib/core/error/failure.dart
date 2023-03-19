import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure{
  final String fail;

  NetworkFailure(this.fail);
  @override
  List<Object?> get props => [fail];
}

class CacheFailure extends Failure{
  final String fail;

  CacheFailure(this.fail);
  @override
  List<Object?> get props => [fail];
}
