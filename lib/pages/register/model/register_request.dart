class FeedbackForm {
  String? firstName;
  String? lastName;
  String? address;
  String? area;
  String? landline;
  String? mobileNo;
  String? frontImage;
  String? backImage;

  FeedbackForm(this.firstName, this.lastName, this.address,this.area, this.landline,this.mobileNo,this.frontImage,this.backImage);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['firstName']}", "${json['lastName']}",
        "${json['address']}", "${json['area']}", "${json['landLine']}", "${json['mobile']}", "${json['frontImage']}", "${json['backImage']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'address': address,
    'area': area,
    'landLine': landline,
    'mobile': mobileNo,
    'frontImage': frontImage,
    'backImage': backImage,
  };
}