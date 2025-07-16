// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/chat_controller.dart';
// import '../wedgits/custom_message.dart';
// import 'package:intl/intl.dart';
//
// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//   final controller = Get.put(ChatController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal[900],
//         leading: const BackButton(color: Colors.white),
//         title: Row(
//           children: [
//             const CircleAvatar(
//               backgroundImage: AssetImage('assets/avatar.jpg'), // Your image
//               radius: 18,
//             ),
//             const SizedBox(width: 8),
//             const Text("احمد احمد", style: TextStyle(color: Colors.white)),
//             const SizedBox(width: 6),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Text(
//                 "متصل",
//                 style: TextStyle(fontSize: 10, color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.more_vert, color: Colors.white),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               final messages = controller.messages;
//               return ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final message = messages[index];
//                   //  final isMe = message.sender?.id == controller.currentUserId;
//
//                   bool showTimestamp = true;
//                   if (index > 0) {
//                     final previous = messages[index - 1];
//                     //  showTimestamp = message.timestamp != previous.timestamp;
//                   }
//
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       if (showTimestamp)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: Text(
//                             '',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey.shade600,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ChatBubble(
//                         text: message.content ?? '',
//                         alignment:
//                             isMe ? Alignment.centerRight : Alignment.centerLeft,
//                         backgroundColor:
//                             isMe ? Colors.purple : Colors.grey.shade200,
//                         textColor: isMe ? Colors.white : Colors.black87,
//                       ),
//                     ],
//                   );
//                 },
//               );
//             }),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               border: const Border(top: BorderSide(color: Colors.grey)),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.question_answer, color: Colors.grey),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     controller: controller.content,
//                     decoration: const InputDecoration(
//                       hintText: 'Text message ...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send, color: Colors.blue),
//                   onPressed: controller.sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
