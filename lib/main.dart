import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/cubit/app_cubit.dart';
import 'package:yolo247/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: MaterialApp(
            title: 'Cricket Score Counter',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            initialRoute: Routes.splash,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
