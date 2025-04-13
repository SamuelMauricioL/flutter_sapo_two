import 'package:equatable/equatable.dart';

abstract class StFailure extends Equatable {
  const StFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

// General failures
class ServerFailure extends StFailure {
  const ServerFailure({
    super.message = 'Ocurrió un error, vuelva a interlo.',
  });
}

class CacheFailure extends StFailure {
  const CacheFailure({
    super.message = 'Ocurrió un error, vuelva a interlo.',
  });
}
