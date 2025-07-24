import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/calls/calls_service.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit/zego_uikit.dart';

import '../../core/constants/colors.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final SecureStorage storage = SecureStorage();
  final CallServices services = CallServices();

  // These are for the *target* user you're calling
  final TextEditingController _inviteeNameController = TextEditingController();
  final TextEditingController _inviteeIdController = TextEditingController();

  String? _currentUserId;
  String? _currentUserName;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    _currentUserId = await storage.getCallId();
    _currentUserName = await storage.getCallName();

    if (_currentUserId != null && _currentUserName != null) {
      services.onUserLogin(_currentUserId!, _currentUserName!);
    }
  }

  @override
  void dispose() {
    _inviteeNameController.dispose();
    _inviteeIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Call someone:'),
              const SizedBox(height: 20),

              TextField(
                controller: _inviteeNameController,
                decoration: const InputDecoration(
                  labelText: 'Invitee Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _inviteeIdController,
                decoration: const InputDecoration(
                  labelText: 'Invitee ID',
                  prefixIcon: Icon(Icons.perm_identity),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'ref',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                width: 50,
                onPressed: () {
                  setState(() {});
                },
              ),
              ZegoSendCallInvitationButton(
                isVideoCall: false,
                resourceID: "realEstateCons",
                invitees: [
                  ZegoUIKitUser(
                    id: _inviteeIdController.text.trim(),
                    name: _inviteeNameController.text.trim(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
