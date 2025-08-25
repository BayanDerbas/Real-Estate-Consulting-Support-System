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
  static const String checkStatus = "$auth/check-status/{userId}";
  //chats
  static const String chat = "/api/v1/rooms";
  static const String getAllRoomsForCurrentUser = "$chat/user/{id}";
  static const String getRoomMessages = "$chat/{roomId}/messages";
  static const String createRoom = chat;
  static const String getRoomById = "$chat/{id}";
  //calls
  static const int appId = 350959940;
  static const String appSign =
      '56c7288cdfd176af7ebd3d47c255f1fc8130828fc18c4e77ef94f7e72f00ce4f';

  //tickets
  static const String createTicket = "$baseUrl/tickets";
  static const String getAllTickets = "$baseUrl/tickets";
  static const String getMyTickets = "$baseUrl/tickets";
  static const String filterTickets = "$baseUrl/tickets/filters";
  // posts
  static const String addPost = "$baseUrl/posts";
  static const String createProperty = "$baseUrl/properties";
  static const String addPhotosToProperty = "/property-images";

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
  static const String reservation_allready = "$baseUrl/booking/{id}";
  //show my reservation with status for expert id has reservations from clients
  static const String showMyReserve = "$baseUrl/booking/all/{status}";
  //show posts
  static const String showPosts = "$baseUrl/posts";
  //FAQs Support
  static const String FAQS = "$baseUrl/FAQs";
  //create Coupons
  static const String create_coupons = "$baseUrl/coupons";
  //show Coupons
  static const String get_coupons = "$baseUrl/coupons";
  //find all posts by expert id
  static const String postsbyId = "$baseUrl/posts/expert/{expertId}";
  //find all properties by officeId
  static const String propertiesbyId = "$baseUrl/properties/office/{officeId}";
  // show reservations for clients
  static const String showMyAppointement = "$baseUrl/booking/my/";
}
