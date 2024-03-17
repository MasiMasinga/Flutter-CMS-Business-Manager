// Dotenv
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String get baseUrl =>
      dotenv.env['API_URL'] ?? 'https://localhost:6000/api';
}
