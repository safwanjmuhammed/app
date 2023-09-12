class HomeWifi {
  String? sId;
  String? createdAt;
  String? exposure;
  String? model;
  String? name;
  List<Sensors>? sensors;
  String? updatedAt;
  CurrentLocation? currentLocation;
  List<String>? grouptag;

  HomeWifi(
      {this.sId,
      this.createdAt,
      this.exposure,
      this.model,
      this.name,
      this.sensors,
      this.updatedAt,
      this.currentLocation,
      this.grouptag});

  HomeWifi.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdAt = json['createdAt'];
    exposure = json['exposure'];
    model = json['model'];
    name = json['name'];
    if (json['sensors'] != null) {
      sensors = <Sensors>[];
      json['sensors'].forEach((v) {
        sensors!.add(new Sensors.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
    currentLocation = json['currentLocation'] != null
        ? new CurrentLocation.fromJson(json['currentLocation'])
        : null;
    grouptag = json['grouptag'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['exposure'] = this.exposure;
    data['model'] = this.model;
    data['name'] = this.name;
    if (this.sensors != null) {
      data['sensors'] = this.sensors!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = this.updatedAt;
    if (this.currentLocation != null) {
      data['currentLocation'] = this.currentLocation!.toJson();
    }
    data['grouptag'] = this.grouptag;
    return data;
  }
}

class Sensors {
  String? sId;
  String? lastMeasurement;
  String? sensorType;
  String? title;
  String? unit;
  String? icon;

  Sensors(
      {this.sId,
      this.lastMeasurement,
      this.sensorType,
      this.title,
      this.unit,
      this.icon});

  Sensors.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lastMeasurement = json['lastMeasurement'];
    sensorType = json['sensorType'];
    title = json['title'];
    unit = json['unit'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lastMeasurement'] = this.lastMeasurement;
    data['sensorType'] = this.sensorType;
    data['title'] = this.title;
    data['unit'] = this.unit;
    data['icon'] = this.icon;
    return data;
  }
}

class CurrentLocation {
  List<double>? coordinates;
  String? type;
  String? timestamp;

  CurrentLocation({this.coordinates, this.type, this.timestamp});

  CurrentLocation.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
