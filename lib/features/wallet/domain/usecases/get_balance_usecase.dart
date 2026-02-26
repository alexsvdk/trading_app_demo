import 'package:dartz/dartz.dart';
import '../entities/wallet_entity.dart';
import '../repositories/wallet_repository.dart';
import '../../../../core/error/failures.dart';

/// Use case for getting wallet balance
class GetBalanceUseCase {
  final WalletRepository repository;

  GetBalanceUseCase(this.repository);

  Future<Either<Failure, WalletEntity>> call() async {
    return await repository.getBalance();
  }
}
