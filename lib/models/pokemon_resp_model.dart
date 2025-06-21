

class PokemonRespModel {
  List<PokemonData>? data;
  int? page;
  int? pageSize;
  int? count;
  int? totalCount;

  PokemonRespModel({
    this.data,
    this.page,
    this.pageSize,
    this.count,
    this.totalCount,
  });

  factory PokemonRespModel.fromMap(Map<String, dynamic> json) => PokemonRespModel(
    data: json["data"] == null ? [] : List<PokemonData>.from(json["data"]!.map((x) => PokemonData.fromMap(x))),
    page: json["page"],
    pageSize: json["pageSize"],
    count: json["count"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "page": page,
    "pageSize": pageSize,
    "count": count,
    "totalCount": totalCount,
  };
}

class PokemonData {
  String? id;
  String? name;
  String? supertype;
  List<String>? subtypes;
  String? level;
  String? hp;
  List<dynamic>? types;
  String? evolvesFrom;
  List<Ability>? abilities;
  List<Attack>? attacks;
  List<Resistance>? weaknesses;
  List<Resistance>? resistances;
  List<dynamic>? retreatCost;
  int? convertedRetreatCost;
  Set? set;
  String? number;
  String? artist;
  String? rarity;
  String? flavorText;
  List<int>? nationalPokedexNumbers;
  Legalities? legalities;
  DatumImages? images;
  Tcgplayer? tcgplayer;
  Cardmarket? cardmarket;
  List<String>? evolvesTo;
  List<String>? rules;
  String? regulationMark;

  PokemonData({
    this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.level,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.set,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
    this.evolvesTo,
    this.rules,
    this.regulationMark,
  });

  factory PokemonData.fromMap(Map<String, dynamic> json) => PokemonData(
    id: json["id"],
    name: json["name"],
    supertype: json["supertype"]!,
    subtypes: json["subtypes"] == null ? [] : List<String>.from(json["subtypes"]!.map((x) => x)),
    level: json["level"],
    hp: json["hp"],
    types: json["types"],
    evolvesFrom: json["evolvesFrom"],
    abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromMap(x))),
    attacks: json["attacks"] == null ? [] : List<Attack>.from(json["attacks"]!.map((x) => Attack.fromMap(x))),
    weaknesses: json["weaknesses"] == null ? [] : List<Resistance>.from(json["weaknesses"]!.map((x) => Resistance.fromMap(x))),
    resistances: json["resistances"] == null ? [] : List<Resistance>.from(json["resistances"]!.map((x) => Resistance.fromMap(x))),
    retreatCost: json["retreatCost"],
    convertedRetreatCost: json["convertedRetreatCost"],
    set: json["set"] == null ? null : Set.fromMap(json["set"]),
    number: json["number"],
    artist: json["artist"],
    rarity: json["rarity"],
    flavorText: json["flavorText"],
    nationalPokedexNumbers: json["nationalPokedexNumbers"] == null ? [] : List<int>.from(json["nationalPokedexNumbers"]!.map((x) => x)),
    legalities: json["legalities"] == null ? null : Legalities.fromMap(json["legalities"]),
    images: json["images"] == null ? null : DatumImages.fromMap(json["images"]),
    tcgplayer: json["tcgplayer"] == null ? null : Tcgplayer.fromMap(json["tcgplayer"]),
    cardmarket: json["cardmarket"] == null ? null : Cardmarket.fromMap(json["cardmarket"]),
    evolvesTo: json["evolvesTo"] == null ? [] : List<String>.from(json["evolvesTo"]!.map((x) => x)),
    rules: json["rules"] == null ? [] : List<String>.from(json["rules"]!.map((x) => x)),
    regulationMark: json["regulationMark"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "supertype": supertype,
    "subtypes": subtypes == null ? [] : List<dynamic>.from(subtypes!.map((x) => x)),
    "level": level,
    "hp": hp,
    "types": types ,
    "evolvesFrom": evolvesFrom,
    "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toMap())),
    "attacks": attacks == null ? [] : List<dynamic>.from(attacks!.map((x) => x.toMap())),
    "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses!.map((x) => x.toMap())),
    "resistances": resistances == null ? [] : List<dynamic>.from(resistances!.map((x) => x.toMap())),
    "retreatCost": retreatCost ,
    "convertedRetreatCost": convertedRetreatCost,
    "set": set?.toMap(),
    "number": number,
    "artist": artist,
    "rarity": rarity,
    "flavorText": flavorText,
    "nationalPokedexNumbers": nationalPokedexNumbers == null ? [] : List<dynamic>.from(nationalPokedexNumbers!.map((x) => x)),
    "legalities": legalities?.toMap(),
    "images": images?.toMap(),
    "tcgplayer": tcgplayer?.toMap(),
    "cardmarket": cardmarket?.toMap(),
    "evolvesTo": evolvesTo == null ? [] : List<dynamic>.from(evolvesTo!.map((x) => x)),
    "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x)),
    "regulationMark": regulationMark,
  };
}

class Ability {
  String? name;
  String? text;
  String? type;

  Ability({
    this.name,
    this.text,
    this.type,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
    name: json["name"],
    text: json["text"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "text": text,
    "type": type,
  };
}

class Attack {
  String? name;
  List<dynamic>? cost;
  int? convertedEnergyCost;
  String? damage;
  String? text;

  Attack({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  factory Attack.fromMap(Map<String, dynamic> json) => Attack(
    name: json["name"],
    cost: json["cost"],
    convertedEnergyCost: json["convertedEnergyCost"],
    damage: json["damage"],
    text: json["text"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "cost": cost,
    "convertedEnergyCost": convertedEnergyCost,
    "damage": damage,
    "text": text,
  };
}





class Cardmarket {
  String? url;
  String? updatedAt;
  Map<String, double>? prices;

  Cardmarket({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Cardmarket.fromMap(Map<String, dynamic> json) => Cardmarket(
    url: json["url"],
    updatedAt: json["updatedAt"],
    prices: Map.from(json["prices"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "updatedAt": updatedAt,
    "prices": Map.from(prices!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Set {
  String? id;
  String? name;
  String? series;
  int? printedTotal;
  int? total;
  Legalities? legalities;
  String? ptcgoCode;
  String? releaseDate;
  String? updatedAt;
  SetImages? images;

  Set({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });

  factory Set.fromMap(Map<String, dynamic> json) => Set(
    id: json["id"],
    name: json["name"],
    series: json["series"],
    printedTotal: json["printedTotal"],
    total: json["total"],
    legalities: json["legalities"] == null ? null : Legalities.fromMap(json["legalities"]),
    ptcgoCode: json["ptcgoCode"],
    releaseDate: json["releaseDate"],
    updatedAt: json["updatedAt"],
    images: json["images"] == null ? null : SetImages.fromMap(json["images"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "series": series,
    "printedTotal": printedTotal,
    "total": total,
    "legalities": legalities?.toMap(),
    "ptcgoCode": ptcgoCode,
    "releaseDate": releaseDate,
    "updatedAt": updatedAt,
    "images": images?.toMap(),
  };
}

class SetImages {
  String? symbol;
  String? logo;

  SetImages({
    this.symbol,
    this.logo,
  });

  factory SetImages.fromMap(Map<String, dynamic> json) => SetImages(
    symbol: json["symbol"],
    logo: json["logo"],
  );

  Map<String, dynamic> toMap() => {
    "symbol": symbol,
    "logo": logo,
  };
}

class Legalities {
  String? unlimited;
  String? expanded;

  Legalities({
    this.unlimited,
    this.expanded,
  });

  factory Legalities.fromMap(Map<String, dynamic> json) => Legalities(
    unlimited: json["unlimited"],
    expanded: json["expanded"],
  );

  Map<String, dynamic> toMap() => {
    "unlimited": unlimited,
    "expanded": expanded,
  };
}

class DatumImages {
  String? small;
  String? large;

  DatumImages({
    this.small,
    this.large,
  });

  factory DatumImages.fromMap(Map<String, dynamic> json) => DatumImages(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "large": large,
  };
}

class Resistance {
  String? type;
  String? value;

  Resistance({
    this.type,
    this.value,
  });

  factory Resistance.fromMap(Map<String, dynamic> json) => Resistance(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "value": value,
  };
}



class Tcgplayer {
  String? url;
  String? updatedAt;
  Prices? prices;

  Tcgplayer({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Tcgplayer.fromMap(Map<String, dynamic> json) => Tcgplayer(
    url: json["url"],
    updatedAt: json["updatedAt"]!,
    prices: json["prices"] == null ? null : Prices.fromMap(json["prices"]),
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "updatedAt": updatedAt,
    "prices": prices?.toMap(),
  };
}

class Prices {
  Holofoil? holofoil;
  Holofoil? reverseHolofoil;
  Holofoil? normal;

  Prices({
    this.holofoil,
    this.reverseHolofoil,
    this.normal,
  });

  factory Prices.fromMap(Map<String, dynamic> json) => Prices(
    holofoil: json["holofoil"] == null ? null : Holofoil.fromMap(json["holofoil"]),
    reverseHolofoil: json["reverseHolofoil"] == null ? null : Holofoil.fromMap(json["reverseHolofoil"]),
    normal: json["normal"] == null ? null : Holofoil.fromMap(json["normal"]),
  );

  Map<String, dynamic> toMap() => {
    "holofoil": holofoil?.toMap(),
    "reverseHolofoil": reverseHolofoil?.toMap(),
    "normal": normal?.toMap(),
  };
}

class Holofoil {
  double? low;
  double? mid;
  double? high;
  double? market;
  double? directLow;

  Holofoil({
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });

  factory Holofoil.fromMap(Map<String, dynamic> json) => Holofoil(
    low: json["low"]?.toDouble(),
    mid: json["mid"]?.toDouble(),
    high: json["high"]?.toDouble(),
    market: json["market"]?.toDouble(),
    directLow: json["directLow"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "low": low,
    "mid": mid,
    "high": high,
    "market": market,
    "directLow": directLow,
  };
}


