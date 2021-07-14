
import 'dart:math';

extension ListExtensions<T> on List<T> {
  T random() {
    var index = Random().nextInt(this.length);
    return this[index];
  }
}