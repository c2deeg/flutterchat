class ModelNotifications {
  List<Result>? result;
  String? error;

  ModelNotifications({this.result, this.error});

  ModelNotifications.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class Result {
  int? id;
  String? title;
  String? notes;
  String? createdat;
  String? createby;
  bool? isread;
  bool? isseen;

  Result(
      {this.id,
      this.title,
      this.notes,
      this.createdat,
      this.createby,
      this.isread,
      this.isseen});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    notes = json['notes'];
    createdat = json['createdat'];
    createby = json['createby'];
    isread = json['isread'];
    isseen = json['isseen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['notes'] = notes;
    data['createdat'] = createdat;
    data['createby'] = createby;
    data['isread'] = isread;
    data['isseen'] = isseen;
    return data;
  }
}
