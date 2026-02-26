import 'package:dartz/dartz.dart';
import '../entities/wallet_entity.dart';
import '../entities/notification_entity.dart';
import '../../../../core/error/failures.dart';

/// Wallet repository interface
abstract class WalletRepository {
  /// Get wallet balance
  Future<Either<Failure, WalletEntity>> getBalance();

  /// Get notification count
  Future<Either<Failure, NotificationEntity>> getNotifications();
}
