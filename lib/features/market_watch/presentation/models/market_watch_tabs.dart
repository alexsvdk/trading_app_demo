enum MarketCategory {
  indian,
  international,
  forex,
  crypto,
}

enum MarketSegment {
  nseFutures,
  nseOption,
  mcxFutures,
  mcxOptions,
}

extension MarketCategoryLabel on MarketCategory {
  String get label {
    switch (this) {
      case MarketCategory.indian:
        return 'Indian Market';
      case MarketCategory.international:
        return 'International';
      case MarketCategory.forex:
        return 'Forex Futures';
      case MarketCategory.crypto:
        return 'Crypto Futures';
    }
  }
}

extension MarketSegmentLabel on MarketSegment {
  String get label {
    switch (this) {
      case MarketSegment.nseFutures:
        return 'NSE Futures';
      case MarketSegment.nseOption:
        return 'NSE Option';
      case MarketSegment.mcxFutures:
        return 'MCX Futures';
      case MarketSegment.mcxOptions:
        return 'MCX Options';
    }
  }

  String get uppercaseLabel => label.toUpperCase();

  String get searchHint => 'Search ${label.toLowerCase()}';
}
