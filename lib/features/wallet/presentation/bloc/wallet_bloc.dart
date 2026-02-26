import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/wallet_entity.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/usecases/get_balance_usecase.dart';
import '../../domain/usecases/get_notifications_usecase.dart';
import '../../../../core/error/failures.dart';
import 'wallet_event.dart';
import 'wallet_state.dart';

/// Wallet BLoC for managing wallet state
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final GetBalanceUseCase getBalanceUseCase;
  final GetNotificationsUseCase getNotificationsUseCase;

  WalletBloc({
    required this.getBalanceUseCase,
    required this.getNotificationsUseCase,
  }) : super(WalletInitial()) {
    on<WalletStarted>(_onWalletStarted);
    on<WalletBalanceRequested>(_onBalanceRequested);
    on<WalletNotificationsRequested>(_onNotificationsRequested);
  }

  Future<void> _onWalletStarted(
    WalletStarted event,
    Emitter<WalletState> emit,
  ) async {
    emit(WalletLoading());

    // Load both balance and notifications in parallel
    final results = await Future.wait([
      getBalanceUseCase(),
      getNotificationsUseCase(),
    ]);

    final balanceResult = results[0] as Either<Failure, WalletEntity>;
    final notificationsResult = results[1] as Either<Failure, NotificationEntity>;

    balanceResult.fold(
      (failure) => emit(WalletError(failure.message)),
      (wallet) {
        notificationsResult.fold(
          (failure) => emit(WalletError(failure.message)),
          (notifications) {
            emit(WalletLoaded(
              wallet: wallet,
              notifications: notifications,
            ));
          },
        );
      },
    );
  }

  Future<void> _onBalanceRequested(
    WalletBalanceRequested event,
    Emitter<WalletState> emit,
  ) async {
    if (state is WalletLoaded) {
      final currentState = state as WalletLoaded;
      emit(currentState.copyWith());

      final result = await getBalanceUseCase();

      result.fold(
        (failure) => emit(WalletError(failure.message)),
        (wallet) {
          emit(WalletLoaded(
            wallet: wallet,
            notifications: currentState.notifications,
          ));
        },
      );
    }
  }

  Future<void> _onNotificationsRequested(
    WalletNotificationsRequested event,
    Emitter<WalletState> emit,
  ) async {
    if (state is WalletLoaded) {
      final currentState = state as WalletLoaded;
      emit(currentState.copyWith());

      final result = await getNotificationsUseCase();

      result.fold(
        (failure) => emit(WalletError(failure.message)),
        (notifications) {
          emit(WalletLoaded(
            wallet: currentState.wallet,
            notifications: notifications,
          ));
        },
      );
    }
  }
}
