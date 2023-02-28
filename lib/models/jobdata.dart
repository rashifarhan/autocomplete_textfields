import 'dart:convert';

JobData jobDataFromJson(String str) => JobData.fromJson(json.decode(str));

String jobDataToJson(JobData data) => json.encode(data.toJson());

class JobData {
  JobData({
    required this.jobdesignations,
  });

  List<Jobdesignation> jobdesignations;

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
        jobdesignations: List<Jobdesignation>.from(
            json["jobdesignations"].map((x) => Jobdesignation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jobdesignations":
            List<dynamic>.from(jobdesignations.map((x) => x.toJson())),
      };
}

class Jobdesignation {
  Jobdesignation({
    required this.designationId,
    required this.designation,
    this.roleId,
  });

  int designationId;
  String designation;
  dynamic roleId;

  factory Jobdesignation.fromJson(Map<String, dynamic> json) => Jobdesignation(
        designationId: json["designation_id"],
        designation: json["designation"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "designation_id": designationId,
        "designation": designation,
        "role_id": roleId,
      };
}
