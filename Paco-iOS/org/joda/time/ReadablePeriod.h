//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: joda-time/src/main/java/org/joda/time/ReadablePeriod.java
//

#include "J2ObjC_header.h"

#pragma push_macro("OrgJodaTimeReadablePeriod_INCLUDE_ALL")
#ifdef OrgJodaTimeReadablePeriod_RESTRICT
#define OrgJodaTimeReadablePeriod_INCLUDE_ALL 0
#else
#define OrgJodaTimeReadablePeriod_INCLUDE_ALL 1
#endif
#undef OrgJodaTimeReadablePeriod_RESTRICT

#if !defined (OrgJodaTimeReadablePeriod_) && (OrgJodaTimeReadablePeriod_INCLUDE_ALL || defined(OrgJodaTimeReadablePeriod_INCLUDE))
#define OrgJodaTimeReadablePeriod_

@class OrgJodaTimeDurationFieldType;
@class OrgJodaTimeMutablePeriod;
@class OrgJodaTimePeriod;
@class OrgJodaTimePeriodType;

@protocol OrgJodaTimeReadablePeriod < NSObject, JavaObject >

- (OrgJodaTimePeriodType *)getPeriodType;

- (jint)size;

- (OrgJodaTimeDurationFieldType *)getFieldTypeWithInt:(jint)index;

- (jint)getValueWithInt:(jint)index;

- (jint)getWithOrgJodaTimeDurationFieldType:(OrgJodaTimeDurationFieldType *)field;

- (jboolean)isSupportedWithOrgJodaTimeDurationFieldType:(OrgJodaTimeDurationFieldType *)field;

- (OrgJodaTimePeriod *)toPeriod;

- (OrgJodaTimeMutablePeriod *)toMutablePeriod;

- (jboolean)isEqual:(id)readablePeriod;

- (NSUInteger)hash;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgJodaTimeReadablePeriod)

J2OBJC_TYPE_LITERAL_HEADER(OrgJodaTimeReadablePeriod)

#endif

#pragma pop_macro("OrgJodaTimeReadablePeriod_INCLUDE_ALL")