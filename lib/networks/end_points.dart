final String baseURl =
    "https://worldometers.p.rapidapi.com/api/coronavirus/country/";

final String baseUrlNepal = "https://corona.askbhunte.com/api";

final String baseUrlNepalVersion = "/v1/";

final String mythEndpoints = "myths";

final String hospitalEndpoints = "hospitals";

Uri requestSummary(String country) {
  print("${baseURl}${country}");
  return Uri.parse("${baseURl}${country}");
}

Uri requestNepal(String endpoint) {
  print("${baseUrlNepal}${baseUrlNepalVersion}${endpoint}");
  return Uri.parse("${baseUrlNepal}${baseUrlNepalVersion}${endpoint}");
}
