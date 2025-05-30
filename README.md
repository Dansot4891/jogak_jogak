# 조각조각 (Jogak Jogak)

사용자가 직접 퍼즐 이미지를 업로드하거나, 앱이 제공하는 랜덤 이미지를 이용해 퍼즐을 풀 수 있는 모바일 퍼즐 게임입니다.
---

### IOS 다운로드
<a href="https://apps.apple.com/us/app/%EC%A1%B0%EA%B0%81%EC%A1%B0%EA%B0%81-%ED%8D%BC%EC%A6%90/id6745454368" target="_blank" rel="noopener">
  <img width="25%" src="https://github.com/user-attachments/assets/3f650be4-91e3-43d5-96c9-96889f99a45a" alt="iOS 다운로드">
</a>

## 📱 앱 미리보기

<img width=23% src='https://github.com/user-attachments/assets/703970b1-a5a7-4d8f-8d43-1ff705bfe661'>
<img width=23% src='https://github.com/user-attachments/assets/55af6137-124a-4211-a67c-b415fa7c8164'>
<img width=23% src='https://github.com/user-attachments/assets/09c2c434-6974-48d4-93b9-f75dde3e4924'>
<img width=23% src='https://github.com/user-attachments/assets/d6acf176-5068-4357-b471-69d7195ae1f8'>

---

## 📌 Features

- **퍼즐 플레이**
  - 사용자가 직접 이미지를 업로드하여 퍼즐을 생성하거나, 앱이 제공하는 랜덤 이미지를 선택하여 퍼즐을 풀 수 있습니다.

- **회원가입 및 로그인**
  - 이메일과 비밀번호를 이용한 계정 생성 및 로그인 기능 지원.

- **퍼즐 기록 조회**
  - 사용자가 풀었던 퍼즐 기록 및 플레이 이력을 조회할 수 있습니다.

- **랭킹 시스템**
  - 퍼즐 기록을 기반으로 전체 사용자 랭킹을 제공합니다.

---

## 🧩 아키텍처 및 기술 스택

- **아키텍처:** MVVM 기반의 클린 아키텍처 + MVI 패턴 적용
<img width=100% src='https://github.com/user-attachments/assets/3b9683fa-2462-44c1-a1ac-a57782c70612'>

- **상태 관리:** Provider
- **의존성 주입:** GetIt
- **라우팅:** GoRouter
- **로그인 방식:** Email/Password
- **모델링:** JsonSerializable
- **에러 처리:** Result Pattern
- **다국어 지원:** Easy Localization
- **code push:** shorebird

---
## 🌀 Github Action Logic
<img src='https://github.com/user-attachments/assets/e8eb4550-105a-4784-afed-df78dc1e881d'>

## 폴더 구조
```
|-- lib
    |-- app
    |   |-- di                # 의존성 주입 설정
    |   |-- environment       # 앱 버전 관리 설정
    |   |-- localization      # 다국어 지원 설정
    |   |-- router            # 라우터 설정
    |
    |-- core
    |   |-- constants         # 공통 상수
    |   |-- firebase          # Firebase 유틸
    |   |-- helper            # 헬퍼 유틸
    |   |-- module            # 모듈 관련 설정
    |   |-- service           # 공통 서비스
    |   |-- style             # 스타일 (Color, TextStyle 등)
    |
    |-- feature
    |   |-- section
    |       |-- data
    |           |-- data_source        # 외부 데이터 소스
    |           |-- dto                # 데이터 전송 객체
    |           |-- mapper             # 데이터 매핑
    |           |-- repository_impl    # 레포지토리 구현
    |       |-- domain
    |           |-- model              # 엔티티 모델
    |           |-- repository         # 레포지토리 인터페이스
    |           |-- use_case           # 유스케이스
    |
    |-- presentation
    |   |-- section
    |       |-- pages
    |           |-- root_page          # 최상위 루트 페이지 관리
    |           |-- page               # 각 화면 단위 페이지
    |           |-- event              # 화면 이벤트 처리 관리
    |           |-- state              # 화면 상태(State) 관리
    |           |-- viewmodel          # ViewModel (상태/로직 담당)
    |           |-- action             # 사용자 액션 정의
    |       |-- widgets                # 해당 섹션 위젯
```

## 테스트 코드 폴더 구조
```
|-- test
    |-- unit
    |  |-- features                   # 각 기능별
    |  |   |-- data_source_test       # Data Source 테스트
    |  |   |-- repository_test        # Repository 테스트
    |  |   |-- view_model_est         # ViewModel 테스트
    |
    |-- widget
    |  |-- features                   # 각 기능별
    |  |   |-- page_test              # 화면 테스트
    |  |   |-- dialog_test            # Dialog 테스트
```
---
