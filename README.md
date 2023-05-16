# Create a New Company App (Flutter Task Assignment by Apex DMIT Ltd.)

This is a one page application. 
The data comes from API in this app.
Here I am using GET Api for getting the company list and POST api for create new company.
Here I am using Riverpod State Management.

#Commands:

* project create: flutter create -t skeleton -a java -i swift --org com.meraj project_app
* clear the codebase: flutter clean
* getting all: glutter pub get

Now Run the Project.
This project is running on Flutter 3.10.0 and Dart 3.0.0
You can run this project in Android, iOS, Web and Windows OS.

#Project Structure

lib
├─ src
│  │ 
│  ├─ localization
│  │   ├── app_en.arb
│  │ 
│  ├─ modules
│  │   ├─ home
│  │   │   ├─ api
│  │   │   │   └── comapny_data_api.dart
│  │   │   │   └── create_company_api.dart
│  │   │   ├─ model
│  │   │   │   └── comapny_data_model.dart
│  │   │   ├─ provider
│  │   │   │   └── home_provider.dart
│  │   │   ├─ view
│  │   │       ├─ popup
│  │   │       │   └── popup.dart
│  │   │       └── home.view.dart
│  └─ app.dart
│  
└─ main.dart
