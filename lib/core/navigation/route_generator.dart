import 'package:bookapp/core/view/view/undefined_route_screen.dart';
import 'package:bookapp/core/view/view/webview_screen.dart';
import 'package:bookapp/features/books/presentation/view/book_details_screen.dart';
import 'package:bookapp/features/books/presentation/view/books_screen.dart';
import 'package:bookapp/features/intro/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    final Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case Routes.splashScreen:
        return platformPageRoute(const SplashScreen());
      case Routes.booksScreen:
        return platformPageRoute(const BooksScreen());   
      case Routes.bookDetailsScreen:
        return platformPageRoute(BookDetailsScreen(book : arguments?['book']));
      case Routes.webviewScreen:
        return platformPageRoute(WebViewScreen(title: arguments?['title'], url: arguments?['url']));
      default:
        return platformPageRoute(const UndefinedRouteScreen());
    }
  }
}
