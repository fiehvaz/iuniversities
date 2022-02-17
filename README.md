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
- **Dao** - Contains sql querys and is the main file of bd design  `contact_dao.dart`
- **Database** - creates a internal storage (bd) `app_database.dart`
- **Models** - models for request json via web and query sql internaly `post_model.dart`
- **repositories** - Dio repository for request web content `home_repository_imp.dart`
- **views** - aplication pages files `details_page.dart;home_page.dart;universities_page.dart`

To run the app use the following command:
```
flutter run
```


### ApiService

Abstraction over the API communication that defines (all) endpoints. 
This Project uses [Dio], an http client generator, to make network requests.

- [Dio] - For requests


[Dio 4.0.4]: https://pub.dev/packages/dio



### JSON and Serialization

JSON models are serialized using a code generation site.

[json_serialization]: https://www.dripcoding.com/json-to-dart/


### Screens
<br />
<div>
  &emsp;&emsp;&emsp;
  <img src="https://i.ibb.co/7J2wYqX/Slide1.png" alt="Light theme">
  &emsp;&emsp;&emsp;&emsp;
  <img src="https://i.ibb.co/J2Th3ZL/Slide2.png" alt="Dark theme">  
</div>
<br />
