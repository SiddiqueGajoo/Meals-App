 # 🍽 Meals App

A beautifully designed Flutter application that allows users to explore different meal categories, view meal details, filter meals, and manage their favorite dishes.

## 📌 Features
- **Category-Based Browsing**: Browse meals by categories.
- **Meal Details**: View ingredients, steps, and details for each meal.
- **Favorites**: Mark and access your favorite meals.
- **Filtering**: Filter meals based on dietary preferences.
- **Navigation Drawer & Tabs**: Easy navigation using bottom tabs and a side drawer.

## 🛠 Technologies Used
- **Flutter**: Framework for cross-platform development.
- **Dart**: Programming language for Flutter.
- **Riverpod**: State management solution.

## 📂 Project Structure
```
lib/
├── data/                 # Dummy data for meals and categories
├── models/               # Data models (Category, Meal)
├── providers/            # State management using Provider
├── screens/              # All screens (Categories, Meals, Filters, etc.)
├── widgets/              # Custom reusable widgets
└── main.dart             # App entry point
```
## 📚 New Widgets & Riverpod Techniques Learned
- **MultiProvider**: Used to manage multiple providers efficiently.
- **ChangeNotifierProvider**: Enables efficient state management with ChangeNotifier.
- **Consumer Widget**: Allows selective widget rebuilding based on provider updates.
- **Cache Network Image**: Use Cac Network to load the save the images in cache memory
- **GridView.builder**: Dynamically generates category items in a grid format.
- **AnimatedContainer**: Used for smooth UI animations.
- **FutureBuilder**: Handles asynchronous data fetching and updates the UI accordingly.

## 🤝 Contribution
Feel free to contribute by submitting a pull request or reporting issues.

## 📸 Screenshots

![Meals-UI-01](https://github.com/user-attachments/assets/c0b97052-7214-4a5e-9b97-7440975a8a6f)


![Meals-UI-02-01](https://github.com/user-attachments/assets/dfefd77d-7f2f-452f-bb7a-0db1b52da47b)
