import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:trading_app_demo/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:trading_app_demo/features/wallet/presentation/bloc/wallet_event.dart';
import 'package:trading_app_demo/features/wallet/presentation/bloc/wallet_state.dart';
import 'package:trading_app_demo/features/wallet/domain/usecases/get_balance_usecase.dart';
import 'package:trading_app_demo/features/wallet/domain/usecases/get_notifications_usecase.dart';
import 'package:trading_app_demo/features/wallet/domain/entities/wallet_entity.dart';
import 'package:trading_app_demo/features/wallet/domain/entities/notification_entity.dart';
import 'package:trading_app_demo/core/error/failures.dart';

class MockGetBalanceUseCase extends Mock implements GetBalanceUseCase {}

class MockGetNotificationsUseCase extends Mock
    implements GetNotificationsUseCase {}

void main() {
  late WalletBloc walletBloc;
  late MockGetBalanceUseCase mockGetBalanceUseCase;
  late MockGetNotificationsUseCase mockGetNotificationsUseCase;

  setUp(() {
    mockGetBalanceUseCase = MockGetBalanceUseCase();
    mockGetNotificationsUseCase = MockGetNotificationsUseCase();
    walletBloc = WalletBloc(
      getBalanceUseCase: mockGetBalanceUseCase,
      getNotificationsUseCase: mockGetNotificationsUseCase,
    );
  });

  tearDown(() {
    walletBloc.close();
  });

  const testWallet = WalletEntity(balance: '122200', currency: 'USD');
  const testNotifications = NotificationEntity(count: 10, hasUnread: true);

  test('initial state should be WalletInitial', () {
    expect(walletBloc.state, equals(WalletInitial()));
  });

  group('WalletStarted', () {
    test('should emit [WalletLoading, WalletLoaded] when data is fetched successfully',
        () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(testWallet));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(testNotifications));

      // Assert later
      final expected = [
        WalletLoading(),
        WalletLoaded(wallet: testWallet, notifications: testNotifications),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletStarted());
    });

    test('should emit [WalletLoading, WalletError] when balance fetch fails',
        () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Left(ServerFailure('Failed to fetch balance')));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(testNotifications));

      // Assert later
      final expected = [
        WalletLoading(),
        const WalletError('Failed to fetch balance'),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletStarted());
    });

    test('should emit [WalletLoading, WalletError] when notifications fetch fails',
        () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(testWallet));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Left(ServerFailure('Failed to fetch notifications')));

      // Assert later
      final expected = [
        WalletLoading(),
        const WalletError('Failed to fetch notifications'),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletStarted());
    });
  });

  group('WalletBalanceRequested', () {
    test('should emit [WalletLoaded] with new balance when successful',
        () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(testWallet));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(testNotifications));

      // Load initial state
      walletBloc.add(WalletStarted());
      await Future.delayed(const Duration(milliseconds: 100));

      const newWallet = WalletEntity(balance: '150000', currency: 'USD');
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(newWallet));

      // Assert later
      final expected = [
        WalletLoaded(wallet: newWallet, notifications: testNotifications),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletBalanceRequested());
    });

    test('should emit [WalletError] when balance fetch fails', () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(testWallet));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(testNotifications));

      // Load initial state
      walletBloc.add(WalletStarted());
      await Future.delayed(const Duration(milliseconds: 100));

      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Left(ServerFailure('Failed to fetch balance')));

      // Assert later
      final expected = [
        const WalletError('Failed to fetch balance'),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletBalanceRequested());
    });
  });

  group('WalletNotificationsRequested', () {
    test('should emit [WalletLoaded] with new notifications when successful',
        () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(testWallet));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(testNotifications));

      // Load initial state
      walletBloc.add(WalletStarted());
      await Future.delayed(const Duration(milliseconds: 100));

      const newNotifications = NotificationEntity(count: 20, hasUnread: true);
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(newNotifications));

      // Assert later
      final expected = [
        WalletLoaded(wallet: testWallet, notifications: newNotifications),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletNotificationsRequested());
    });

    test('should emit [WalletError] when notifications fetch fails', () async {
      // Arrange
      when(() => mockGetBalanceUseCase())
          .thenAnswer((_) async => const Right(testWallet));
      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Right(testNotifications));

      // Load initial state
      walletBloc.add(WalletStarted());
      await Future.delayed(const Duration(milliseconds: 100));

      when(() => mockGetNotificationsUseCase())
          .thenAnswer((_) async => const Left(ServerFailure('Failed to fetch notifications')));

      // Assert later
      final expected = [
        const WalletError('Failed to fetch notifications'),
      ];
      expectLater(walletBloc.stream, emitsInOrder(expected));

      // Act
      walletBloc.add(WalletNotificationsRequested());
    });
  });
}
