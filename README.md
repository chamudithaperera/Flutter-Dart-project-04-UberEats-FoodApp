# UberEats Sample FoodApp

This repository contains a sample **UberEats** Food Delivery mobile application built using the **Flutter** framework. The app provides a basic implementation of a food delivery service, including features like user authentication, food browsing, and order management.

## Features

- Splash Screen: Branded UberEats splash screen.
- User Authentication: Login and sign-up screens with email and Google authentication.
- Browse Restaurants: View and search for available restaurants.
- Food Categories: Browse and filter food items by category.
- Order Management: Add items to cart and proceed to checkout.
- UI/UX: Clean, modern user interface inspired by the UberEats design guidelines.

## Screenshots

_Add some screenshots of your app here_

## Installation

To run the app locally, follow these steps:

1. Clone the repository:
    ```
    git clone https://github.com/chamudithaperera/Flutter-Dart-project-04-UberEats-FoodApp.git
    ```
2. Navigate into the project directory:
    ```
    cd UberEats-Sample-FoodApp
    ```
3. Install dependencies:
    ```
    flutter pub get
    ```
4. Run the app:
    ```
    flutter run
    ```

## Dependencies

This project uses the following dependencies:

- flutter: The core framework for building the app.
- firebase_auth: For handling user authentication.
- cloud_firestore: For storing and fetching data from Firestore.
- provider: State management for handling app state.

## Folder Structure

```
lib/
│
├── models/              # Data models
├── screens/             # Application screens (login, register, home, etc.)
├── services/            # Firebase and API service logic
├── widgets/             # Reusable UI components
└── main.dart            # Entry point of the app
```

## How to Contribute

1. Fork the project.
2. Create a new feature branch:
    ```
    git checkout -b feature-branch-name
    ```
3. Commit your changes:
    ```
    git commit -m "Add some feature"
    ```
4. Push to the branch:
    ```
    git push origin feature-branch-name
    ```
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize it further based on your project specifics!
