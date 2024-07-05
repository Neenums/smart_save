class AppUrl {
  static const String liveBaseURL = "https://shiny-awful-wildebeast.gigalixirapp.com/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";

  static const String baseURL = liveBaseURL;
  static const String login = "https://api.escuelajs.co/api/v1/auth/login";
  static const String register = "https://api.escuelajs.co/api/v1/users/";
  static const String forgotPassword = baseURL + "/forgot-password";
}