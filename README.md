# 🎨 Flutter Premium UI

A comprehensive Flutter package for beautiful UI components including error banners, selection boxes, session dialogs, and more.

[![pub package](https://img.shields.io/pub/v/flutter_premium_ui.svg)](https://pub.dev/packages/flutter_premium_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- **🚨 Error Components**: Beautiful error banners and message cards
- **📦 Selection Components**: Customizable selection boxes and dialogs
- **🎭 Animation Support**: Smooth animations and transitions
- **🎨 Customizable**: Extensive styling options for all components
- **📱 Cross-platform**: Consistent behavior across all platforms
- **♿ Accessible**: Proper focus handling and accessibility support
- **🌍 Localizable**: Full localization support

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_premium_ui: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

```dart
import 'package:flutter_premium_ui/flutter_premium_ui.dart';

// Error banner
ErrorBanner(
  message: 'Something went wrong!',
  onTap: () => retryAction(),
)

// Selection box
SelectionBox(
  selected: isSelected,
  child: Text('Option 1'),
  onTap: () => selectOption(),
)

// Session expired dialog
SessionExpiredDialog(
  title: 'Session Expired',
  buttonText: 'Login Again',
  onButtonPressed: () => navigateToLogin(),
)
```

## 📖 Components

### ErrorBanner

A short banner for displaying non-critical errors inline.

```dart
ErrorBanner(
  message: 'Network connection failed',
  backgroundColor: Colors.red.shade100,
  textColor: Colors.red,
  iconColor: Colors.red,
  borderRadius: 8.0,
  showIcon: true,
)
```

### ErrorMessageCard

A stylized error message card for more prominent error display.

```dart
ErrorMessageCard(
  title: 'Connection Error',
  message: 'Unable to connect to the server. Please check your internet connection.',
  details: 'Error Code: 500',
  retryButtonText: 'Try Again',
  onRetry: () => retryConnection(),
  backgroundColor: Colors.red.shade50,
  borderColor: Colors.redAccent,
  iconColor: Colors.redAccent,
)
```

### SelectionBox

A customizable selection box with border color changes based on selection state.

```dart
SelectionBox(
  selected: isSelected,
  child: Row(
    children: [
      Icon(Icons.person),
      SizedBox(width: 8),
      Text('Personal Account'),
    ],
  ),
  height: 60,
  backgroundColor: Colors.white,
  selectedBorderColor: Colors.blue,
  unselectedBorderColor: Colors.grey,
  borderRadius: 12.0,
  onTap: () => toggleSelection(),
)
```

### SessionExpiredDialog

A dialog for handling session expiration scenarios.

```dart
SessionExpiredDialog(
  title: 'Session Expired',
  buttonText: 'Login Again',
  onButtonPressed: () => navigateToLogin(),
  logo: Image.asset('assets/logo.png'),
  backgroundColor: Colors.white,
  buttonColor: Colors.blue,
  borderRadius: 12.0,
  width: 300,
)
```

### HaveOrNotAccount

A text widget for auth screen navigation with tappable action text.

```dart
HaveOrNotAccount(
  question: 'Don\'t have an account?',
  action: 'Sign Up',
  onTap: () => navigateToSignUp(),
  questionStyle: TextStyle(color: Colors.grey),
  actionStyle: TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)
```

### AnimatedSplashScreen

A customizable animated splash screen with gradient transitions.

```dart
AnimatedSplashScreen(
  gradients: [
    LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Colors.purple, Colors.pink],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ],
  duration: Duration(seconds: 3),
  childrenBuilders: [
    (context, animation) => FadeTransition(
      opacity: animation,
      child: Image.asset('assets/logo.png'),
    ),
    (context, animation) => SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 0.5),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      )),
      child: Text(
        'Welcome',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
  ],
  onFinished: () => navigateToHome(),
)
```

## 🎛️ Configuration Options

### ErrorBanner Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | `String` | Required | Error message to display |
| `backgroundColor` | `Color?` | `Colors.red.shade100` | Background color |
| `textColor` | `Color?` | `Colors.red` | Text color |
| `iconColor` | `Color?` | `Colors.red` | Icon color |
| `icon` | `IconData` | `Icons.error` | Icon to display |
| `iconSize` | `double` | `20.0` | Size of the icon |
| `borderRadius` | `double` | `8.0` | Border radius |
| `showIcon` | `bool` | `true` | Whether to show icon |

### SelectionBox Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `selected` | `bool` | Required | Selection state |
| `child` | `Widget` | Required | Child widget |
| `height` | `double` | `56` | Height of the box |
| `backgroundColor` | `Color` | `Colors.white` | Background color |
| `selectedBorderColor` | `Color?` | `Theme.primaryColor` | Selected border color |
| `unselectedBorderColor` | `Color?` | `Colors.grey` | Unselected border color |
| `borderRadius` | `double` | `8.0` | Border radius |
| `onTap` | `VoidCallback?` | `null` | Tap callback |

### AnimatedSplashScreen Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `gradients` | `List<LinearGradient>` | Required | Gradient sequence |
| `duration` | `Duration` | Required | Animation duration |
| `childrenBuilders` | `List<SplashChildBuilder>` | Required | Child builders |
| `weights` | `List<double>?` | `null` | Transition weights |
| `gradientCurve` | `Curve` | `Curves.easeInOut` | Gradient curve |
| `onFinished` | `VoidCallback?` | `null` | Completion callback |

## 🎨 Customization Examples

### Custom Error Theme

```dart
class MyErrorTheme {
  static const primaryError = Color(0xFFE53E3E);
  static const errorBackground = Color(0xFFFED7D7);
  
  static ErrorBanner customErrorBanner(String message) {
    return ErrorBanner(
      message: message,
      backgroundColor: errorBackground,
      textColor: primaryError,
      iconColor: primaryError,
      borderRadius: 12.0,
      icon: Icons.warning,
    );
  }
  
  static ErrorMessageCard customErrorCard({
    required String title,
    required String message,
    VoidCallback? onRetry,
  }) {
    return ErrorMessageCard(
      title: title,
      message: message,
      onRetry: onRetry,
      backgroundColor: errorBackground,
      borderColor: primaryError,
      iconColor: primaryError,
      borderRadius: 16.0,
    );
  }
}
```

### Custom Selection Theme

```dart
class MySelectionTheme {
  static const primaryColor = Color(0xFF3182CE);
  static const selectedBackground = Color(0xFFEBF8FF);
  
  static SelectionBox customSelectionBox({
    required bool selected,
    required Widget child,
    VoidCallback? onTap,
  }) {
    return SelectionBox(
      selected: selected,
      child: child,
      onTap: onTap,
      backgroundColor: selected ? selectedBackground : Colors.white,
      selectedBorderColor: primaryColor,
      unselectedBorderColor: Colors.grey.shade300,
      borderRadius: 12.0,
      borderWidth: 2.0,
    );
  }
}
```

### Custom Splash Screen

```dart
class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      gradients: [
        LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        LinearGradient(
          colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        LinearGradient(
          colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ],
      duration: Duration(seconds: 4),
      weights: [1.0, 1.5, 1.0], // Middle gradient gets more time
      childrenBuilders: [
        // Logo animation
        (context, animation) => ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0.0, 0.6, curve: Curves.elasticOut),
            ),
          ),
          child: Image.asset('assets/logo.png', width: 120),
        ),
        // Text animation
        (context, animation) => SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 0.3),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(0.3, 1.0, curve: Curves.easeOut),
            ),
          ),
          child: Text(
            'Welcome to MyApp',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
      onFinished: () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }
}
```

## 🌍 Localization

All text properties support localization:

```dart
ErrorBanner(
  message: S.of(context).networkError,
)

ErrorMessageCard(
  title: S.of(context).errorTitle,
  message: S.of(context).errorMessage,
  retryButtonText: S.of(context).retry,
)

SessionExpiredDialog(
  title: S.of(context).sessionExpired,
  buttonText: S.of(context).loginAgain,
)
```

## 🧪 Testing

The package includes comprehensive tests. Run them with:

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Contributors and users who provide feedback

## 📞 Support

If you encounter any problems or have suggestions, please file an issue at the [GitHub repository](https://github.com/yourusername/flutter_ui_kit/issues).

---

Made with ❤️ for the Flutter community
