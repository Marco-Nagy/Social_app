import 'package:flutter/cupertino.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryScreen extends StatelessWidget {
  StoryScreen({Key? key}) : super(key: key);

  final controller = StoryController();

  @override
  Widget build(context) {
    List<StoryItem> storyItems = [
      StoryItem.pageImage(
        url: 'https://image.freepik.com/free-vector/christmas-sale-background-with-realistic-christmas-decoration_1361-3118.jpg',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://image.freepik.com/free-vector/realistic-christmas-sale-background-with-ornaments-podium_1361-3754.jpg',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://image.freepik.com/free-vector/realistic-christmas-background-with-ornaments-podium_1361-3748.jpg',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://image.freepik.com/free-vector/christmas-tree-background-with-ornamental-elements_1361-804.jpg',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://image.freepik.com/free-vector/bizkette2_1361-3729.jpg',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://image.freepik.com/free-vector/realistic-christmas-sale-background-with-presents-ornaments_1361-3614.jpg',
        controller: controller,
      ),
    ]; // your list of stories

    return StoryView(
      controller: controller,
      // pass controller here too
      repeat: true,
      // should the stories be slid forever
      onStoryShow: (s) {
        //notifyServer(s)
      },
      onComplete: () {},
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          Navigator.pop(context);
        }
      },
      storyItems: storyItems,
      // To disable vertical swipe gestures, ignore this parameter.
      // Preferrably for inline story view.
    );
  }
}
