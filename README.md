# Ash Reads

**Ash Reads** is a mobile application for book lovers, built using **Clean Architecture** principles with full support for both **online** and **offline** modes.

## Features

- **Splash Screen**  
  An animated splash screen to welcome users with a smooth introduction.

- **Book Listing Page**  
  A page that displays a list of all books with:
  - **Search functionality** to quickly find any book.
  - **Pagination** to efficiently browse large lists.

- **Book Details Page**  
  A detailed page for each book featuring:
  - Full book information.
  - A button to open and read the book directly inside the app.

- **Modern UI/UX Design**  
  The app’s design is inspired by this [Figma Design](https://www.figma.com/community/file/1108229757300046260/alpha-bookstore) to provide a clean and elegant user experience.

## Architecture

- Follows **Clean Architecture** pattern (Presentation, Domain, Data layers).
- Supports **online data fetching** and **offline caching**.
- Organized, scalable, and maintainable codebase.

## Screenshots

| Splash Screen | Book List | Book Details |
|:-------------:|:---------:|:------------:|
| ![Splash](screenshots/splash.jpeg) | ![Book List](screenshots/book_list.jpeg) | ![Book Details](screenshots/book_details.jpeg) |

> _Note: All designs and code are fully implemented and customized by me._

## Tech Stack

- Flutter 
- Dart
- Hive (for offline caching)
- Cubit (state management)
- Dio (for network calls)
- animate (for splash animations)

# Final Notes

This project reflects my passion for building clean, user-friendly, and performant Flutter apps.  
Everything — from coding structure to UI polish — has been implemented personally.
