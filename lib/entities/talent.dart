class Talent {
  final String name;
  final String type;
  final String book;
  final String tradition;
  final String description;
  final String novice;
  final String adept;
  final String master;
  final String attribute;
  final String material;
  final String source;

  Talent( this.name, this.type, this.book, this.tradition, this.description, this.novice, this.adept, this.master, this.attribute, this.material, this.source );

  Talent.fromJson(Map<String, dynamic> json)
   : name = json['name'],
    type = json['type'],
    book = json['book'],
    tradition = json['tradition'] ?? '',
    description = json['description'] ?? '',
    novice = json['novice'],
    adept = json['adept'] ?? '',
    master = json['master'] ?? '',
    attribute = json["attribute"] ?? '',
    material = json["material"] ?? '',
    source = json["source"] ?? '';


  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "book": book,
    "tradition": tradition,
    "description": description,
    "novice": novice,
    "adept": adept,
    "master": master,
    "attribute": attribute,
    "materiel": material,
    "source": source,
  };
}
