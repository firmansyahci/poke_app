// To parse this JSON data, do
//
//     final resource = resourceFromJson(jsonString);

import 'dart:convert';

Resource resourceFromJson(String str) => Resource.fromJson(json.decode(str));

String resourceToJson(Resource data) => json.encode(data.toJson());

class Resource {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;

  Resource({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  final String? name;
  final String? url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
