// ---- image cache size extension ----
import 'package:jogak_jogak/core/service/app_size.dart';

extension CacheImageExtension on num {
  int cacheSize() {
    final devicePixel = AppSize.devicePixelRatio;
    return (this * devicePixel).toInt();
  }
}
