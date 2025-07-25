import 'package:graduation_project/core/networks/api_constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallServices {
  /// on App's user login
  Future<void> onUserLogin(String currentUserId, String currentUserName) async {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    await ZegoUIKitPrebuiltCallInvitationService().init(
      appID: ApiConstant.appId /*input your AppID*/,
      appSign: ApiConstant.appSign /*input your AppSign*/,
      userID: currentUserId,
      userName: currentUserName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
  }

  /// on App's user logout
  void onUserLogout() {
    /// 1.2.2. de-initialization ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged out
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
