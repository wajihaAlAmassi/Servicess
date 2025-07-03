enum UserType { provider, requester }
enum EntityType { solo, company }

class UserModel {
  // النوع الأساسي
  final UserType userType;
  final EntityType entityType;

  // مشترك بين الجميع
  final String name;
  final String email;
  final String phone;

  // خاص بالشركات فقط
  final String? companyName;
  final String? companyIndustry;
  final String? establishmentYear;

  // خاص بمزود الخدمة (solo)
  final String? serviceCategory; // التخصص أو المهارات

  // خاص بطالب الخدمة (solo)
  final String? requestNeeds; // المجالات اللي بيطلبها

  UserModel({
    required this.userType,
    required this.entityType,
    required this.name,
    required this.email,
    required this.phone,
    this.companyName,
    this.companyIndustry,
    this.establishmentYear,
    this.serviceCategory,
    this.requestNeeds,
  });

  // لتحويل من JSON (لو جاي من الباكند)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userType: json['user_type'] == 'provider' ? UserType.provider : UserType.requester,
      entityType: json['entity_type'] == 'solo' ? EntityType.solo : EntityType.company,
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      companyName: json['company_name'],
      companyIndustry: json['company_Industry'],
      establishmentYear: json['establishment_year'],
      serviceCategory: json['service_category'],
      requestNeeds: json['request_needs'],
    );
  }

  // لتحويل إلى JSON (لو بدك تبعتيه للباكند)
  Map<String, dynamic> toJson() {
    return {
      'user_type': userType == UserType.provider ? 'provider' : 'requester',
      'entity_type': entityType == EntityType.solo ? 'solo' : 'company',
      'name': name,
      'email': email,
      'phone': phone,
      'company_name': companyName,
      'company_Industry': companyIndustry,
      'establishment_year': establishmentYear,
      'service_category': serviceCategory,
      'request_needs': requestNeeds,
    };
  }
}
