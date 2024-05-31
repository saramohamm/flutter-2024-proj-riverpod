import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screen/AddUserPage.dart';
import '../presentation/screen/admin_page.dart';
import '../presentation/screen/available_cars.dart';
import '../presentation/screen/book_car.dart';
import '../presentation/screen/loginScreen.dart';
import '../presentation/screen/payment.dart';
import '../presentation/screen/regScreen.dart';
import '../presentation/screen/showroom.dart';
import '../presentation/screen/UpdateUserPage.dart';
import '../presentation/screen/WelcomeScreen.dart';

GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => const MaterialPage(
        child: WelcomeScreen(),
      ),
    ),
    GoRoute(
      path: "/signup",
      pageBuilder: (context, state) =>  MaterialPage(
        child: RegScreen(),
      ),
    ),
    GoRoute(
      path: "/login",
      pageBuilder: (context, state) => MaterialPage(
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: "/showroom",
      pageBuilder: (context, state) => const MaterialPage(
        child: Showroom(),
      ),
    ),
    GoRoute(
      path: "/cars",
      pageBuilder: (context, state) => const MaterialPage(
        child: AvailableCars(),
      ),
    ),
    GoRoute(
      path: "/pay",
      pageBuilder: (context, state) => const MaterialPage(
        child: PaymentPage(),
      ),
    ),
    GoRoute(
      path: "/add",
      pageBuilder: (context, state) => const MaterialPage(
        child: AddUserPage(),
      ),
    ),
    GoRoute(
      path: "/admin",
      pageBuilder: (context, state) => const MaterialPage(
        child: AdminPage(),
      ),
    ),
    GoRoute(
      path: "/welcome",
      pageBuilder: (context, state) => const MaterialPage(
        child: WelcomeScreen(),
      ),
    ),
  ],
);
