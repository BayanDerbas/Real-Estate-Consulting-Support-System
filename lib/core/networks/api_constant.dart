class ApiConstant {
  static const String baseUrl = "http://195.88.87.77:8000";
  //
  //static const String baseUrl = "http://192.168.1.11:8080";

  //Auth
  static const String auth = "$baseUrl/auth";
  static const String loginPath = "$auth/login";
  static const String registerPath = "$auth/register";
  static const String verificationCode = "$auth/verification";
  static const String refresh = "$auth/refresh";
  static const String sendCode = "$auth/send-code";
  static const String changePassword = "$auth/change-password";
  //chats
  static const String chat = "/api/v1/rooms";
  static const String getAllRoomsForCurrentUser = "$chat/user/{id}";
  static const String getRoomMessages = "$chat/{roomId}/messages";
  static const String createRoom = chat;
  static const String getRoomById = "$chat/{id}";
  //calls
  static const int appId = 1926797635;
  static const String appSign =
      '65fceb63e38a98479d3143ce8686f4d9e665f9e5a9ca9879aa19b0a7886ec26d';
  //tickets
  static const String createTicket = "$baseUrl/tickets";
  static const String getAllTickets = "$baseUrl/tickets";
  static const String getMyTickets = "$baseUrl/tickets";
  static const String filterTickets = "$baseUrl/tickets/filters";
  // posts
  static const String addPost = "$baseUrl/posts";
  static const String createProperty = "$baseUrl/properties";

  //Bayan
  //properties (done show list and details page 2 api with filter types)
  static const String getAllProperties = "$baseUrl/properties";
  //officers (done show list and details page 2 api)
  static const String getAllOffices = "$baseUrl/offices";
  //experts (done show list and details page 2 api)
  static const String getAllExperts = "$baseUrl/experts";
  //booking (done show list and details 2 api with filter)
  static const String booking = "$baseUrl/booking";
  //show the working times experts by id
  static const String working_times = "$baseUrl/working_times/all/{id}";
  //the reservation appointement for expert
  static const String reservation_allready = "$baseUrl//booking/{id}";
  //show my reservation with status
  static const String showMyReserve = "$baseUrl/booking/all/{status}";
}
