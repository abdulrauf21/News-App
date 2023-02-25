import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static const String baseUrl = "https://newsapi.org/v2/";
  static const String category = "top-headlines?country=us&category=";
  
  static String connomApiKey = "&${dotenv.env['apiKey']}";
}
