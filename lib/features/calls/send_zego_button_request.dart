import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit/zego_uikit.dart';

class ZegoCallButton extends StatelessWidget {
  final bool isVideoCall;
  final String resourceID;
  final List<ZegoUIKitUser> invitees;

  const ZegoCallButton({
    super.key,
    required this.isVideoCall,
    required this.resourceID,
    required this.invitees,
  });

  @override
  Widget build(BuildContext context) {
    return ZegoSendCallInvitationButton(
      isVideoCall: isVideoCall,
      resourceID: resourceID,
      invitees: invitees,
    );
  }
}
