// To parse this JSON data, do
//
//     final getDateTime = getDateTimeFromJson(jsonString);

import 'dart:convert';

GetDateTime getDateTimeFromJson(String str) => GetDateTime.fromJson(json.decode(str));

String getDateTimeToJson(GetDateTime data) => json.encode(data.toJson());

class GetDateTime {
    GetDateTime({
        required this.datetime,
    });

    DateTime datetime;

    factory GetDateTime.fromJson(Map<String, dynamic> json) => GetDateTime(
        datetime: DateTime.parse(json["datetime"]),
    );

    Map<String, dynamic> toJson() => {
        "datetime": datetime.toIso8601String(),
    };
}
