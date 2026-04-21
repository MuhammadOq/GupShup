import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

class VoiceNoteService {
  final _record = AudioRecorder();
  final _player = AudioPlayer();
  String? _currentPath;

  Future<void> startRecording() async {
    if (await _record.hasPermission()) {
      final dir = await getApplicationDocumentsDirectory();
      _currentPath = '${dir.path}/voice_note_${DateTime.now().millisecondsSinceEpoch}.m4a';
      
      const config = RecordConfig();
      await _record.start(config, path: _currentPath!);
    }
  }

  Future<String?> stopRecording() async {
    final path = await _record.stop();
    return path;
  }

  Future<void> playVoiceNote(String path) async {
    if (path.startsWith('http')) {
      await _player.play(UrlSource(path));
    } else {
      await _player.play(DeviceFileSource(path));
    }
  }

  Future<void> stopPlaying() async {
    await _player.stop();
  }

  Stream<Duration> get positionStream => _player.onPositionChanged;
  Stream<Duration> get durationStream => _player.onDurationChanged;
}
