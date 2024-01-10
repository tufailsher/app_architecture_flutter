

import 'package:custody_rx/base/network/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams);
}
abstract class UseCaseWithException<Type, Params> {
  Future<Either<Exception, Type>> call(Params prams);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params prams);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}