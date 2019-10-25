/// {
///  "HeWeather6": [
///    {
///      "basic": {
///        "cid": "CN101010100",
///        "location": "北京",
///        "parent_city": "北京",
///        "admin_area": "北京",
///        "cnty": "中国",
///        "lat": "39.90498734",
///        "lon": "116.4052887",
///        "tz": "+8.00"
///      },
///      "update": {
///        "loc": "2019-09-17 16:54",
///        "utc": "2019-09-17 08:54"
///      },
///      "status": "ok",
///      "now": {
///        "cloud": "91",
///        "cond_code": "101",
///        "cond_txt": "多云",
///        "fl": "27",
///        "hum": "56",
///        "pcpn": "0.0",
///        "pres": "1011",
///        "tmp": "26",
///        "vis": "8",
///        "wind_deg": "188",
///        "wind_dir": "南风",
///        "wind_sc": "2",
///        "wind_spd": "7"
///      }
///    }
///  ]
///}
class Weather {
  List<HeWeather6> heWeather6;

  Weather({this.heWeather6});

  Weather.fromJson(Map<String, dynamic> json) {
    if (json['HeWeather6'] != null) {
      heWeather6 = new List<HeWeather6>();
      json['HeWeather6'].forEach((v) {
        heWeather6.add(new HeWeather6.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.heWeather6 != null) {
      data['HeWeather6'] = this.heWeather6.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HeWeather6 {
  Basic basic;
  Update update;
  String status;
  Now now;

  HeWeather6({this.basic, this.update, this.status, this.now});

  HeWeather6.fromJson(Map<String, dynamic> json) {
    basic = json['basic'] != null ? new Basic.fromJson(json['basic']) : null;
    update =
    json['update'] != null ? new Update.fromJson(json['update']) : null;
    status = json['status'];
    now = json['now'] != null ? new Now.fromJson(json['now']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.basic != null) {
      data['basic'] = this.basic.toJson();
    }
    if (this.update != null) {
      data['update'] = this.update.toJson();
    }
    data['status'] = this.status;
    if (this.now != null) {
      data['now'] = this.now.toJson();
    }
    return data;
  }
}

// 基础信息
class Basic {
  String cid;
  String location;
  String parentCity;
  String adminArea;
  String cnty;
  String lat;
  String lon;
  String tz;

  Basic(
      {this.cid,
        this.location,
        this.parentCity,
        this.adminArea,
        this.cnty,
        this.lat,
        this.lon,
        this.tz});

  Basic.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    location = json['location'];
    parentCity = json['parent_city'];
    adminArea = json['admin_area'];
    cnty = json['cnty'];
    lat = json['lat'];
    lon = json['lon'];
    tz = json['tz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['location'] = this.location;
    data['parent_city'] = this.parentCity;
    data['admin_area'] = this.adminArea;
    data['cnty'] = this.cnty;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['tz'] = this.tz;
    return data;
  }
}

// 更新时间
class Update {
  String loc;
  String utc;

  Update({this.loc, this.utc});

  Update.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    utc = json['utc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loc'] = this.loc;
    data['utc'] = this.utc;
    return data;
  }
}

// 实况天气
class Now {
  String cloud;
  String condCode;
  String condTxt;
  String fl;
  String hum;
  String pcpn;
  String pres;
  String tmp;
  String vis;
  String windDeg;
  String windDir;
  String windSc;
  String windSpd;

  Now(
      {this.cloud,
        this.condCode,
        this.condTxt,
        this.fl,
        this.hum,
        this.pcpn,
        this.pres,
        this.tmp,
        this.vis,
        this.windDeg,
        this.windDir,
        this.windSc,
        this.windSpd});

  Now.fromJson(Map<String, dynamic> json) {
    cloud = json['cloud'];
    condCode = json['cond_code'];
    condTxt = json['cond_txt'];
    fl = json['fl'];
    hum = json['hum'];
    pcpn = json['pcpn'];
    pres = json['pres'];
    tmp = json['tmp'];
    vis = json['vis'];
    windDeg = json['wind_deg'];
    windDir = json['wind_dir'];
    windSc = json['wind_sc'];
    windSpd = json['wind_spd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloud'] = this.cloud;
    data['cond_code'] = this.condCode;
    data['cond_txt'] = this.condTxt;
    data['fl'] = this.fl;
    data['hum'] = this.hum;
    data['pcpn'] = this.pcpn;
    data['pres'] = this.pres;
    data['tmp'] = this.tmp;
    data['vis'] = this.vis;
    data['wind_deg'] = this.windDeg;
    data['wind_dir'] = this.windDir;
    data['wind_sc'] = this.windSc;
    data['wind_spd'] = this.windSpd;
    return data;
  }
}
