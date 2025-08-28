import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/posts/presentation/widgets/base_post_screen.dart';
import '../controllers/get_current_user_rooms_controller.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GetCurrentUserRoomsController(Get.find()));

    return BasePostScreen(
      onBack: () => Get.back(),
      appBarTitle: 'Conversations',
      heightOfAppBar: 100,
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final rooms = controller.filteredRooms;

        return ListView.builder(
          itemCount: rooms.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => controller.searchQuery.value = value,
                  decoration: InputDecoration(
                    hintText: "Search conversations...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              );
            }
            final room = rooms[index - 1];
            final user = room.otherUser;
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    (user?.imageUrl?.isNotEmpty ?? false)
                        ? NetworkImage(user!.imageUrl!)
                        : null,
                child:
                    (user?.imageUrl?.isEmpty ?? true)
                        ? const Icon(Icons.person)
                        : null,
              ),
              title: Text("${user?.firstName ?? ''} ${user?.lastName ?? ''}"),
              subtitle: Text(user?.email ?? ''),
              trailing: Text(room.createdAt ?? ''),
              onTap: () => controller.goToExistingRoom(room),
            );
          },
        );
      }),
    );
  }
}
