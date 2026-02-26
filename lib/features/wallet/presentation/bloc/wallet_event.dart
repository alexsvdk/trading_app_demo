import 'package:equatable/equatable.dart';

/// Base wallet event
abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object?> get props => [];
}

/// Wallet started event
class WalletStarted extends WalletEvent {}

/// Request wallet balance
class WalletBalanceRequested extends WalletEvent {}

/// Request notifications
class WalletNotificationsRequested extends WalletEvent {}
