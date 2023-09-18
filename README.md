## Frestaurant - Restaurant clone in flutter 
A working Twitter clone built in Flutter using Firebase auth,realtime,firestore database and storage.

## Screen
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/8b4d14fe-4a31-4831-a205-cd881e937021" width="200"  title="Slider Screen"/>
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/307d6d1c-cddd-4dae-a91c-7f27fa560ea3" width="200" title="Slider Screen"/>
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/7bb29a20-6df4-4c28-8eab-c8f14badd558" width="200" title="Slider Screen"/>
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/f2a0c17d-d0e7-4918-b2d2-54553536a850" width="200" title="Sign In Screen"/>
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/e23440d9-5ec0-4eef-9300-fd06ff6d9423" width="200" title="Sign Up Screen"/>
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/fcb6bda3-e3e5-4ae4-b8ac-34d15b4339a0" width="200" title="Verify Screen"/>
<img src="https://github.com/lucky93agarwal/Restaurant_App_Design/assets/53622073/10cabd75-200f-454f-ab43-fd7d1aea642a" width="200" title="Forgot Screen"/>

## Download App
<a href="https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_twitter_clone"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" width="200"></img></a>



## Features
* Slider Screen
* Sign In Screen
* Sign Up Screen
* Forgot Screen
* Verifition Screen
* Custom Paint
* GetX State Management
* Custom Button
* Custom Title
* Custom App Bar
* Custom Text Field
## Folder Structure


```
lib
│
├── Component => This file contains the component
│   ├── ScreenNameComponent Folder
│   │   [Contains all the components For Particular Screen]
│   │       │
│   └──CommonComponet [Folder]
│             [ Contains Widget like button, search bar, textfield... etc ]
│       
│
├── Config => The file contains the configuration file that used main.dart
│   ├── routes 🛣️
│   │       │
│   │       ├── app_routes
│   │       │   [Contains all the routes used in main.dart ]
│   │       │   
│   │       └── route_path
│   │           [ Class to add all the routes, which can be fetched using class ]
│   ├── theme 💄
│   │       │
│   │       ├── theme_collection
│   │       │   [Collection of Themes like dark, light, etc ]
│   │       │   
│   │       ├── abstract_theme
│   │       │   [ Abstract class of theme which will be extended by different theme used ]
│   │       │
│   │       ├── my_theme
│   │       │    [ Current theme setup ]
│   │       │
│   │       └── theme_manager
│   │           [ Method to select theme ]
│   │
│   ├── app_init.dart ⚙️
│   │
│   ├── r.dart 🎞️
│   │   [ Contains Assets path ]
│   │
│   └── text_styles.dart
│       [ Contains all the textStyle used in the App ]
│
├── Constant
│   ├──font_constant
│   │       [ Constant of Fonts that are used in the app ]
│   ├── enum
│   └──string constant
│    
├── Cors
│   ├── common_utils
│   │   [ This file will have the methods to display snackbar, dialogue, etc ]
│   │
│   ├── ApisRoutes
│   │  
│   ├── Api Wrapper
│   │
│   ├── 
│   │ 
│   ├──Other Services
│   └── Shared Prefrance
│ 
├── L10N [Language]
│
├── Screens 🪶 [Folder]
│   └── ScreenName [Folder]
│       │
│       └── screen_name.dart[file in snake_case] 
│          │
│          If contain tab => Another folder with tab_name_screen => Under Screen Name
│
├── Model 💃
│   └── Contains All the Model
│        [ Model for the language ]
│
└── main.dart 🚀
    [Project begins Here]

```



```
Git branch

** developer [From Where Developer will pull and raise PR]
** staging   [ Parallel branch to main]
** main      [ Stable which will not be touched by anyone]

```


Build DEV APK
```
flutter build apk --release --build-name=restaurant_app_dev_1.0.1 --build-number=1
```

Build PROD APK
```
flutter build apk --release --build-name=restaurant_app_1.0.1 --build-number=1

```

Increase the patch version with every build


Share build
```
Create the build from above Command

Upload the build in this folder
https://drive.google.com/drive/folders/1-DwyW8LEWT6fIOWEVTiLORfSHWLPk0mu?usp=sharing

Rename the build like this nepal_calender_dev_version_no

Share the build Link
```


Common Rules
```
Folder name: Folder name should be camelCase, like FolderName
File name: File name should be snake_case, like home_screen.dart
Class Name: Class Name should be camelCase, like ClassName
Fuction Name: Function name should be like this thisIsFuction(){}
```

Remove these from git cache
```
 git rm -r --cached android/local.properties
```
```
git rm -r --cached .idea
```
```
git rm -r --cached .dart_tool
```
```
git rm -r --cached .flutter-plugins
```
```
git rm -r --cached .flutter-plugins-depende
```


Set Upsetream
```
git config --global --add --bool push.autoSetupRemote true
```
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/Restaurant_App_Design/count.svg" alt ="Loading">
