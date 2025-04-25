sealed class HomeAction {
  const factory HomeAction.selectImage() = SelectImage;
  const factory HomeAction.getRandomImageUrl() = GetRandomImageUrl;
  const factory HomeAction.selectLevel(int level) = SelectLevel;
  const factory HomeAction.removeImage() = RemoveImage;
  const factory HomeAction.resetState() = ResetState;
}

class GetRandomImageUrl implements HomeAction {
  const GetRandomImageUrl();
}

class SelectLevel implements HomeAction {
  final int level;
  const SelectLevel(this.level);
}

class SelectImage implements HomeAction {
  const SelectImage();
}

class ResetState implements HomeAction {
  const ResetState();
}

class RemoveImage implements HomeAction {
  const RemoveImage();
}
