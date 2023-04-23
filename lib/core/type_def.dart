import 'package:fpdart/fpdart.dart';
import 'package:social_app/core/failure.dart';

/// A [FutureEither] is a [Future] of [Either] of [Failure] and [T]
typedef FutureEither<T> = Future<Either<Failure, T>>;
/// A [FutureEitherVoid] is a [Future] of [Either] of [Failure] and [void]
typedef FutureEitherVoid = FutureEither<void>;