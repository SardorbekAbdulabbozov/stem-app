class AllSubjectsResponse {
  AllSubjectsResponse({
    this.subjectNameEn,
    this.subjectLogo,
    this.topicCount,
  });

  AllSubjectsResponse.fromJson(dynamic json) {
    subjectNameEn = json['subjectNameEn'];
    subjectLogo = json['subjectLogo'];
    topicCount = json['topicCount'];
  }

  String? subjectNameEn;
  String? subjectLogo;
  int? topicCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subjectNameEn'] = subjectNameEn;
    map['subjectLogo'] = subjectLogo;
    map['topicCount'] = topicCount;
    return map;
  }
}
