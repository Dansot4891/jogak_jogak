import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/service/admob/admob_service.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';

enum AdmobState { loading, done, error }

// Admob, 구글 광고가 나오는 화면에서 사용되는 mixin
// with를 통해 mixin을 사용하며
// 해당 mixin 내에서 사용되는 모든 변수나 함수 사용이 가능하다.
mixin AdmobMixin {
  BannerAd? _bannerAd;
  final ValueNotifier<AdmobState> bannerState = ValueNotifier(
    AdmobState.loading,
  );

  /// 광고 초기화
  void initBanner() {
    final adUnitId = AdMobService.bannerAd;
    if (adUnitId == null) {
      bannerState.value = AdmobState.error;
      return;
    }

    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerState.value = AdmobState.done;
        },
        onAdFailedToLoad: (ad, error) {
          print('error: $error');
          print('ad: $ad');
          ad.dispose();
          bannerState.value = AdmobState.error;
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  /// 광고 위젯 빌드
  ValueListenableBuilder buildBanner({EdgeInsets? margin}) {
    return ValueListenableBuilder<AdmobState>(
      valueListenable: bannerState,
      builder: (context, state, child) {
        if (state == AdmobState.loading) {
          return Container(
            height: 80,
            alignment: Alignment.center,
            margin: margin,
            child: const BaseLoadingView(),
          );
        }
        if (state == AdmobState.error) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              LocaleKeys.homeGuideText.tr(),
              style: AppTextStyle.title2,
            ),
          );
        }
        // done
        return Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: AdWidget(ad: _bannerAd!),
        );
      },
    );
  }

  /// 리소스 해제
  void disposeBanner() {
    _bannerAd?.dispose();
    bannerState.dispose();
  }
}
