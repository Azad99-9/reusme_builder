class UserDetails {
  Map<String, dynamic> personalDetails;
  Map<String, dynamic>? educationDetails;
  Map<String, dynamic>? professionalDetails;
  Map<String, dynamic>? AchievementDetails;

  UserDetails({
    required this.personalDetails,
    this.educationDetails,
    this.professionalDetails,
    this.AchievementDetails,
  });

  @override
  String toString () {
    return "${personalDetails.toString()}, ${educationDetails.toString()}, ${professionalDetails.toString()}, ${AchievementDetails.toString()},";
  }
}
