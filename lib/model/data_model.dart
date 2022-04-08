class Data{
  Data({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    required this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    required this.age,
  });
  final Name name;
  final Images images;
  final String gender;
  final String species;
  final String homePlanet;
  final String occupation;
  final List<String> sayings;
  final int id;
  final String age;

  factory Data.fromJson(Map<String, dynamic> json){
    final name = Name.fromJson(json['name']);
    final images = Images.fromJson(json['images']);
    final gender = json['gender'] as String;
    final species = json['species'] as String;
    final homePlanet = json['homePlanet'] as String;
    final occupation = json['occupation'] as String;
    final sayings = List<String>.from(json["sayings"].map((x) => x));
    final id = json['id'] as int;
    final age = json['age'] as String;
    return Data(name: name, images: images, gender: gender, species: species,
        homePlanet: homePlanet, occupation: occupation, sayings: sayings, id: id, age: age);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['images'] = images;
    _data['gender'] = gender;
    _data['species'] = species;
    _data['homePlanet'] = homePlanet;
    _data['occupation'] = occupation;
    _data['sayings'] = sayings;
    _data['id'] = id;
    _data['age'] = age;
    return _data;
  }
}

class Name {
  Name(
    this.first,
    this.middle,
    this.last,
  );
  final String first;
  final String middle;
  final String last;

  factory Name.fromJson(Map<String, dynamic> json){
    final first = json['first'] as String;
    final middle = json['middle'] as String;
    final last = json['last'] as String;
    return Name( first,  middle,  last);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first'] = first;
    _data['middle'] = middle;
    _data['last'] = last;
    return _data;
  }
}

class Images {
  final String headshot;
  final String main;

  Images(this.headshot, this.main);

  factory Images.fromJson(Map<String, dynamic> json){
    final headshot = json['head-shot'] as String;
    final main = json['main'] as String;
    return Images( headshot, main);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['head-shot'] = headshot;
    _data['main'] = main;
    return _data;
  }

}