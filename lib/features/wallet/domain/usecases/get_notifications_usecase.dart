import 'package:dartz/dartz.dart';
import '../entities/notification_entity.dart';
import '../repositories/wallet_repository.dart';
import '../../../../core/error/failures.dart';

/// Use case for getting notification count
class GetNotificationsUseCase {
  final WalletRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<Either<Failure, NotificationEntity>> call() async {
    return await repository.getNotifications();
  }
}
