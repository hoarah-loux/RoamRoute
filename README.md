# RoamRoute 🧭

**Your trips, your routes, your memories.**

RoamRoute is a Flutter-based travel planning application that helps users organize trips, manage destinations, visualize itineraries, track expenses, and document their travel experiences.

The application combines interactive maps, location search, route optimization, and local data persistence into one simple travel companion.

## Features

- **Trip Management:** Create, edit, and manage trips with travel dates and destinations.
- **Itinerary Planning:** Add multiple stops and organize destinations within a trip.
- **Interactive Maps:** Visualize planned locations using Google Maps markers and polylines.
- **Location Search:** Find destinations using Google Places autocomplete.
- **Route Optimization:** Reorder itinerary stops using a nearest-neighbor algorithm.
- **Expense Tracking:** Manage trip expenses and monitor budgets.
- **Photo Memories:** Save photos and notes associated with individual trips.
- **Trip Sharing:** Share itineraries using native device sharing functionality.
- **Personalization:** Light and dark themes with persistent settings.

## Technology Stack

| Technology | Purpose |
|---|---|
| Flutter & Dart | Application development |
| SQLite | Local data persistence |
| Google Maps | Interactive maps |
| Google Places | Location search |
| Shared Preferences | Application settings |
| Image Picker | Photo management |
| Share Plus | Itinerary sharing |
| Android Java | Native platform integration |

## Architecture

RoamRoute follows a modular, service-oriented architecture.

- **Screens:** Application pages and user interfaces.
- **Widgets:** Reusable UI components.
- **Models:** Data structures and serialization.
- **Services:** Database operations and application logic.
- **Theme:** Shared styling and design configuration.

The application uses SQLite for persistent local storage, keeping essential trip information available without requiring a permanent internet connection.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or compatible development environment
- Android SDK
- Google Maps API key

### Installation

Clone the repository:

```bash
git clone https://github.com/hoarah-loux/RoamRoute.git
cd RoamRoute
```

Install dependencies:

```bash
flutter pub get
```

Configure your Google Maps API key in `android/local.properties`:

```properties
MAPS_API_KEY=YOUR_API_KEY
```

Run the application:

```bash
flutter run
```

Build an APK:

```bash
flutter build apk --release
```

## Project Structure

```text
RoamRoute/
├── android/          # Android platform integration
├── linux/            # Linux platform configuration
├── lib/
│   ├── models/       # Data models
│   ├── screens/      # Application screens
│   ├── services/     # Database and application services
│   ├── theme/        # Application themes
│   ├── widgets/      # Reusable components
│   └── main.dart     # Application entry point
├── pubspec.yaml      # Dependencies and configuration
└── README.md
```

## Future Work

Potential improvements and planned extensions include:

- Offline map support.
- Improved route planning and navigation.
- Cloud synchronization and account management.
- Cross-platform feature parity.
- Enhanced itinerary recommendations.

## License

See the repository for licensing information.
