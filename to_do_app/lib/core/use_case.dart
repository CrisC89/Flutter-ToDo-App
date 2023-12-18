import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/domain/failures/failure.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
