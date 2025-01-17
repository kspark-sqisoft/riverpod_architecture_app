import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
part 'cretabook_service.g.dart';

class CretabookService {}

/*
@riverpod
class ContentVideoController extends _$ContentVideoController {
  late final KeepAliveLink link;
  @override
  FutureOr<VideoController> build() async {
    link = ref.keepAlive();
    ref.onDispose(() {
      logger.d('videoControllerProvider onDispose'.toRed);
    });
    ref.onCancel(() {
      logger.d('videoControllerProvider onCancel');
    });
    ref.onResume(() {
      logger.d('videoControllerProvider onResume');
    });
    ref.onAddListener(() {
      logger.d('videoControllerProvider onAddListener');
    });
    ref.onRemoveListener(() {
      logger.d('videoControllerProvider onRemoveListener');
    });
    logger.d('videoControllerProvider initialized(build)'.toGreen);
    final player = Player();
    final controller = VideoController(player);
    await controller.player
        .open(Media('file:///D:/Pictures/video/video0.mp4'), play: false);
    await controller.waitUntilFirstFrameRendered;
    return controller;
  }

  void close() {
    link.close();
  }
}
*/

@riverpod
VideoController videoController(Ref ref, {required int id}) {
  throw UnimplementedError();
}
