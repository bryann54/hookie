import 'package:flutter/material.dart';
import 'package:hookee/core/theme/app_theme.dart';
import 'package:hookee/core/theme/theme_controller.dart';
import 'package:hookee/features/authentication/presentation/pages/signup_screen.dart';
import 'package:hookee/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/data/repositories/user_repository.dart';
import 'package:hookee/features/home/presentation/bloc/home_bloc.dart';
import 'package:hookee/features/notifications/data/repositories/notifications_repository.dart';
import 'package:hookee/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final User user;
  const App({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(UserRepository()),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(),
        ),
        BlocProvider(
          create: (_) =>
              NotificationsBloc(repository: NotificationsRepositoryImpl())
                ..add(const LoadNotifications()),
        ),
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
              home: SignupScreen(
                user: user,
              ),
            );
          },
        ),
      ),
    );
  }
}
