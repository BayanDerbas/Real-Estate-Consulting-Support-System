import 'package:graduation_project/core/networks/api_constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallServices {
  Future<void> onUserLogin(String currentUserId, String currentUserName) async {
    await ZegoUIKitPrebuiltCallInvitationService().init(
      appID: ApiConstant.appId,
      appSign: ApiConstant.appSign,
      userID: currentUserId,
      userName: currentUserName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  void onUserLogout() {
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
