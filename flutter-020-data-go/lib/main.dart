import 'package:api/api/bus_station.dart';
import 'package:api/provider/bus_station_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // .env 환경설정 파일을 프로젝트에서 사용하겠다 라는 선언
  await dotenv.load(fileName: "assets/.env");
  // BusStation().loadStation();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const StartPage();
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BusStationProvider(),
          )
        ],
      ),
    );
  }
}
