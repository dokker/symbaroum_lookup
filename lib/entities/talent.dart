class Talent {
  final String name;
  final String type;
  final String book;
  final String? tradition;
  final String? description;
  final String novice;
  final String? adept;
  final String? master;
  final String? attribute;
  final String? material;
  final String? source;

  Talent( this.name, this.type, this.book, this.tradition, this.description, this.novice, this.adept, this.master, this.attribute, this.material, this.source );

  Talent.fromJson(Map<String, dynamic> json)
   : name = json['name'],
    type = json['type'],
    book = json['book'],
    tradition = json['tradition'],
    description = json['description'],
    novice = json['novice'],
    adept = json['adept'],
    master = json['master'],
    attribute = json["attribute"],
    material = json["material"],
    source = json["source"];
}


/*
// From: https://app.quicktype.io/

class Talent {
    Talent({
        this.name,
        this.type,
        this.book,
        this.tradition,
        this.description,
        this.novice,
        this.adept,
        this.master,
        this.attribute,
        this.materiel,
        this.source,
    });

    String name;
    String type;
    String book;
    String tradition;
    String description;
    String novice;
    String adept;
    String master;
    String attribute;
    String materiel;
    String source;

    factory Talent.fromJson(Map<String, dynamic> json) => Talent(
        name: json["name"],
        type: json["type"],
        book: json["book"],
        tradition: json["tradition"] == null ? null : json["tradition"],
        description: json["description"] == null ? null : json["description"],
        novice: json["novice"],
        adept: json["adept"] == null ? null : json["adept"],
        master: json["master"] == null ? null : json["master"],
        attribute: json["attribute"] == null ? null : json["attribute"],
        materiel: json["materiel"] == null ? null : json["materiel"],
        source: json["source"] == null ? null : json["source"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "book": book,
        "tradition": tradition == null ? null : tradition,
        "description": description == null ? null : description,
        "novice": novice,
        "adept": adept == null ? null : adept,
        "master": master == null ? null : master,
        "attribute": attribute == null ? null : attribute,
        "materiel": materiel == null ? null : materiel,
        "source": source == null ? null : source,
    };
}
*/