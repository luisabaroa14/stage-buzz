import 'package:app/core/navigation/transition.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/home/pages/home.dart';
import '../../presentation/features/about/pages/about.dart';
import '../../presentation/features/contact/pages/contact.dart';
import '../../presentation/features/news/pages/news.dart';
import '../../presentation/features/events/pages/events.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: HomeScreen.route,
    // redirect: (BuildContext context, GoRouterState state) {
    //   // Validate auth
    //   if (true) {
    //     return context.namedLocation(HomeScreen.route);
    //   }
    // },
    routes: [
      GoRoute(
        path: HomeScreen.route,
        name: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
        pageBuilder: defaultPageBuilder(const HomeScreen()),
      ),
      GoRoute(
        path: AboutScreen.route,
        name: AboutScreen.route,
        builder: (context, state) => const AboutScreen(),
        pageBuilder: defaultPageBuilder(const AboutScreen()),
      ),
      GoRoute(
        path: NewsScreen.route,
        name: NewsScreen.route,
        builder: (context, state) => const NewsScreen(),
        pageBuilder: defaultPageBuilder(const NewsScreen()),
      ),
      GoRoute(
        path: EventsScreen.route,
        name: EventsScreen.route,
        builder: (context, state) => const EventsScreen(),
        pageBuilder: defaultPageBuilder(const EventsScreen()),
      ),
      GoRoute(
        path: ContactScreen.route,
        name: ContactScreen.route,
        builder: (context, state) => const ContactScreen(),
        pageBuilder: defaultPageBuilder(const ContactScreen()),
      ),
    ],
  );
}
