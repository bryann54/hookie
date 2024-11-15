import 'package:flutter/material.dart';
import 'package:hookee/core/theme/app_theme.dart';
import 'package:hookee/core/theme/theme_controller.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';
import 'package:hookee/features/home/presentation/bloc/home_bloc.dart';
import 'package:hookee/features/home/presentation/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(create: (_) => HomeBloc(UserRepository())),
     ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeController(),
        child: Consumer<ThemeController>(
          builder: (context, themeController, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeController.themeMode,
              home:const BottomNav(),
            );
          },
        ),
      ),
    );
  }
}
