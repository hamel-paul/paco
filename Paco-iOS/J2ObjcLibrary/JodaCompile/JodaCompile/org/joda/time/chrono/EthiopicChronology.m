//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: joda-time/src/main/java/org/joda/time/chrono/EthiopicChronology.java
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "java/lang/ArrayIndexOutOfBoundsException.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/util/concurrent/ConcurrentHashMap.h"
#include "org/joda/time/Chronology.h"
#include "org/joda/time/DateTime.h"
#include "org/joda/time/DateTimeConstants.h"
#include "org/joda/time/DateTimeField.h"
#include "org/joda/time/DateTimeZone.h"
#include "org/joda/time/DurationField.h"
#include "org/joda/time/chrono/AssembledChronology.h"
#include "org/joda/time/chrono/BasicChronology.h"
#include "org/joda/time/chrono/BasicFixedMonthChronology.h"
#include "org/joda/time/chrono/BasicMonthOfYearDateTimeField.h"
#include "org/joda/time/chrono/BasicSingleEraDateTimeField.h"
#include "org/joda/time/chrono/EthiopicChronology.h"
#include "org/joda/time/chrono/LimitChronology.h"
#include "org/joda/time/chrono/ZonedChronology.h"
#include "org/joda/time/field/SkipDateTimeField.h"

@interface OrgJodaTimeChronoEthiopicChronology ()

- (id)readResolve;

@end

inline jlong OrgJodaTimeChronoEthiopicChronology_get_serialVersionUID();
#define OrgJodaTimeChronoEthiopicChronology_serialVersionUID -5972804258688333942LL
J2OBJC_STATIC_FIELD_CONSTANT(OrgJodaTimeChronoEthiopicChronology, serialVersionUID, jlong)

inline OrgJodaTimeDateTimeField *OrgJodaTimeChronoEthiopicChronology_get_ERA_FIELD();
static OrgJodaTimeDateTimeField *OrgJodaTimeChronoEthiopicChronology_ERA_FIELD;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgJodaTimeChronoEthiopicChronology, ERA_FIELD, OrgJodaTimeDateTimeField *)

inline jint OrgJodaTimeChronoEthiopicChronology_get_MIN_YEAR();
#define OrgJodaTimeChronoEthiopicChronology_MIN_YEAR -292269337
J2OBJC_STATIC_FIELD_CONSTANT(OrgJodaTimeChronoEthiopicChronology, MIN_YEAR, jint)

inline jint OrgJodaTimeChronoEthiopicChronology_get_MAX_YEAR();
#define OrgJodaTimeChronoEthiopicChronology_MAX_YEAR 292272984
J2OBJC_STATIC_FIELD_CONSTANT(OrgJodaTimeChronoEthiopicChronology, MAX_YEAR, jint)

inline JavaUtilConcurrentConcurrentHashMap *OrgJodaTimeChronoEthiopicChronology_get_cCache();
static JavaUtilConcurrentConcurrentHashMap *OrgJodaTimeChronoEthiopicChronology_cCache;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgJodaTimeChronoEthiopicChronology, cCache, JavaUtilConcurrentConcurrentHashMap *)

inline OrgJodaTimeChronoEthiopicChronology *OrgJodaTimeChronoEthiopicChronology_get_INSTANCE_UTC();
static OrgJodaTimeChronoEthiopicChronology *OrgJodaTimeChronoEthiopicChronology_INSTANCE_UTC;
J2OBJC_STATIC_FIELD_OBJ_FINAL(OrgJodaTimeChronoEthiopicChronology, INSTANCE_UTC, OrgJodaTimeChronoEthiopicChronology *)

J2OBJC_INITIALIZED_DEFN(OrgJodaTimeChronoEthiopicChronology)

@implementation OrgJodaTimeChronoEthiopicChronology

+ (OrgJodaTimeChronoEthiopicChronology *)getInstanceUTC {
  return OrgJodaTimeChronoEthiopicChronology_getInstanceUTC();
}

+ (OrgJodaTimeChronoEthiopicChronology *)getInstance {
  return OrgJodaTimeChronoEthiopicChronology_getInstance();
}

+ (OrgJodaTimeChronoEthiopicChronology *)getInstanceWithOrgJodaTimeDateTimeZone:(OrgJodaTimeDateTimeZone *)zone {
  return OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_(zone);
}

+ (OrgJodaTimeChronoEthiopicChronology *)getInstanceWithOrgJodaTimeDateTimeZone:(OrgJodaTimeDateTimeZone *)zone
                                                                        withInt:(jint)minDaysInFirstWeek {
  return OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_(zone, minDaysInFirstWeek);
}

- (instancetype)initWithOrgJodaTimeChronology:(OrgJodaTimeChronology *)base
                                       withId:(id)param
                                      withInt:(jint)minDaysInFirstWeek {
  OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(self, base, param, minDaysInFirstWeek);
  return self;
}

- (id)readResolve {
  OrgJodaTimeChronology *base = [self getBase];
  return base == nil ? OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_(JreLoadStatic(OrgJodaTimeDateTimeZone, UTC), [self getMinimumDaysInFirstWeek]) : OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_([base getZone], [self getMinimumDaysInFirstWeek]);
}

- (OrgJodaTimeChronology *)withUTC {
  return OrgJodaTimeChronoEthiopicChronology_INSTANCE_UTC;
}

- (OrgJodaTimeChronology *)withZoneWithOrgJodaTimeDateTimeZone:(OrgJodaTimeDateTimeZone *)zone {
  if (zone == nil) {
    zone = OrgJodaTimeDateTimeZone_getDefault();
  }
  if (zone == [self getZone]) {
    return self;
  }
  return OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_(zone);
}

- (jboolean)isLeapDayWithLong:(jlong)instant {
  return [((OrgJodaTimeDateTimeField *) nil_chk([self dayOfMonth])) getWithLong:instant] == 6 && [((OrgJodaTimeDateTimeField *) nil_chk([self monthOfYear])) isLeapWithLong:instant];
}

- (jlong)calculateFirstDayOfYearMillisWithInt:(jint)year {
  jint relativeYear = year - 1963;
  jint leapYears;
  if (relativeYear <= 0) {
    leapYears = JreRShift32((relativeYear + 3), 2);
  }
  else {
    leapYears = JreRShift32(relativeYear, 2);
    if (![self isLeapYearWithInt:year]) {
      leapYears++;
    }
  }
  jlong millis = (relativeYear * 365LL + leapYears) * (jlong) OrgJodaTimeDateTimeConstants_MILLIS_PER_DAY;
  return millis + (365LL - 112) * OrgJodaTimeDateTimeConstants_MILLIS_PER_DAY;
}

- (jint)getMinYear {
  return OrgJodaTimeChronoEthiopicChronology_MIN_YEAR;
}

- (jint)getMaxYear {
  return OrgJodaTimeChronoEthiopicChronology_MAX_YEAR;
}

- (jlong)getApproxMillisAtEpochDividedByTwo {
  return (1962LL * OrgJodaTimeChronoBasicFixedMonthChronology_MILLIS_PER_YEAR + 112LL * OrgJodaTimeDateTimeConstants_MILLIS_PER_DAY) / 2;
}

- (void)assembleWithOrgJodaTimeChronoAssembledChronology_Fields:(OrgJodaTimeChronoAssembledChronology_Fields *)fields {
  if ([self getBase] == nil) {
    [super assembleWithOrgJodaTimeChronoAssembledChronology_Fields:fields];
    JreStrongAssignAndConsume(&((OrgJodaTimeChronoAssembledChronology_Fields *) nil_chk(fields))->year_, new_OrgJodaTimeFieldSkipDateTimeField_initWithOrgJodaTimeChronology_withOrgJodaTimeDateTimeField_(self, fields->year_));
    JreStrongAssignAndConsume(&fields->weekyear_, new_OrgJodaTimeFieldSkipDateTimeField_initWithOrgJodaTimeChronology_withOrgJodaTimeDateTimeField_(self, fields->weekyear_));
    JreStrongAssign(&fields->era_, OrgJodaTimeChronoEthiopicChronology_ERA_FIELD);
    JreStrongAssignAndConsume(&fields->monthOfYear_, new_OrgJodaTimeChronoBasicMonthOfYearDateTimeField_initWithOrgJodaTimeChronoBasicChronology_withInt_(self, 13));
    JreStrongAssign(&fields->months_, [fields->monthOfYear_ getDurationField]);
  }
}

+ (void)initialize {
  if (self == [OrgJodaTimeChronoEthiopicChronology class]) {
    JreStrongAssignAndConsume(&OrgJodaTimeChronoEthiopicChronology_ERA_FIELD, new_OrgJodaTimeChronoBasicSingleEraDateTimeField_initWithNSString_(@"EE"));
    JreStrongAssignAndConsume(&OrgJodaTimeChronoEthiopicChronology_cCache, new_JavaUtilConcurrentConcurrentHashMap_init());
    {
      JreStrongAssign(&OrgJodaTimeChronoEthiopicChronology_INSTANCE_UTC, OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_(JreLoadStatic(OrgJodaTimeDateTimeZone, UTC)));
    }
    J2OBJC_SET_INITIALIZED(OrgJodaTimeChronoEthiopicChronology)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "getInstanceUTC", NULL, "Lorg.joda.time.chrono.EthiopicChronology;", 0x9, NULL, NULL },
    { "getInstance", NULL, "Lorg.joda.time.chrono.EthiopicChronology;", 0x9, NULL, NULL },
    { "getInstanceWithOrgJodaTimeDateTimeZone:", "getInstance", "Lorg.joda.time.chrono.EthiopicChronology;", 0x9, NULL, NULL },
    { "getInstanceWithOrgJodaTimeDateTimeZone:withInt:", "getInstance", "Lorg.joda.time.chrono.EthiopicChronology;", 0x9, NULL, NULL },
    { "initWithOrgJodaTimeChronology:withId:withInt:", "EthiopicChronology", NULL, 0x0, NULL, NULL },
    { "readResolve", NULL, "Ljava.lang.Object;", 0x2, NULL, NULL },
    { "withUTC", NULL, "Lorg.joda.time.Chronology;", 0x1, NULL, NULL },
    { "withZoneWithOrgJodaTimeDateTimeZone:", "withZone", "Lorg.joda.time.Chronology;", 0x1, NULL, NULL },
    { "isLeapDayWithLong:", "isLeapDay", "Z", 0x0, NULL, NULL },
    { "calculateFirstDayOfYearMillisWithInt:", "calculateFirstDayOfYearMillis", "J", 0x0, NULL, NULL },
    { "getMinYear", NULL, "I", 0x0, NULL, NULL },
    { "getMaxYear", NULL, "I", 0x0, NULL, NULL },
    { "getApproxMillisAtEpochDividedByTwo", NULL, "J", 0x0, NULL, NULL },
    { "assembleWithOrgJodaTimeChronoAssembledChronology_Fields:", "assemble", "V", 0x4, NULL, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "serialVersionUID", "serialVersionUID", 0x1a, "J", NULL, NULL, .constantValue.asLong = OrgJodaTimeChronoEthiopicChronology_serialVersionUID },
    { "EE", "EE", 0x19, "I", NULL, NULL, .constantValue.asInt = OrgJodaTimeChronoEthiopicChronology_EE },
    { "ERA_FIELD", "ERA_FIELD", 0x1a, "Lorg.joda.time.DateTimeField;", &OrgJodaTimeChronoEthiopicChronology_ERA_FIELD, NULL, .constantValue.asLong = 0 },
    { "MIN_YEAR", "MIN_YEAR", 0x1a, "I", NULL, NULL, .constantValue.asInt = OrgJodaTimeChronoEthiopicChronology_MIN_YEAR },
    { "MAX_YEAR", "MAX_YEAR", 0x1a, "I", NULL, NULL, .constantValue.asInt = OrgJodaTimeChronoEthiopicChronology_MAX_YEAR },
    { "cCache", "cCache", 0x1a, "Ljava.util.concurrent.ConcurrentHashMap;", &OrgJodaTimeChronoEthiopicChronology_cCache, "Ljava/util/concurrent/ConcurrentHashMap<Lorg/joda/time/DateTimeZone;L[Lorg/joda/time/chrono/EthiopicChronology;;>;", .constantValue.asLong = 0 },
    { "INSTANCE_UTC", "INSTANCE_UTC", 0x1a, "Lorg.joda.time.chrono.EthiopicChronology;", &OrgJodaTimeChronoEthiopicChronology_INSTANCE_UTC, NULL, .constantValue.asLong = 0 },
  };
  static const J2ObjcClassInfo _OrgJodaTimeChronoEthiopicChronology = { 2, "EthiopicChronology", "org.joda.time.chrono", NULL, 0x11, 14, methods, 7, fields, 0, NULL, 0, NULL, NULL, NULL };
  return &_OrgJodaTimeChronoEthiopicChronology;
}

@end

OrgJodaTimeChronoEthiopicChronology *OrgJodaTimeChronoEthiopicChronology_getInstanceUTC() {
  OrgJodaTimeChronoEthiopicChronology_initialize();
  return OrgJodaTimeChronoEthiopicChronology_INSTANCE_UTC;
}

OrgJodaTimeChronoEthiopicChronology *OrgJodaTimeChronoEthiopicChronology_getInstance() {
  OrgJodaTimeChronoEthiopicChronology_initialize();
  return OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_(OrgJodaTimeDateTimeZone_getDefault(), 4);
}

OrgJodaTimeChronoEthiopicChronology *OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_(OrgJodaTimeDateTimeZone *zone) {
  OrgJodaTimeChronoEthiopicChronology_initialize();
  return OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_(zone, 4);
}

OrgJodaTimeChronoEthiopicChronology *OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_(OrgJodaTimeDateTimeZone *zone, jint minDaysInFirstWeek) {
  OrgJodaTimeChronoEthiopicChronology_initialize();
  if (zone == nil) {
    zone = OrgJodaTimeDateTimeZone_getDefault();
  }
  OrgJodaTimeChronoEthiopicChronology *chrono;
  IOSObjectArray *chronos = [((JavaUtilConcurrentConcurrentHashMap *) nil_chk(OrgJodaTimeChronoEthiopicChronology_cCache)) getWithId:zone];
  if (chronos == nil) {
    chronos = [IOSObjectArray arrayWithLength:7 type:OrgJodaTimeChronoEthiopicChronology_class_()];
    IOSObjectArray *oldChronos = [OrgJodaTimeChronoEthiopicChronology_cCache putIfAbsentWithId:zone withId:chronos];
    if (oldChronos != nil) {
      chronos = oldChronos;
    }
  }
  @try {
    chrono = IOSObjectArray_Get(nil_chk(chronos), minDaysInFirstWeek - 1);
  }
  @catch (JavaLangArrayIndexOutOfBoundsException *e) {
    @throw create_JavaLangIllegalArgumentException_initWithNSString_(JreStrcat("$I", @"Invalid min days in first week: ", minDaysInFirstWeek));
  }
  if (chrono == nil) {
    @synchronized(chronos) {
      chrono = IOSObjectArray_Get(nil_chk(chronos), minDaysInFirstWeek - 1);
      if (chrono == nil) {
        if (zone == JreLoadStatic(OrgJodaTimeDateTimeZone, UTC)) {
          chrono = create_OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(nil, nil, minDaysInFirstWeek);
          OrgJodaTimeDateTime *lowerLimit = create_OrgJodaTimeDateTime_initWithInt_withInt_withInt_withInt_withInt_withInt_withInt_withOrgJodaTimeChronology_(1, 1, 1, 0, 0, 0, 0, chrono);
          chrono = create_OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(OrgJodaTimeChronoLimitChronology_getInstanceWithOrgJodaTimeChronology_withOrgJodaTimeReadableDateTime_withOrgJodaTimeReadableDateTime_(chrono, lowerLimit, nil), nil, minDaysInFirstWeek);
        }
        else {
          chrono = OrgJodaTimeChronoEthiopicChronology_getInstanceWithOrgJodaTimeDateTimeZone_withInt_(JreLoadStatic(OrgJodaTimeDateTimeZone, UTC), minDaysInFirstWeek);
          chrono = create_OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(OrgJodaTimeChronoZonedChronology_getInstanceWithOrgJodaTimeChronology_withOrgJodaTimeDateTimeZone_(chrono, zone), nil, minDaysInFirstWeek);
        }
        IOSObjectArray_Set(chronos, minDaysInFirstWeek - 1, chrono);
      }
    }
  }
  return chrono;
}

void OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(OrgJodaTimeChronoEthiopicChronology *self, OrgJodaTimeChronology *base, id param, jint minDaysInFirstWeek) {
  OrgJodaTimeChronoBasicFixedMonthChronology_initWithOrgJodaTimeChronology_withId_withInt_(self, base, param, minDaysInFirstWeek);
}

OrgJodaTimeChronoEthiopicChronology *new_OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(OrgJodaTimeChronology *base, id param, jint minDaysInFirstWeek) {
  OrgJodaTimeChronoEthiopicChronology *self = [OrgJodaTimeChronoEthiopicChronology alloc];
  OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(self, base, param, minDaysInFirstWeek);
  return self;
}

OrgJodaTimeChronoEthiopicChronology *create_OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(OrgJodaTimeChronology *base, id param, jint minDaysInFirstWeek) {
  OrgJodaTimeChronoEthiopicChronology *self = [[OrgJodaTimeChronoEthiopicChronology alloc] autorelease];
  OrgJodaTimeChronoEthiopicChronology_initWithOrgJodaTimeChronology_withId_withInt_(self, base, param, minDaysInFirstWeek);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgJodaTimeChronoEthiopicChronology)