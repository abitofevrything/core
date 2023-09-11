import 'package:mineral/api/server/resources/permission.dart';

class PermissionsOverwrite {
  final String id;
  final PermissionType type;
  final List<Permission> allow;
  final List<Permission> deny;

  PermissionsOverwrite({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.value,
    'allow': allow.map((e) => e.value).toList(),
    'deny': deny.map((e) => e.value).toList(),
  };
}

enum PermissionType {
  role(0),
  member(1);

  final int value;
  const PermissionType(this.value);
}