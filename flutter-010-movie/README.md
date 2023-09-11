# Naver OpenAPI 를 활용한 영화정보 어플

- OpenAPI를 사용하기 위한 Dependency 도구 설치

```bash
flutter pub add http flutter_html
flutter pub add http
flutter pub add flutter_html
```

## 프로젝트 패키지 이름 변경하기

- 프로젝트를 생성할때 기본 패키지를 잘 만들어야 한다.
  패키지를 잘못 만들면, google play store, App Store에 어플을 배포할 수 없다.
  패키지는 기존의 다른 어플과 완전히 다른 값으로 설정해야 한다.
- 패키지는 회사의 인터넷 홈페이지 주소와 연동하여 설정한다.
- `https://www.elquineas.com` 이라는 홈페이지가 있으면 `com.elquineas.어플이름` 형식으로 사용한다.
- 프로젝트를 만들당시에 패키지를 잘못 지정하거나, 지정하지 않았을 경우
  개발ㄷ도중에 패키지명을 변경해야할 필요가 있다. 이때 사용하는 도구가 있다.
- 패키지명 변경도구 : `flutter pub add change_app_package_name` (프로젝트에 바로 설치)
- 패키지명 변경 : `flutter pub run change_app_package_name:main com.elquineas.movie`

## OpenAPI 를 사용하기 위한 Android 설정 변경

- `\android\src\main\kotlin` 폴더의 `MainActivity.kt` 파일에서 패키지명이 잘 설정되었는지 확인
- `\android\src\main\androidManifast.xml` 파일을 열어서 패키지 명이 잘 설정되었는지 확인
- `mainfast 와 application` 사이에서 다음항목 추가

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application>
```

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <queries>
        <package android:name="com.elquineas.movie" />
    </queries>
    <application>
```
