import 'package:equatable/equatable.dart';
import '../../domain/entities/wallet_entity.dart';
import '../../domain/entities/notification_entity.dart';

/// Base wallet state
abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

/// Initial wallet state
class WalletInitial extends WalletState {}

/// Wallet loading state
class WalletLoading extends WalletState {}

/// Wallet loaded state
class WalletLoaded extends WalletState {
  final WalletEntity wallet;
  final NotificationEntity notifications;

  const WalletLoaded({
    required this.wallet,
    required this.notifications,
  });

  @override
  List<Object?> get props => [wallet, notifications];

  WalletLoaded copyWith({
    WalletEntity? wallet,
    NotificationEntity? notifications,
  }) {
    return WalletLoaded(
      wallet: wallet ?? this.wallet,
      notifications: notifications ?? this.notifications,
    );
  }
}

/// Wallet error state
class WalletError extends WalletState {
  final String message;

  const WalletError(this.message);

  @override
  List<Object?> get props => [message];
}
