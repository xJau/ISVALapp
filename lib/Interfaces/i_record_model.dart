import 'package:isval_test/Models/customer.dart';

abstract class IRecord {
  Map<String, String> getAttributes(CustomerCategory category);
  String getRecordName();
}
