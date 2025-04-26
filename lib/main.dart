import 'package:bookapp/core/services/bloc_observer.dart';
import 'package:bookapp/core/utils/theme.dart';
import 'package:bookapp/features/books/presentation/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/navigation/navigation.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<BookCubit>()),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Ash Reads',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        navigatorKey: NavigationService.navigationKey,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        builder: (context, child) => child!,
        theme: AppTheme.lightTheme
      ),
    );
  }
}
