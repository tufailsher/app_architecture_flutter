class InventoryEntity {
  final String? page;
  final String? rows;
  final String? to;
  final String? field;
  final String? include;

  InventoryEntity({this.page, this.rows, this.to, this.field, this.include});

  Map<String, dynamic> toJson() {
    return {
      'page': page??'2',
      'rows': rows??'10',
      'to': to??'2030-09-04',
      'field': field??'itemType',
      'include': include??'movement',
   
    };
  }
}
