class User{
  static const String namekey = "user_name";
  static const String arraykey = "user_array";

  String? name;
  List? array;

  User({
    this.name,
    this.array
});

  factory User.fromjson(Map<dynamic, dynamic> json) => User(
    name: json[namekey],
    array: json[arraykey],
  );

  Map<String, dynamic> tojson()=>{
    namekey: name,
    arraykey: array,
  };
}