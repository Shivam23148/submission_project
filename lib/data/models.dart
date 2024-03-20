class Country {
  final Name name;
  final Flags flags;

  Country({
    required this.name,
    required this.flags,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: Name.fromJson(json['name']),
      flags: Flags.fromJson(json['flags']),
    );
  }
}

class Name {
  final String common;

  Name({
    required this.common,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
    );
  }
}

class Flags {
  final String png;
  // You can include 'svg' and 'alt' if needed

  Flags({
    required this.png,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      png: json['png'],
    );
  }
}
