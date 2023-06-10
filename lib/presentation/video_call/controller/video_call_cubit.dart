import 'dart:developer';

import 'package:cyberbracy_mpt_original_front/presentation/video_call/controller/video_call_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallCubit extends Cubit<VideoCallState> {
  VideoCallCubit() : super(VideoCallInitialState());
  Future<void> setupCalling() async {
    emit(VideoCallLoadingState());
    var statusVideo = await Permission.camera.status;
    var statusAudio = await Permission.microphone.status;
    var statusBluetooth = await Permission.bluetooth.status;
    log(statusVideo.toString());
    log(statusAudio.toString());
    log(statusBluetooth.toString());
    if (!statusAudio.isGranted) {
      await Permission.microphone.request();
    } else if (!statusVideo.isGranted) {
      await Permission.camera.request();
    } else if (!statusBluetooth.isGranted) {
      await Permission.bluetooth.request();
    }
  }
}
