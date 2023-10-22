final String tableingredient = 'ingredient';
class IngredientFields {
  List<String> values = [
    /// ajou fichier
    iding, name, kcal, EM, MS, PB, MG,MM,Lys,Met,Cys,Thr,Trp,Ca,PNP,Na,Phyt,Goss,Tan
  ];
  static String iding ='iding';
  static String name='name';
  static String kcal='kcal';
  static String EM='EM';
  static String MS='MS';
  static String PB='PB';
  static String MG='MG';
  static String MM='MM';
  static String Lys='Lys';
  static String Met='Met';
  static String Cys='Cys';
  static String Thr='Thr';
  static String Trp='Trp';
  static String Ca='Ca';
  static String PNP='PNP';
  static String Na='Na';
  static String Phyt='Phyt';
  static String Goss='Goss';
  static String Tan='Tan';

}
class Ingredient {
  final int? iding;
  final String name;
  final double kcal;
  final double EM;
  final double MS;
  final double PB;
  final double MG;
  final double MM;
  final double Lys;
  final double Met;
  final double Cys;
  final double Thr;
  final double Trp;
  final double Ca;
  final double PNP;
  final double Na;
  final double Phyt;
  final double Goss;
  final double Tan;

  const Ingredient({
  this.iding,
  required this.name,
  required this.kcal,
  required this.EM,
  required this.MS,
  required this.PB,
  required this.MG,
  required this.MM,
  required this.Lys,
  required this.Met,
  required this.Cys,
  required this.Thr,
  required this.Trp,
  required this.Ca,
  required this.PNP,
  required this.Na,
  required this.Phyt,
  required this.Goss,
  required this.Tan,

});
  Ingredient copy({
    int? iding,
    String? name,
    double? kcal,
    double? EM,
    double? MS,
    double? PB,
    double? MG,
    double? MM,
    double? Lys,
    double? Met,
    double? Cys,
    double? Thr,
    double? Trp,
    double? Ca,
    double? PNP,
    double? Na,
    double? Phyt,
    double? Goss,
    double? Tan,
})=>Ingredient(
      iding: iding?? this.iding,
      name: name?? this.name,
      kcal: kcal ?? this.kcal,
      EM: EM ?? this.EM,
      MS: MS ?? this.MS,
      PB: PB ?? this.PB,
      MG: MG ?? this.MG,
      MM: MM ?? this.MM,
      Lys: Lys ?? this.Lys,
      Met: Met ?? this.Met,
      Cys: Cys ?? this.Cys,
      Thr: Thr ?? this.Thr,
      Trp: Trp ?? this.Trp,
      Ca: Ca ?? this.Ca,
      PNP: PNP ?? this.PNP,
      Na: Na ?? this.Na,
      Phyt: Phyt ?? this.Phyt,
      Goss: Goss ?? this.Goss,
      Tan: Tan ?? this.Tan
  );
  static Ingredient fromJson(Map<String, Object?> json) => Ingredient(
  iding: json[IngredientFields.iding] as int?,
  name: json[IngredientFields.name] as String,
  kcal: json[IngredientFields.kcal] as double,
  EM: json[IngredientFields.EM] as double,
  MS: json[IngredientFields.MS] as double,
  PB: json[IngredientFields.PB] as double,
  MG: json[IngredientFields.MG] as double,
  MM: json[IngredientFields.MM] as double,
  Lys: json[IngredientFields.Lys] as double,
  Met: json[IngredientFields.Met] as double,
  Cys: json[IngredientFields.Cys] as double,
  Thr: json[IngredientFields.Thr] as double,
  Trp: json[IngredientFields.Trp] as double,
  Ca: json[IngredientFields.Ca] as double,
  PNP: json[IngredientFields.PNP] as double,
  Na: json[IngredientFields.Na] as double,
  Phyt: json[IngredientFields.Phyt] as double,
  Goss: json[IngredientFields.Goss] as double,
  Tan: json[IngredientFields.Tan] as double,
  );
  Map<String, Object?> toJson() => {
    IngredientFields.iding: iding,
  IngredientFields.name:name ,
  IngredientFields.kcal:kcal ,
  IngredientFields.EM:EM ,
  IngredientFields.MS:MS ,
  IngredientFields.PB:PB ,
  IngredientFields.MG:MG ,
  IngredientFields.MM:MM ,
  IngredientFields.Lys:Lys ,
  IngredientFields.Met:Met ,
  IngredientFields.Cys:Cys ,
  IngredientFields.Thr:Thr ,
  IngredientFields.Trp:Trp ,
  IngredientFields.Ca:Ca ,
  IngredientFields.PNP:PNP ,
  IngredientFields.Na:Na ,
  IngredientFields.Phyt:Phyt ,
  IngredientFields.Goss:Goss ,
  IngredientFields.Tan:Tan ,

  };
}
