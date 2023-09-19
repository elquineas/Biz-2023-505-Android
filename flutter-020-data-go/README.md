# 공공데이터 광주 BIS 정보 openAPI

- openAPI 활용을 위한 ㅇependencies 설치

```bash
flutter pub add http
flutter pub add provider
flutter pub add xml2json
flutter apb add flutter_dotenv

flutter pub add http provider xml2json flutter_dotenv

```

## dotEnv 를 이용한 설정 데이터 보호하기

- `프로젝트root/assets/.env` 파일 생성
- `.gitignore` 파일에 `*.env` 를 등록
- `git add .`, `git commit -m key`, `git push`를 실행하여 `.env` 파일이 업로드되는지 확인

- `dotEnv` 는 JS, NodeJS, React 등에서 환경설정값이나 비밀번호등을 보호하기 위하여 사용하는 도구
- 프로젝트에 .env.\* 로 시작되는 파일을 생성하고, 이 파일에 여러 정보를 저장해 두고
  프로젝트에서 공용으로 사용할수 있도록 하는 도구이다.
