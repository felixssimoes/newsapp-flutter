import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  String get newsApiKey => dotenv.env['new_api_key']!;
}
