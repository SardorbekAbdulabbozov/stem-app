class AllSubjectsResponse {
  AllSubjectsResponse({
    this.subjectNameUz,
    this.subjectNameEn,
    this.subjectLogo,
    this.topicCount,
    this.id,
  });

  AllSubjectsResponse.fromJson(dynamic json) {
    subjectNameEn = json['subjectNameEn'];
    subjectNameUz = json['subjectNameUz'];
    subjectLogo = json['subjectLogo'];
    topicCount = json['topicCount'];
    id = json['id'];
  }

  String? subjectNameUz;
  String? subjectNameEn;
  String? subjectLogo;
  int? topicCount;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subjectNameEn'] = subjectNameEn;
    map['subjectNameUz'] = subjectNameUz;
    map['subjectLogo'] = subjectLogo;
    map['topicCount'] = topicCount;
    map['id'] = id;
    return map;
  }
}
