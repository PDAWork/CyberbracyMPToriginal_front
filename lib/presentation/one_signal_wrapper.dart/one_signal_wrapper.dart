import 'package:cyberbracy_mpt_original_front/presentation/one_signal_wrapper.dart/cubit/one_signal_wrapper_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/video_call/view/video_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalWrapper extends StatefulWidget {
  final Widget child;
  const OneSignalWrapper({super.key, required this.child});

  @override
  State<OneSignalWrapper> createState() => _OneSignalWrapperState();
}

class _OneSignalWrapperState extends State<OneSignalWrapper> {
  @override
  void initState() {
    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      context
          .read<OneSignalWrapperCubit>()
          .handleClickNotification(openedResult);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OneSignalWrapperCubit, OneSignalWrapperState>(
      listener: (context, state) {
        if (state is OneSignalWrapperIos) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => VideoCall(
                        toId: state.toId,
                        fromId: state.fromId,
                        roomId: state.roomId,
                      )));
        } else if (state is OneSignalWrapperAndoid) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoCall(
                        toId: state.toId,
                        fromId: state.fromId,
                        roomId: state.roomId,
                      )));
        }
      },
      child: SizedBox(
        child: widget.child,
      ),
    );
  }
}
