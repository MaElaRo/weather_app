# weather_app
A Weather App that uses the current location of the user and shows the user the current
weather and a forecast for the next days. The app has a light and dark mode switch. 
Permissions for locating the users current location is needed.

## Installation

Was developed on the newest Flutter stable channel.
Command to run app:
```
flutter pub get
flutter run
```

Command to run tests:

```
flutter test
```

## State management

As a state management package, I used the bloc library, riverpods for dependency injection
and hooks for easy access inside a widget.

## Architecture

The architecture consists of three layers. The data source layer, the domain layer and the UI layer.

The data source layer is responsible for interfacing with external data providers such as the weather API
and the native location providers.

The domain layer holds the actual app state and is responsible for common logic.

The UI layer is dumb and only displays information received by the domain layer.

## Consideration

The permission dialog might not work on Android 11 as per this issue: https://github.com/Baseflow/flutter-geolocator/issues/746

If that's the case, just follow the instructions in the app and set the permission in the settings.


