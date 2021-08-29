
import 'package:xdata/XBaseRecord.dart';

import 'XType.dart';
final XObjectRef =  XObjectRefDSL();
class XObjectRefDSL extends XBaseRecordDSL {
  final int TYPE_INDEX = XType.TYPE_OBJECT_REF;
  /**
   * 引用关系的所有者
   */
  final int OWNER_ID   = 5 | XType.TYPE_BYTE_i_4;
  /**
   * 所有者的类型，在查询有个所有者持有其他类的引用时的查询条件
   */
  final int OWNER_TYPE = 6 | XType.TYPE_BYTE_i_4;
  /**
   * 所有者的哪一个属性上的引用
   */
  final int OWNER_PROP = 7 | XType.TYPE_BYTE_i_4;
  /**
   * 被应用对象的类型
   */
  final int REF_TYPE   = 8 | XType.TYPE_BYTE_i_4;
  /**
   * 被引用对象的ID
   */
  final int REF_ID     = 9 | XType.TYPE_BYTE_i_4;
}