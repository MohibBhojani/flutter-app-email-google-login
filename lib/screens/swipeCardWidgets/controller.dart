import 'cards.dart';
import 'swip_info.dart';

/// Card controller
class TCardController {
  TCardState? state;

  void bindState(TCardState state) {
    this.state = state;
  }

  int get index => state?.frontCardIndex ?? 0;

  forward({SwipDirection? direction}) {
    if (direction == null) {
      direction = SwipDirection.Right;
    }

    state!.swipInfoList.add(SwipInfo(state!.frontCardIndex, direction));
    state!.runChangeOrderAnimation();
  }

  back({SwipDirection? direction}) {
    if (direction == null) {
      direction = SwipDirection.Left;
    }

    state!.swipInfoList.add(SwipInfo(state!.frontCardIndex, direction));
    state!.runChangeOrderAnimation();
  }

  undo() {
    state!.runReverseOrderAnimation();
  }

  get reset => state!.reset;

  void dispose() {
    state = null;
  }
}
