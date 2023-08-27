// To parse this JSON data, do
//
//     final homeWifi = homeWifiFromJson(jsonString);

import 'dart:convert';

List<HomeWifi> homeWifiFromJson(String str) =>
    List<HomeWifi>.from(json.decode(str).map((x) => HomeWifi.fromJson(x)));

String homeWifiToJson(List<HomeWifi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeWifi {
  String id;
  DateTime createdAt;
  Exposure exposure;
  Model model;
  String name;
  List<Sensor> sensors;
  DateTime updatedAt;
  CurrentLocation currentLocation;
  List<String>? grouptag;
  String? description;
  DateTime? lastMeasurementAt;
  String? weblink;
  String? image;

  HomeWifi({
    required this.id,
    required this.createdAt,
    required this.exposure,
    required this.model,
    required this.name,
    required this.sensors,
    required this.updatedAt,
    required this.currentLocation,
    this.grouptag,
    this.description,
    this.lastMeasurementAt,
    this.weblink,
    this.image,
  });

  factory HomeWifi.fromJson(Map<String, dynamic> json) => HomeWifi(
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        exposure: exposureValues.map[json["exposure"]]!,
        model: modelValues.map[json["model"]]!,
        name: json["name"],
        sensors:
            List<Sensor>.from(json["sensors"].map((x) => Sensor.fromJson(x))),
        updatedAt: DateTime.parse(json["updatedAt"]),
        currentLocation: CurrentLocation.fromJson(json["currentLocation"]),
        grouptag: json["grouptag"] == null
            ? []
            : List<String>.from(json["grouptag"]!.map((x) => x)),
        description: json["description"],
        lastMeasurementAt: json["lastMeasurementAt"] == null
            ? null
            : DateTime.parse(json["lastMeasurementAt"]),
        weblink: json["weblink"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "exposure": exposureValues.reverse[exposure],
        "model": modelValues.reverse[model],
        "name": name,
        "sensors": List<dynamic>.from(sensors.map((x) => x.toJson())),
        "updatedAt": updatedAt.toIso8601String(),
        "currentLocation": currentLocation.toJson(),
        "grouptag":
            grouptag == null ? [] : List<dynamic>.from(grouptag!.map((x) => x)),
        "description": description,
        "lastMeasurementAt": lastMeasurementAt?.toIso8601String(),
        "weblink": weblink,
        "image": image,
      };
}

class CurrentLocation {
  List<double> coordinates;
  Type type;
  DateTime timestamp;

  CurrentLocation({
    required this.coordinates,
    required this.type,
    required this.timestamp,
  });

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      CurrentLocation(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: typeValues.map[json["type"]]!,
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": typeValues.reverse[type],
        "timestamp": timestamp.toIso8601String(),
      };
}

enum Type { POINT }

final typeValues = EnumValues({"Point": Type.POINT});

enum Exposure { INDOOR, MOBILE, OUTDOOR }

final exposureValues = EnumValues({
  "indoor": Exposure.INDOOR,
  "mobile": Exposure.MOBILE,
  "outdoor": Exposure.OUTDOOR
});

enum Model { HOME_WIFI }

final modelValues = EnumValues({"homeWifi": Model.HOME_WIFI});

class Sensor {
  String id;
  String? lastMeasurement;
  String sensorType;
  String title;
  String unit;
  Icon? icon;

  Sensor({
    required this.id,
    this.lastMeasurement,
    required this.sensorType,
    required this.title,
    required this.unit,
    this.icon,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        id: json["_id"],
        lastMeasurement: json["lastMeasurement"],
        sensorType: json["sensorType"],
        title: json["title"],
        unit: json["unit"],
        icon: iconValues.map[json["icon"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "lastMeasurement": lastMeasurement,
        "sensorType": sensorType,
        "title": title,
        "unit": unit,
        "icon": iconValues.reverse[icon],
      };
}

enum Icon {
  OSEM_BAROMETER,
  OSEM_BATTERY,
  OSEM_BRIGHTNESS,
  OSEM_CLOUD,
  OSEM_CO2,
  OSEM_DASHBOARD,
  OSEM_GAUGE,
  OSEM_HUMIDITY,
  OSEM_MICROPHONE,
  OSEM_MOISTURE,
  OSEM_NOT_AVAILABLE,
  OSEM_PARTICULATE_MATTER,
  OSEM_RADIOACTIVE,
  OSEM_TEMPERATURE_CELSIUS,
  OSEM_THERMOMETER,
  OSEM_UMBERELLA,
  OSEM_UMBRELLA,
  OSEM_VOLUME_UP,
  OSEM_WIFI,
  OSEM_WINDSPEED
}

final iconValues = EnumValues({
  "osem-barometer": Icon.OSEM_BAROMETER,
  "osem-battery": Icon.OSEM_BATTERY,
  "osem-brightness": Icon.OSEM_BRIGHTNESS,
  "osem-cloud": Icon.OSEM_CLOUD,
  "osem-co2": Icon.OSEM_CO2,
  "osem-dashboard": Icon.OSEM_DASHBOARD,
  "osem-gauge": Icon.OSEM_GAUGE,
  "osem-humidity": Icon.OSEM_HUMIDITY,
  "osem-microphone": Icon.OSEM_MICROPHONE,
  "osem-moisture": Icon.OSEM_MOISTURE,
  "osem-not-available": Icon.OSEM_NOT_AVAILABLE,
  "osem-particulate-matter": Icon.OSEM_PARTICULATE_MATTER,
  "osem-radioactive": Icon.OSEM_RADIOACTIVE,
  "osem-temperature-celsius": Icon.OSEM_TEMPERATURE_CELSIUS,
  "osem-thermometer": Icon.OSEM_THERMOMETER,
  "osem-umberella": Icon.OSEM_UMBERELLA,
  "osem-umbrella": Icon.OSEM_UMBRELLA,
  "osem-volume-up": Icon.OSEM_VOLUME_UP,
  "osem-wifi": Icon.OSEM_WIFI,
  "osem-windspeed": Icon.OSEM_WINDSPEED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
