class Constants {
  static const API_KEY = '1428f88677af4d5f86c3f12d3601ca89';
  static const String TOP_HEADLINES_URL =
      'http://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';

  static String headlinesFor(String country) {
    return 'http://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    "USA": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch",
  };
}
