import 'package:DungxApp/translations/en.dart';
import 'package:DungxApp/translations/vi.dart';
import 'package:get/route_manager.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'vi_VN': vi};
}
