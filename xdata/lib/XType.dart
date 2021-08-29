
/**
 *Created by wlzhao on 2017/2/20.
 *最大类型class数量：0xFFFFFF个，65535*16
 *单个类字段数：0xFF个，255个.已经足够大了
 *支持列表，还保留4个集合类型，9个基础类型
 */
mixin XType {

static const int OBJECT_INDEX_OFFSET  = 15;
/**类掩码*/
static const int MASK_TYPE            = 0xFFFFFF00;
/**索引掩码*/
static const int MASK_INDEX           = 0x000000FF;
/**列表掩码*/
/**集合类型掩码*/
static const int MASK_TYPE_COLLECTION             = 0x00007000;
static const int MASK_TYPE_COLLECTION_LIST        = 0x00001000;
static const int MASK_TYPE_COLLECTION_SET         = 0x00002000;
static const int MASK_TYPE_COLLECTION_INT_MAP     = 0x00003000;
static const int MASK_TYPE_COLLECTION_STRING_MAP  = 0x00004000;
static const int MASK_TYPE_COLLECTION_LONG_MAP    = 0x00005000;
static const int MASK_TYPE_COLLECTION_FLOAT_MAP   = 0x00006000;
static const int MASK_TYPE_COLLECTION_DOUBLE_MAP  = 0x00007000;

/**1bit 整形，对应java boolean*/
static const int TYPE_BOOLEAN         = 0x00000100 ;
/**8bit 整形，对应java byte*/
static const int TYPE_BYTE_i_1        = 0x00000200 ;
/**16bit 整形，对应java short*/
static const int TYPE_BYTE_i_2        = 0x00000300;
/**32bit 整形，对应java integer*/
static const int TYPE_BYTE_i_4        = 0x00000400;
/**64bit 整形，对应java long*/
static const int TYPE_BYTE_i_8        = 0x00000500;
/**32bit 浮点，对应java float*/
static const int TYPE_BYTE_f_4        = 0x00000600;
/**64bit 浮点，对应java double*/
static const int TYPE_BYTE_f_8        = 0x00000700;
/**字符串，对应java String*/
static const int TYPE_STRING          = 0x00000800;
/**二进制数据，对应java byte[]*/
static const int TYPE_BLOB            = 0x00000900;
/**日期*/
static const int TYPE_DATE            = 0x00000A00;
/**预留*/
static const int TYPE_UNKNOWN_1       = 0x00000B00;
/**预留*/
static const int TYPE_UNKNOWN_2       = 0x00000C00;
/**预留*/
static const int TYPE_UNKNOWN_3       = 0x00000D00;
/**预留*/
static const int TYPE_UNKNOWN_4       = 0x00000E00;
/**预留*/
static const int TYPE_UNKNOWN_5       = 0x00000F00;
/**复杂类型起始*/
static const int TYPE_OBJECT_START    = 0x00008FFF;
/**系统基础对象*/
static const int TYPE_BASS_RECORD     = ((TYPE_OBJECT_START >> OBJECT_INDEX_OFFSET) + 1) << OBJECT_INDEX_OFFSET;
static const int TYPE_OBJECT_REF      = ((TYPE_OBJECT_START >> OBJECT_INDEX_OFFSET) + 2) << OBJECT_INDEX_OFFSET;
static const int TYPE_CLASS_META      = ((TYPE_OBJECT_START >> OBJECT_INDEX_OFFSET) + 3) << OBJECT_INDEX_OFFSET;
static const int TYPE_FIELD_META      = ((TYPE_OBJECT_START >> OBJECT_INDEX_OFFSET) + 4) << OBJECT_INDEX_OFFSET;
static const int TYPE_PROJECT_META    = ((TYPE_OBJECT_START >> OBJECT_INDEX_OFFSET) + 5) << OBJECT_INDEX_OFFSET;

/**应用自定义类型的基础值，预留200给系统定义*/
static const int TYPE_CUSTOMER_START  = ((TYPE_OBJECT_START >> 13) + 200) << 13;
/**应用自定义类型的基础值，预留100给系统应用手动处理*/
static const int TYPE_PROJECT_START  = ((TYPE_OBJECT_START >> 13) + 300) << 13;
}
