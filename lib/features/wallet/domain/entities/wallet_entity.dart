/// Wallet entity representing user's wallet data
class WalletEntity {
  final String balance;
  final String currency;

  const WalletEntity({
    required this.balance,
    this.currency = 'USD',
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WalletEntity &&
        other.balance == balance &&
        other.currency == currency;
  }

  @override
  int get hashCode => balance.hashCode ^ currency.hashCode;

  WalletEntity copyWith({
    String? balance,
    String? currency,
  }) {
    return WalletEntity(
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
    );
  }
}
