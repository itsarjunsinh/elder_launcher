import 'dart:typed_data';
import 'package:flutter/foundation.dart';

/// Data class used for storing app or contact info.
@immutable
class Item {
  /// App package name or Phone number
  final String id;

  final String name;
  final Uint8List? icon;

  const Item(this.id, this.name, this.icon);

  @override
  // ignore: type_annotate_public_apis, avoid_renaming_method_parameters
  bool operator ==(Object o) => o is Item && o.id.compareTo(id) == 0;

  @override
  int get hashCode => id.hashCode;
}
