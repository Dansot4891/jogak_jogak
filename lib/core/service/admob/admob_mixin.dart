import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jogak_jogak/core/service/admob/admob_service.dart';

// Admob, 구글 광고가 나오는 화면에서 사용되는 mixin
// with를 통해 mixin을 사용하며
// 해당 mixin 내에서 사용되는 모든 변수나 함수 사용이 가능하다.
mixin AdmobMixin {
  late BannerAd _bannerAd;

  void getBanner() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAd!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  // Banner Widget
  Container banner() {
    if (!Platform.isIOS) {
      return Container(height: 80);
    }
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: AdWidget(ad: _bannerAd),
    );
  }
}
