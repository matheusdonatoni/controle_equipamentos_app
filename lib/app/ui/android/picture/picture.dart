import 'package:controle_equipamentos/app/controllers/picture_controllers/picture_controller.dart';
import 'package:controle_equipamentos/app/ui/android/widgets/picture_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicturePage extends GetView<PictureController> {
  const PicturePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, child) => controller.obx(
        (state) => Scaffold(
          backgroundColor: Colors.black.withOpacity(
            controller.currentOpacity,
          ),
          body: SafeArea(
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                Obx(
                  () => SliverAnimatedOpacity(
                    opacity: controller.isFullScreen ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    sliver: SliverAppBar(
                      automaticallyImplyLeading: controller.isFullScreen &&
                          controller.isPictureStopped,
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 56.0),
                      child: Transform.translate(
                        offset: controller.currentPosition,
                        child: GestureDetector(
                          onTap: controller.onTap,
                          onVerticalDragStart: controller.onVerticalDragStart,
                          onVerticalDragUpdate: controller.onVerticalDragUpdate,
                          onVerticalDragEnd: controller.onVerticalDragEnd,
                          child: PictureView(
                            state,
                            key: controller.pictureKey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
