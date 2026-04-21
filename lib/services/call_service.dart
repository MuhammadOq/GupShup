import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import '../core/constants/app_constants.dart';

class CallService {
  late final RtcEngine _engine;

  Future<void> initialize() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: AppConstants.agoraAppId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));

    await [Permission.microphone, Permission.camera].request();
  }

  Future<void> joinCall(String channelId, int uid, {bool isVideo = true}) async {
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: '', // User should implement token generation logic
      channelId: channelId,
      uid: uid,
      options: const ChannelMediaOptions(),
    );
  }

  Future<void> leaveCall() async {
    await _engine.leaveChannel();
  }

  RtcEngine get engine => _engine;
}
