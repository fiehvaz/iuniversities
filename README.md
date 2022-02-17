# iUniversities Project

Iuniversities App project created using flutter framework 

The app has basic home select screen and shows to user a list of universities on south america, consumes a external api and save data into persistence mode. 

It's configured with [Dio] for api request, [Navigator] for navigate, [Sqlite] for persistence data, Repository Pattern, and util and convenience methods. 

<br />
<div>
  &emsp;&emsp;&emsp;
  <img src="https://i.ibb.co/VMw0Lvz/Screenshot-20220217-143044.jpg" alt="Light theme" width="330">
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://i.ibb.co/KN6q4G4/Screenshot-20220217-143050.jpg" alt="Dark theme" width="330">  
</div>
<br />

[Navigation 2.0]: https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

# First Run

The project is configured sqlite. See the next section for configuring run configurations.

After installing the package dependencies with 

```
flutter pub get
```

run the code generation tool 

```
flutter pub run build_runner build
```

## Lib Files


- **Controllers** - Contains controllers for querys, searchbar, and request `home_controller.dart`
- **Dao** - development environment that targets a development server. Launches `contact_dao.dart`
- **Database** - staging environment that targets a staging server. Launches `app_database.dart`
- **Models** - production environment that targets a production server. Launches `post_model.dart`
- **repositories** - production environment that targets a production server. Launches `home_repository_imp.dart`
- **views** - production environment that targets a production server. Launches `details_page.dart;home_page.dart;universities_page.dart`

To run the app use the following command:
```
flutter run
```


### ApiService

Abstraction over the API communication that defines (all) endpoints. 
This templates uses [Chopper], an http client generator, to make network requests.

- [UserApiService] - User related endpoints
- [UserAuthApiService] - User re-authentication endpoints
- [TasksApiService] - Tasks, TaskGroups, and task actions endpoints

[UserApiService]: lib/network/user_api_service.dart
[UserAuthApiService]: lib/network/user_auth_api_service.dart
[TasksApiService]: lib/network/tasks_api_service.dart

[Chopper]: https://pub.dev/packages/chopper


### JSON and Serialization

JSON models are serialized using a code generation library.

For one time code generation run this command in terminal: `flutter pub run build_runner build`

For subsequent code generations with conflicting outputs: `flutter pub run build_runner build --delete-conflicting-outputs`

For more information and generating code continuously see [the documentation][json_serialization].

[json_serialization]: https://flutter.dev/docs/development/data-and-backend/json

## Declarative UI and state management

[Flutter is declarative framework][declarative_ui]. This means that Flutter builds its user interface to reflect the current state of the app. 

<img src="https://flutter.dev/assets/development/data-and-backend/state-mgmt/ui-equals-function-of-state-54b01b000694caf9da439bd3f774ef22b00e92a62d3b2ade4f2e95c8555b8ca7.png" alt="High level diagram" width="350">

~~This template attempts to be unopinionated and does not yet use a [state management tool][state_management_options].~~ ...we use [BLoC] now. But, each app service has an updates [Stream][dart_streams] that clients can subscribe to and receive state updates. See the [UpdatesStream<T> mixin][updates_mixin]. It's up to you to use a tool of your choice, or don't use one at all. 
See `TasksRepository#taskEventUpdatesStream` and `TasksRepository#taskGroupUpdatesStream` in [TasksRepository][tasks_repository]

[declarative_ui]: https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative
[state_management_options]: https://flutter.dev/docs/development/data-and-backend/state-mgmt/options
[dart_streams]: https://dart.dev/tutorials/language/streams
[BLoC]: https://pub.dev/packages/flutter_bloc
[updates_mixin]: lib/util/updates_stream.dart


## Dependency Management

Dependencies are managed in the [`service_locator.dart`][service_locator] file. This sample uses [GetIt], a lightweight service locator. There are 2 scopes defined in this template global and user scope. For more information visit the [wiki service locator page].

[service_locator]: ./lib/di/service_locator.dart
[GetIt]: https://pub.dev/packages/get_it
[wiki service locator page]: https://github.com/webfactorymk/flutter-template/wiki/Service-Locator

## Logger

This project uses a custom Logger configured to:
1. print to console, except in production
2. write to a file, except in production - useful for QA reporting
3. log to firebase or report a non-fatal error to firebase

Prefer to use this logger over print statements.
- `Log.d(message)` for debug messages
- `Log.w(message)` for warning messages
- `Log.e(object)` for error messages (this will also report a firebase non-fatal error)
  
## Tests

The test package contains unit tests for almost all components. Be sure to give it a look.
