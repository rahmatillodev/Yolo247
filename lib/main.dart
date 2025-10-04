import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/bloc/app_bloc_impl.dart';
import 'package:yolo247/core/routes/app_routes.dart';

import 'core/cubit/app_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.pink, // status bar color
    ),
  );

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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AppCubit()),
            BlocProvider(create: (context) => AppBloc()),
          ],
          child: MaterialApp(
            title: 'Yolo247 Cricket Score Counter',
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
