import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_architecture_app/features/cretabook/presentation/widget/video_widget.dart';
import 'package:riverpod_architecture_app/utils/async_value_extension.dart';
import 'package:riverpod_architecture_app/utils/string_color_extension.dart';

import '../../../main.dart';
import '../application/cretabook_service.dart';

class CretaBookScreen extends ConsumerStatefulWidget {
  const CretaBookScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CretaBookScreenState();
}

class _CretaBookScreenState extends ConsumerState<CretaBookScreen> {
  late final List<VideoController> controllers;
  @override
  void initState() {
    logger.d('######################################');
    logger.d('CretaBookScreen initState');
    super.initState();
  }

  @override
  void dispose() {
    logger.d('CretaBookScreen dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controllers = [
      ref.read(videoControllerProvider(id: 0)),
      ref.read(videoControllerProvider(id: 1)),
      ref.read(videoControllerProvider(id: 2)),
      ref.read(videoControllerProvider(id: 3)),
    ];

    final children = controllers.map(
      (e) {
        final video = VideoWidget(controller: e);
        if (Theme.of(context).platform == TargetPlatform.android) {
          return video;
        }
        return Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: video,
        );
      },
    ).toList();
    return Scaffold(
        body: GridView.extent(
      maxCrossAxisExtent: 480.0,
      padding: const EdgeInsets.all(16.0),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      childAspectRatio: 16.0 / 9.0,
      children: children,
    ));
  }
}
