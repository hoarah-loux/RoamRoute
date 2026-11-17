# Project Report: Roam Route Travel Planner

**Date:** 1//2026
**Project Name:** Roam Route
**Team:** Abdulrahman Abu Hurirah, Bilal Al Tabbaa, Yazeed Ashour
**Platform:** Flutter

---

## 1. Project Overview & Functionalities
Roam Route is a travel itinerary app built to make trip planning feel more intuitive. It sits somewhere between basic note-taking and full-on map navigation, helping users organize their journeys while actually seeing them laid out geographically.

### Key Functionalities:
- **Trip Management:** Create, view, edit, and delete trips.
- **Smart Categorization:** Automatic sorting into “Upcoming” or “Past” based on dates.
- **Multi-Stop Planning:** Add multiple stops within a single destination.
- **Map Visualization:** Google Maps integration with custom markers and polyline routes.
- **Location Intelligence:** Real-time autocomplete search.
- **Route Optimization:** One-tap stop reordering using a nearest-neighbor algorithm.
- **Budget Tracking:** Manage expenses with a visual progress bar.
- **Photo Memories:** Capture moments with photos and notes in a chronological timeline.
- **Easy Sharing:** Export itineraries via system sharing.

---

## 2. Folder Structure & State Management
The project follows a modular directory structure to separate concerns and ensure maintainability.

### Folder Structure
```text
lib/
├── main.dart             # App entry point, Theme management & App Shell
├── models/               # Data entities and JSON serialization logic
├── screens/              # High-level UI views (Trip List, Details, Settings)
├── services/             # Singletons for Database, Settings, and Seeding
├── theme/                # Custom "Duo" design system and color palette
└── widgets/              # Reusable UI components (Custom Cards, Buttons)
```

### State Management & Data Flow
The app employs **Ephemeral State Management** using Flutter's built-in `setState()` combined with a **Service-based Architecture**.

1.  **Request:** A user interaction in a `Screen` (e.g., adding an expense) triggers a call to the `DatabaseService`.
2.  **Processing:** The `DatabaseService` (a singleton) interacts with the SQLite engine to perform CRUD operations.
3.  **Mapping:** Raw SQL result sets are mapped into strongly-typed Dart objects using factory constructors in the `Models` layer.
4.  **Update:** The `Screen` receives the updated data and calls `setState()` to rebuild the UI, ensuring the view is always in sync with the local database.

---

## 3. Data Models
The application data is structured around three primary entities, linked via relational keys in SQLite.

| Model | Description | Key Fields |
|-------|-------------|------------|
| **Trip** | The root entity for a journey. | `id`, `destination`, `stops` (JSON), `budget`, `status` |
| **Expense** | Financial records linked to a Trip. | `id`, `tripId` (FK), `title`, `amount`, `date` |
| **Moment** | Photo memories and notes. | `id`, `tripId` (FK), `filePath`, `note`, `timestamp` |

---

## 4. Backend & Data Integration
The app uses a **local-first approach**, ensuring full functionality without a persistent internet connection.

- **SQLite (`sqflite`):** The primary relational engine. It handles complex data like nested stops and budget calculations efficiently.
- **Shared Preferences:** Used for lightweight storage of user preferences (e.g., Dark Mode) and onboarding flags.
- **External APIs:**
    - **Google Places SDK:** Native integration for high-performance location suggestions.
    - **Geocoding API:** Essential for translating human-readable addresses into `LatLng` coordinates for the map engine.

---

## 5. Core Flutter Packages & Justification

| Package | Role | Justification |
|---------|------|---------------|
| `google_maps_flutter` | Map Rendering | The industry standard for high-performance, interactive maps on mobile. |
| `sqflite` | Local Database | Provides robust relational storage and SQL support for complex queries. |
| `geocoding` | Coordinate Logic | Critical for converting user input into map markers without manual GPS entry. |
| `share_plus` | Data Portability | Leverages native OS sharing sheets for a seamless user experience. |
| `shared_preferences` | User Settings | Perfect for small key-value pairs where a full database is overkill. |
| `image_picker` | Media Access | Simplifies the complexity of requesting camera/gallery permissions and file paths. |
| `url_launcher` | Web Integration | Safely handles external links for help docs or external travel sites. |

---

## 6. Biggest Technical Challenge: Platform Channels
One of the trickiest parts was integrating **Google Places Autocomplete** using platform channels. 

While Flutter has many plugins, getting real-time, native-feel suggestions required a custom bridge:
- **Dart side:** A debounced search bar sends input through a `MethodChannel`.
- **Native side (Android):** `MainActivity.java` initializes the `PlacesClient` and returns structured JSON suggestions.
- **Benefit:** This avoids expensive web API calls by using the native SDK, resulting in a faster, more cost-effective search experience.

---

## 7. Limitations & Future Developments

### Current Limitations:
- **Local Only:** Data is stored on-device; if the app is deleted, data is lost (no cloud sync).
- **Single User:** No shared itineraries or real-time collaboration, and user profile is sitting 
as a placeholder.
- **Manual Geometry:** Polylines represent direct paths rather than turn-by-turn road navigation.

### Future Roadmap:
- **Cloud Sync:** Integration with Firebase for cross-device access.
- **Offline Maps:** Caching map tiles for remote travel locations.
- **AI Recommendations:** Generating suggested stops based on popular travel routes.
- **Social Sharing:** A public feed to discover itineraries from other users.
- **Currency Conversion:** Real-time expense conversion based on local trip destinations.
