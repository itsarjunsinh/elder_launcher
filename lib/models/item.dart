// Generic Data Item class. Used for storing contact and app info.

import 'dart:typed_data';
import 'package:flutter/foundation.dart';

@immutable
class Item {
  final String id; // Stores Application package name or Phone number
  final String name;
  final Uint8List icon;

  const Item(this.id, this.name, this.icon);

  @override
  bool operator ==(o) => o is Item && o.id.compareTo(id) == 0;

  @override
  int get hashCode => id.hashCode;
}
