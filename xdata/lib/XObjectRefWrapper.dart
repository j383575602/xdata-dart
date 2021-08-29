
import 'package:xdata/xdata.dart';
class XObjectRefWrapper extends XBaseRecordWrapper {
  XObjectRefWrapper.withData(XData data) : super.withData(data);
  XObjectRefWrapper.withType(int type) : super.withType(type);
  XObjectRefWrapper():super.withType(XObjectRef.TYPE_INDEX);

  int get OWNER_ID{
    return super.get(XObjectRef.OWNER_ID);
  }
  set OWNER_ID(int ownerId) {
    super.set(XObjectRef.OWNER_ID, ownerId);
  }

  int get OWNER_TYPE{
    return super.get(XObjectRef.OWNER_TYPE);
  }
  set OWNER_TYPE(int ownerType) {
    super.set(XObjectRef.OWNER_TYPE, ownerType);
  }

  int get OWNER_PROP{
    return super.get(XObjectRef.OWNER_PROP);
  }
  set OWNER_PROP(int ownerProp) {
    super.set(XObjectRef.OWNER_PROP, ownerProp);
  }

  int get REF_TYPE{
    return super.get(XObjectRef.REF_TYPE);
  }
  set REF_TYPE(int refType) {
    super.set(XObjectRef.REF_TYPE, refType);
  }

  int get REF_ID{
    return super.get(XObjectRef.REF_ID);
  }
  set REF_ID(int refId) {
    super.set(XObjectRef.REF_ID, refId);
  }
}