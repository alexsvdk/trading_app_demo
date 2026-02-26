# Trading App Demo

Flutter trading demo application that simulates real-time market price fluctuations with dummy data only. Built with Clean Architecture, BLoC, and dependency injection.

## Architecture Decisions

- Clean Architecture with strict layer boundaries: Presentation (UI/BLoC) -> Domain (Use Cases/Entities/Repository interfaces) -> Data (Models/Repository implementations).
- Dependency inversion through repository interfaces in the Domain layer and concrete implementations in Data.
- Feature-first structure under `lib/features/` to keep modules isolated and scalable.

Key references:
- `lib/features/market_watch/` (data/domain/presentation)
- `lib/features/wallet/` (data/domain/presentation)
- `lib/core/di/` (DI container and registrations)

## State Management Flow (BLoC)

All state changes are driven by BLoC events and states. Example flow for Market Watch:

1. UI dispatches `MarketWatchStarted` in `MarketWatchBloc`.
2. BLoC invokes `WatchMarketPricesUseCase` (Domain).
3. Use case calls `MarketWatchRepository` (Domain interface).
4. Repository implementation streams price updates from the data source.
5. BLoC emits `MarketWatchLoaded` states as new prices arrive.

Key references:
- `lib/features/market_watch/presentation/bloc/market_watch_bloc.dart`
- `lib/features/market_watch/domain/usecases/watch_market_prices_usecase.dart`
- `lib/features/market_watch/data/repositories/market_watch_repository_impl.dart`

## Dummy Trading Logic

Price updates are simulated on the client with randomized changes (no API calls):

- Prices are seeded per contract on first stream subscription.
- A periodic timer applies +/- 1% to 5% changes per tick.
- The updated prices and percent changes stream through the repository/use case to the BLoC.

Key reference:
- `lib/features/market_watch/data/datasources/market_price_generator.dart`

## Dependency Injection

All dependencies are registered in a central container using `get_it` (with `injectable` support). Widgets never instantiate BLoCs or services directly.

Key reference:
- `lib/core/di/injection_container.dart`

## Reusability & Theming

- Reusable UI components in `lib/ui/components/` (headers, nav, grids, etc.).
- Shared constants, sizes, and durations in `lib/ui/theme/`.
- Utilities and helpers in `lib/ui/utils/`.

## Project Structure

```
lib/
	core/
		di/
		error/
		navigation/
		services/
	features/
		market_watch/
			data/
			domain/
			presentation/
		wallet/
			data/
			domain/
			presentation/
	ui/
		components/
		theme/
		utils/
```

## Setup

This project uses FVM. Flutter SDK version: 3.41.2.

```
fvm flutter pub get
```

## Run

```
fvm flutter run
```

## Tests

```
fvm flutter test
```

## Lint

```
fvm flutter analyze
```

## Notes

- Market Watch includes live-updating dummy prices.
- Other sections are scaffolded to match navigation and layout requirements.
- UI spacing and grid sizing guidance is documented in `docs/03_Grid_Layout_Calculations.md`.
