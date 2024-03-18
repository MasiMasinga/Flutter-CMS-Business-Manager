// Dotenv
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static String get baseUrl =>
      dotenv.env['API_URL'] ?? 'http://10.0.2.2:6000/api';
}
