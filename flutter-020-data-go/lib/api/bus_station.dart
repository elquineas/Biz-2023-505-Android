// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:api/models/station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

const OPEN_API_KEY = "OPEN_API_KEY";
const GW_BIS_STOP_XML = "GW_BIS_STOP_XML";
const GW_BIS_STOP = "GW_BIS_STOP";

class BusStation {
  // .env 파일에서 OPEN_API_KEY 값을 가져와서 변수에 저장
  final serviceKey = dotenv.get(OPEN_API_KEY);
  final gwBusStop = dotenv.get(GW_BIS_STOP_XML);

  Future<List<StationDto>?> loadStation() async {
    final gwBusStop = dotenv.get(GW_BIS_STOP);
    final queryString = "$gwBusStop?ServiceKey=$serviceKey";
    try {
      var response = await http.get(Uri.parse(queryString));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        Iterable resultStation =
            await json.decode(response.body)["STATION_LIST"];
        var resultList = resultStation.map((item) => StationDto.fromMap(item));
        return resultList.toList();
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("요청오류 ${e.toString()}");
    }
    return null;
  }

  void loadStationXML() async {
    final gwBusStopXml = dotenv.get(GW_BIS_STOP_XML);
    debugPrint("서비스키 : $serviceKey");
    debugPrint("URL : $gwBusStopXml");

    final queryString = "$gwBusStopXml?ServiceKey=$serviceKey";
    // var response;
    try {
      var response = await http.get(Uri.parse(queryString));
      if (response.statusCode == 200) {
        final xmlBody = response.body;
        final xml = Xml2Json()..parse(xmlBody); // ..() 최종결과를 담아라

        Map<String, dynamic> jsonResult = json.decode(xml.toParker());
        debugPrint("JSON 데이터 : ${jsonResult.toString()}");

        final stationList =
            jsonResult["ns2:sSTATION_INFO"]["STATION_LIST"]["STATION"];
        debugPrint(stationList.toString());
      }
    } catch (e) {
      debugPrint("오류");
    }
  }
}
