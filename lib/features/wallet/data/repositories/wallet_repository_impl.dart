import 'package:dartz/dartz.dart';
import '../../domain/entities/wallet_entity.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../../../core/error/failures.dart';
import '../services/mock_wallet_service.dart';

/// Wallet repository implementation
class WalletRepositoryImpl implements WalletRepository {
  final MockWalletService service;

  WalletRepositoryImpl(this.service);

  @override
  Future<Either<Failure, WalletEntity>> getBalance() async {
    try {
      final wallet = await service.getBalance();
      return Right(wallet);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NotificationEntity>> getNotifications() async {
    try {
      final notifications = await service.getNotifications();
      return Right(notifications);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
