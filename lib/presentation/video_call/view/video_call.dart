import 'dart:convert';

import 'package:cyberbracy_mpt_original_front/presentation/video_call/controller/video_call_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/video_call/controller/video_call_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final RTCVideoRenderer localVideo = RTCVideoRenderer();
  final RTCVideoRenderer remoteVideo = RTCVideoRenderer();
  late final MediaStream localStream;
  late final WebSocketChannel channel;
  MediaStream? remoteStream;
  RTCPeerConnection? peerConnection;

  // Connecting with websocket Server
  void connectToServer() {
    try {
      channel = WebSocketChannel.connect(
          Uri.parse("ws://46.243.201.240:8000/video/room1/"));
      // Listening to the socket event as a stream
      channel.stream.listen(
        (message) async {
          // print(message);
          // Decoding message
          Map<String, dynamic> decoded = jsonDecode(message);

          // If the client receive an offer
          if (decoded["type"] == "sending_offer") {
            // Set the offer SDP to remote description
            if (decoded['from'] == 1) {
              return;
            }
            await peerConnection?.setRemoteDescription(
              RTCSessionDescription(
                decoded["offer"]["sdp"],
                decoded["offer"]["type"],
              ),
            );
            // Create an answer
            RTCSessionDescription answer = await peerConnection!.createAnswer();
            // Set the answer as an local description
            await peerConnection!.setLocalDescription(answer);
            // Send the answer to the other peer
            channel.sink.add(
              jsonEncode(
                {
                  "type": "sending_answer",
                  'from': 1,
                  'to': 2,
                  "answer": answer.toMap(),
                },
              ),
            );
          }
          // If client receive an Ice candidate from the peer
          else if (decoded["type"] == "sending_candidate") {
            // It add to the RTC peer connection
            if (decoded['from'] == 1) {
              return;
            }
            peerConnection?.addCandidate(
              RTCIceCandidate(
                decoded["candidate"]["candidate"],
                decoded["candidate"]["sdpMid"],
                decoded["candidate"]["sdpMLineIndex"],
              ),   
            );
          }
          // If Client recive an reply of their offer as answer

          else if (decoded["type"] == "sending_answer") {
            if (decoded['from'] == 1) {
              return;
            }
            await peerConnection?.setRemoteDescription(
              RTCSessionDescription(
                decoded["answer"]["sdp"],
                decoded["answer"]["type"],
              ),
            );
          }
          // If no condition fulfilled? printout the message
          else {
            print(decoded);
          }
        },
      );
    } catch (e) {
      throw "ERROR $e";
    }
  }

  // STUN server configuration
  Map<String, dynamic> configuration = {
    'iceServers': [
      {
        'urls': [
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302',
          'stun:stun.ripls.ru:5349',
        ],
      },
      {
        'url': 'turn:turn.ripls.ru:5349',
        'username': 'user1',
        'credential': 'password1',
      },
    ]
  };

  // This must be done as soon as app loads
  void initialization() async {
    // Getting video feed from the user camera
    localStream = await navigator.mediaDevices
        .getUserMedia({'video': true, 'audio': true});

    // Set the local video to display
    localVideo.srcObject = localStream;
    // Initializing the peer connecion
    peerConnection = await createPeerConnection(configuration);
    
    Helper.switchCamera(localStream.getVideoTracks()[0]);
    setState(() {});
    // Adding the local media to peer connection
    // When connection establish, it send to the remote peer
    localStream.getTracks().forEach((track) {
      peerConnection?.addTrack(track, localStream);
    });
  }

  void makeCall() async {
    // Creating a offer for remote peer
    RTCSessionDescription offer = await peerConnection!.createOffer();

    // Setting own SDP as local description
    await peerConnection?.setLocalDescription(offer);

    // Sending the offer
    channel.sink.add(
      jsonEncode(
        {
          "type": "sending_offer",
          "from": 1,
          'to': 2,
          'offer': offer.toMap(),
        },
      ),
    );
  }

  // Help to debug our code
  void registerPeerConnectionListeners() {
    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      print('ICE gathering state changed: $state');
    };

    peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
      channel.sink.add(
        jsonEncode(
          {
            "type": "sending_candidate",
            "from": 1,
            'to': 2,
            "candidate": candidate.toMap(),
          },
        ),
      );
    };

    peerConnection?.onConnectionState = (RTCPeerConnectionState state) {
      print('Connection state change: $state');
    };

    peerConnection?.onSignalingState = (RTCSignalingState state) {
      print('Signaling state change: $state');
    };

    peerConnection?.onTrack = ((tracks) {
      tracks.streams[0].getTracks().forEach((track) {
        remoteStream?.addTrack(track);
      });
    });

    // When stream is added from the remote peer
    peerConnection?.onAddStream = (MediaStream stream) {
      remoteVideo.srcObject = stream;
      setState(() {});
    };
  }

  @override
  void initState() {
    connectToServer();

    localVideo.initialize();
    remoteVideo.initialize();

    initialization();

    channel.sink.add(
      jsonEncode(
        {
          'type': 'new_user_joined',
          'from': 1,
          'user_full_name': 'testuser2@mail.ru',
        },
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    peerConnection?.close();
    localVideo.dispose();
    remoteVideo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCallCubit, VideoCallState>(
      builder: (context, state) {
        if (state is VideoCallInitialState) {
          context.read<VideoCallCubit>().setupCalling();
        }
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: RTCVideoView(
                  remoteVideo,
                  mirror: false,
                ),
              ),
              Positioned(
                right: 10,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: RTCVideoView(
                    localVideo,
                    mirror: true,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.amberAccent,
                  onPressed: () => registerPeerConnectionListeners(),
                  child: const Icon(Icons.settings_applications_rounded),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () => {
                    makeCall(),
                  },
                  child: const Icon(Icons.call_outlined),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    channel.sink.add(
                      jsonEncode(
                        {
                          "event": "msg",
                          "data": "Hi this is an offer",
                        },
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.call_end_outlined,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
