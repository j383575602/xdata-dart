
import 'XType.dart';
final XBaseRecord =  XBaseRecordDSL();
class XBaseRecordDSL {
  final int TYPE_INDEX = XType.TYPE_BASS_RECORD;
  final int ID = 1 | XType.TYPE_BYTE_i_4;
  final int STATUS = 2 | XType.TYPE_BYTE_i_1;
  final int ADD_VERSION = 3 | XType.TYPE_BYTE_i_2;
  final int VERSION = 4 | XType.TYPE_BYTE_i_2;
}