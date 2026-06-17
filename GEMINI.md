# News App - GEMINI Context

This file serves as the core context for AI development sessions, outlining the structure, tech stack, key components, and design guidelines of the **News App** Flutter project.

---

## 1. Project Overview
The **News App** is a Flutter-based mobile application designed to fetch, display, and search news articles from a free News API ([newsapi.org](https://newsapi.org)). It supports onboarding flows, local user sign-up/login, feed customization by category, article bookmarking, web view reading, and user profile management (including profile image picking and local data updates).

---

## 2. Tech Stack & Dependencies
The project is built using **Flutter** and **Dart** and includes several packages for UI, persistence, networking, and state management.

### Key Packages (from [pubspec.yaml](file:///d:/new%20flutter/newsapp/pubspec.yaml)):
* **State Management**: `provider` (^6.1.5+1) used with local `ChangeNotifier` controllers.
* **Local Persistence**: 
  * `shared_preferences` (^2.5.5) for lightweight preferences (e.g., onboarding completion, local asset paths).
  * `hive_ce_flutter` (^2.3.4) for structured model caching (e.g., local user credentials and profiles).
* **Networking**: `http` (^1.6.0) for HTTP client communication.
* **UI & Styling Utilities**:
  * `flutter_screenutil` (^5.9.3) for responsive layouts and adaptive sizing.
  * `cached_network_image` (^3.4.1) for loading and caching article thumbnail images.
  * `shimmer` (^3.0.0) for loading states and skeleton screens.
  * `smooth_page_indicator` (^2.0.1) for page dots on onboarding.
  * `country_picker` (^2.0.27) for selecting user country location.
  * `webview_flutter` (^4.13.1) for rendering article details within the application.
* **Utilities**: `intl` (^0.20.2) for date formatting and locale utilities.
* **Media**: `image_picker` (^1.2.2) for choosing/capturing profile pictures.

---

## 3. Project Structure
The codebase follows a **Feature-first / Feature-oriented** architecture under the `lib/` folder, separating shared core features from modular app screens.

### Visual Tree Map of the `lib/` directory:

```
lib/
├── main.dart                             # App entry point, initializes preferences & user DB
├── hive_registrar.g.dart                 # Hive adapter registrar (auto-generated)
├── core/                                 # Shared resources, utilities, and widgets
│   ├── Theme/                            # App design system
│   │   ├── light_colors.dart             # Palette definitions
│   │   └── light_theme.dart              # Theme configurations
│   ├── constant/                         # Constant configurations
│   │   ├── app_size.dart                 # Dimensions and spacing constants
│   │   └── constatnts.dart               # Key names for database/shared preferences
│   ├── enumes/                           # Global enumerations
│   │   └── request_statues_enum.dart     # API loading state enum (loading, loaded, error)
│   ├── extensions/                       # Custom Dart extensions
│   │   └── date_formate_extension.dart   # String to formatted date conversions
│   ├── mixins/                           # Helper mixins
│   │   └── notify_seafty.dart            # Safe notifyListeners() helper for ChangeNotifier
│   ├── models/                           # Shared entity models
│   │   ├── user_model.dart               # Hive-annotated UserModel class
│   │   └── user_model.g.dart             # Generated Hive adapter for UserModel
│   ├── repos/                            # Shared data repositories
│   │   ├── news_repository.dart          # Handles fetching remote articles
│   │   └── user_repo.dart                # Coordinates User registration, login, and updates
│   └── widgets/                          # Shared reusable widgets
│       └── custome_cash_networkImage.dart # Wrapper for cached network image requests
│
├── data_source/                          # Raw data providers (databases and APIs)
│   ├── local_data/                       # Local DB configurations
│   │   └── prefrencemanger.dart          # SharedPreferences singleton helper
│   └── remote_data/                      # Remote client configurations
│       ├── api_cpnfig.dart               # API URLs, endpoints, and credentials
│       └── api_service.dart              # Core HTTP API Client wrapper
│
└── features/                             # Modular feature screens and flows
    ├── Splash/                           # App landing screen
    │   └── splach_screen.dart
    ├── onBoarding/                       # App tutorial/onboarding walkthrough
    │   ├── models/
    │   │   └── onboarding_model.dart
    │   ├── controller.dart               # PageView transition management
    │   └── onboarding_screen.dart
    ├── auth/                             # User authentication and registration
    │   ├── widget/
    │   │   └── custome_textfiled.dart
    │   ├── loigin_screen.dart
    │   └── signup_screen.dart
    ├── main/                             # Shell hosting the bottom navigation bar
    │   └── main_Screen.dart
    ├── Home/                             # Main Feed & Categories screen
    │   ├── components/                   # Home specific widgets (shimmers, headers, item views)
    │   │   ├── categories_component.dart
    │   │   ├── header.dart
    │   │   ├── news_item.dart
    │   │   ├── source_data.dart
    │   │   ├── topheadline.dart
    │   │   ├── toppheadline_shimmer.dart
    │   │   ├── trending_news.dart
    │   │   ├── trending_news_shimmer.dart
    │   │   └── view_all_copmponent.dart
    │   ├── models/
    │   │   └── news_article_model.dart   # News article data models
    │   ├── Home_screen.dart
    │   ├── categories_Screen.dart
    │   └── home_conrtoller.dart          # Fetches articles and handles categories
    ├── NewsDetails/                      # Article detail screens
    │   ├── news_details.dart             # Clean structured detail view
    │   └── newswebviewdetails.dart       # Embedded in-app browser view
    ├── search/                           # Search functionality
    │   ├── searchController.dart         # Query listener and article filtering
    │   └── search_screen.dart
    ├── bookmark/                         # Bookmarked/saved articles list
    │   └── bookmark_screen.dart
    └── profile/                          # User profile, statistics, and settings
        ├── model/
        │   └── ProfileMenuItemModel.dart
        ├── screens/
        │   ├── profile_bottome_sheet.dart # Edit info modal sheet
        │   └── terms_Screen.dart
        ├── Profile_controller.dart       # Local state updates for profile changes
        └── profile_screen.dart
```

---

## 4. Key Components & Files
* **API Service**: [api_service.dart](file:///d:/new%20flutter/newsapp/lib/data_source/remote_data/api_service.dart) contains the core GET method implementing query parameters and wrapping HTTP calls. Configuration data (API Key, Base URL, endpoints) is stored inside [api_cpnfig.dart](file:///d:/new%20flutter/newsapp/lib/data_source/remote_data/api_cpnfig.dart).
* **News Articles**: [news_article_model.dart](file:///d:/new%20flutter/newsapp/lib/features/Home/models/news_article_model.dart) parses lists of articles from JSON into custom model classes including source attribution (`SourceModel`).
* **Repositories**:
  * [news_repository.dart](file:///d:/new%20flutter/newsapp/lib/core/repos/news_repository.dart) fetches headlines and search topics via `ApiService`.
  * [user_repo.dart](file:///d:/new%20flutter/newsapp/lib/core/repos/user_repo.dart) coordinates user lifecycle management using a local `Hive` box adapter.
* **State Management (Controllers)**: Controllers act as the logical interface between views and repositories.
  * [home_conrtoller.dart](file:///d:/new%20flutter/newsapp/lib/features/Home/home_conrtoller.dart) manages feeds, category switches, and loading states.
  * [Profile_controller.dart](file:///d:/new%20flutter/newsapp/lib/features/profile/Profile_controller.dart) manages picking files, editing info, and updating local databases.
* **UI Screens**: Located in the feature folders, these components leverage `ScreenUtil` for adaptive spacing and consumer models of `provider` to react to state changes.

---

## 5. Development Guidelines & Best Practices

1. **Maintain the Feature-First Pattern**:
   * Keep all feature-specific resources (like feature-level widgets, specific models, and controllers) bundled within their respective folder inside `lib/features/`. 
   * Only place code in `lib/core/` or `lib/data_source/` if it is utilized by multiple independent features.
2. **Safe State Updates**:
   * When creating controllers, extend/mix in the helper mixin [notifyseafty](file:///d:/new%20flutter/newsapp/lib/core/mixins/notify_seafty.dart) and use `safeNotify()` instead of the standard `notifyListeners()` when updating states during async actions to avoid exceptions if widgets are already disposed.
3. **Database Adaptation**:
   * If modifying [user_model.dart](file:///d:/new%20flutter/newsapp/lib/core/models/user_model.dart) or adding other local model adapters, regenerate the Hive adapter classes by executing:
     ```bash
     flutter pub run build_runner build --delete-conflicting-outputs
     ```
4. **Adhere to Code Spelling Conventions (Important)**:
   * Keep in mind the naming and spelling conventions used throughout the project when editing existing files or dependencies to avoid build errors:
     * `ApiCpnfig` (instead of `ApiConfig`) in [api_cpnfig.dart](file:///d:/new%20flutter/newsapp/lib/data_source/remote_data/api_cpnfig.dart)
     * `home_conrtoller.dart` (instead of `home_controller.dart`)
     * `loigin_screen.dart` (instead of `login_screen.dart`)
     * `splach_screen.dart` (instead of `splash_screen.dart`)
     * `notifyseafty` (instead of `NotifySafety`) in [notify_seafty.dart](file:///d:/new%20flutter/newsapp/lib/core/mixins/notify_seafty.dart)
     * `PerfrenceManager` (instead of `PreferenceManager`) in [prefrencemanger.dart](file:///d:/new%20flutter/newsapp/lib/data_source/local_data/prefrencemanger.dart)
     * `UserRepositorty` (instead of `UserRepository`) in [user_repo.dart](file:///d:/new%20flutter/newsapp/lib/core/repos/user_repo.dart)
     * `RequestStatuesEnum` (instead of `RequestStatusEnum`) in [request_statues_enum.dart](file:///d:/new%20flutter/newsapp/lib/core/enumes/request_statues_enum.dart)
5. **Use Adaptive Layouts**:
   * Rely on `ScreenUtil` helpers (e.g. `.h`, `.w`, `.sp`, `.r`) when setting dimensions, font sizes, or border radii, to maintain consistent rendering across varying screen sizes.
