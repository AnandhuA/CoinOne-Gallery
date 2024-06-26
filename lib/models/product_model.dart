class ProductModel {
  String id;
  String name;
  String code;
  String orderIndex;
  String imgUrl;
  String imgUrlPath;
  String parentId;
  String parent;
  String ttype;
  String remarks;
  bool active;
  String companyId;
  String branchId;
  String faId;
  String userId;
  String updateDate;
  bool isDelete;

  ProductModel({
    required this.id,
    required this.name,
    required this.code,
    required this.orderIndex,
    required this.imgUrl,
    required this.imgUrlPath,
    required this.parentId,
    required this.parent,
    required this.ttype,
    required this.remarks,
    required this.active,
    required this.companyId,
    required this.branchId,
    required this.faId,
    required this.userId,
    required this.updateDate,
    required this.isDelete,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['Id'] as String,
      name: json['Name'] as String,
      code: json['Code'] as String,
      orderIndex: json['OrderIndex'] as String,
      imgUrl: json['ImgUrl'] as String,
      imgUrlPath: json['ImgUrlPath'] as String,
      parentId: json['ParentId'] as String,
      parent: json['Parent'] as String,
      ttype: json['TType'] as String,
      remarks: json['Remarks'] as String,
      active: json['Active'] == 'True',
      companyId: json['CompanyId'] as String,
      branchId: json['BranchId'] as String,
      faId: json['FaId'] as String,
      userId: json['UserId'] as String,
      updateDate: json['UpdateDate'] as String,
      isDelete: json['IsDelete'] == 'False',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Code': code,
      'OrderIndex': orderIndex,
      'ImgUrl': imgUrl,
      'ImgUrlPath': imgUrlPath,
      'ParentId': parentId,
      'Parent': parent,
      'TType': ttype,
      'Remarks': remarks,
      'Active': active ? 'True' : 'False',
      'CompanyId': companyId,
      'BranchId': branchId,
      'FaId': faId,
      'UserId': userId,
      'UpdateDate': updateDate.toString(),
      'IsDelete': isDelete ? 'False' : 'True',
    };
  }
}
