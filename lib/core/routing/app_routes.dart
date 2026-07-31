/// Named route path constants for Go Router.
abstract final class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String mode = '/mode';
  static const String setup = '/setup';
  static const String rules = '/rules';
  static const String game = '/game/:id';
  static const String result = '/result';
  static const String profile = '/profile';
  static const String statistics = '/statistics';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String about = '/about';

  static String gamePath(String id) => '/game/$id';
}
