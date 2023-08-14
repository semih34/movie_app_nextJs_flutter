import '../network/network_constant.dart';

extension StringExtension on String {
  String toImageUrl() {
    return '${NetworkContant.imageUrl}$this';
  }
}
