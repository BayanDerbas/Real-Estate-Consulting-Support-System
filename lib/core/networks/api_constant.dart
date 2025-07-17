class ApiConstant {
  static const String baseUrl = "http://195.88.87.77:8000";
  //Auth
  static const String auth = "$baseUrl/auth";
  static const String loginPath = "$auth/login";
  static const String registerPath = "$auth/register";
  static const String verificationCode = "$auth/verification";
  static const String refresh = "$auth/refresh";
  static const String sendCode = "$auth/send-code";
  static const String changePassword = "$auth/change-password";
  //chats
  static const String chat = "$auth/api/v1/rooms";
  static const String getAllRoomsForCurrentUser = "$chat/user/{id}";
  static const String getRoomMessages = "$chat/{roomId}/messages";
  static const String createRoom = "$chat/{roomId}/{page}/{size}";
  static const String getRoomById = "$chat/{roomId}";
  //tickets
  static const String createTicket = "$baseUrl/tickets";
  static const String getAllTickets = "$baseUrl/tickets";
  static const String getMyTickets = "$baseUrl/tickets";
  static const String filterTickets = "$baseUrl/tickets/filters";
  //properties
  static const String getAllProperties = "$baseUrl/properties";
  //officers
  static const String getAllOffices = "$baseUrl/offices";
  //experts
  static const String getAllExperts = "$baseUrl/experts";
}
