import '../../domain/entities/wallet_entity.dart';
import '../../domain/entities/notification_entity.dart';

/// Mock wallet service simulating API calls
class MockWalletService {
  /// Simulate getting wallet balance from API
  Future<WalletEntity> getBalance() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock data
    return const WalletEntity(
      balance: '122200',
      currency: 'USD',
    );
  }

  /// Simulate getting notification count from API
  Future<NotificationEntity> getNotifications() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Return mock data
    return const NotificationEntity(
      count: 10,
      hasUnread: true,
    );
  }
}
