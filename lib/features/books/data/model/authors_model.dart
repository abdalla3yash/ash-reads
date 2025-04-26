
class Authors {
  String? name;
  int? birthYear;
  int? deathYear;

  Authors({this.name, this.birthYear, this.deathYear});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthYear = json['birth_year'];
    deathYear = json['death_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['birth_year'] = birthYear;
    data['death_year'] = deathYear;
    return data;
  }
   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birth_year': birthYear,
      'death_year':deathYear
    };
  }

  factory Authors.fromMap(Map<String, dynamic> map) {
    return Authors(
      name: map['name'],
      birthYear: map['birth_year'],
      deathYear: map['death_year'],
    );
  }
}

