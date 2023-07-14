# Flutter Cryptocurrency Price Viewer

This Flutter application allows users to view current and historical price data of cryptocurrencies using the Polygon.io API.

# Features

Display a list of cryptocurrencies with their current prices.
View detailed information and charts for each cryptocurrency.
Pull-to-refresh functionality for data updates.
Search functionality to find cryptocurrencies by name.
Pagination for loading the cryptocurrency list.
Requirements

Flutter SDK (follow the official Flutter installation guide to set up Flutter on your machine)
Git (for version control)
Rest API from Polygon.io (for fetching cryptocurrency data)
Installation

# Fork the repository.
Clone the forked repository to your local machine using the command:
git clone https://github.com/your-username/flutter-cryptocurrency-price-viewer.git
Navigate to the project directory:
cd flutter-cryptocurrency-price-viewer
Install the project dependencies:
flutter pub get
Run the application on a connected device or emulator:
flutter run

# Project Structure

The project follows the Clean Architecture principles and uses the BLoC (Business Logic Component) state management pattern.

# The main directories and files in the project are:

lib/: Contains the main source code of the Flutter application.
common/: Contains core functionalities and utilities.
features/polygon/: Contains the cryptocurrency features of the application.
data/: Implements the data layer of the application.
domain/: Defines the domain layer of the application.
ui/: Contains the UI layer of the application.
injection.dart: Handles dependency injection using GetIt.
main.dart: The entry point of the application.
Contributing

Contributions to this project are welcome. If you encounter any issues or would like to add new features, please open an issue or submit a pull request.
