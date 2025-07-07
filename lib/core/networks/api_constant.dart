class ApiConstant {
  static const String baseUrl = "http://195.88.87.77:8000";
  //auth
  static const String auth = "$baseUrl/auth";
  static const String loginPath = "$auth/login";
  static const String registerPath = "$auth/register";
  static const String verificationCode = "$auth/verification";
  static const String refresh = "$auth/refresh";
  static const String changePassword = "$auth/change-password";

  //tickets
  static const String createTicket = "$baseUrl/tickets";
  static const String getAllTickets = "$baseUrl/tickets";

  //properties
  static const String getAllProperties = "$baseUrl/properties";
}
