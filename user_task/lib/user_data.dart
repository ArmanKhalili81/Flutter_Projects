class Userdata {
  String? name;
  String? gmail;
  String? pass;
  
  Userdata(String? name, String? gmail, String? pass) {
    this.name = name;
    this.gmail = gmail;
    this.pass = pass;
  }

  check_information(String email, String password) {
    if (this.gmail == email && this.pass == password) {
      return true;
    } else
      return false;
  }

}
