class User {
  int booksFine;
  String sId;
  String name;
  String lastname;
  String email;
  int phone;
  String roll;

  User(
      {this.booksFine,
      this.sId,
      this.name,
      this.lastname,
      this.email,
      this.phone,
      this.roll,});

  User.fromJson(Map<String, dynamic> json) {
    booksFine = json['booksFine'];
    sId = json['_id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    roll = json['roll'];;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['booksFine'] = this.booksFine;
  //   data['_id'] = this.sId;
  //   data['name'] = this.name;
  //   data['lastname'] = this.lastname;
  //   data['email'] = this.email;
  //   data['phone'] = this.phone;
  //   data['roll'] = this.roll;
  //   data['password'] = this.password;
  //   return data;
  // }
}