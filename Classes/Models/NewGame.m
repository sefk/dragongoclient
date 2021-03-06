//
//  NewGame.m
//  DGSPhone
//
//  Created by Justin Weiss on 6/28/10.
//  Copyright 2010 Justin Weiss. All rights reserved.
//fischer

#import "NewGame.h"


@implementation NewGame
@synthesize numberOfGames;
@synthesize ruleSet;
@synthesize boardSize;
@synthesize komiType;
@synthesize adjustedHandicap;
@synthesize minHandicap;
@synthesize maxHandicap;
@synthesize stdHandicap;
@synthesize adjustedKomi;
@synthesize jigoMode;
@synthesize timeValue;
@synthesize timeUnit;
@synthesize byoYomiType;
@synthesize japaneseTimeValue;
@synthesize japaneseTimeUnit;
@synthesize japaneseTimePeriods;
@synthesize canadianTimeValue;
@synthesize canadianTimeUnit;
@synthesize canadianTimePeriods;
@synthesize fischerTimeValue;
@synthesize fischerTimeUnit;
@synthesize weekendClock;
@synthesize	rated;
@synthesize requireRatedOpponent;
@synthesize	minimumRating;
@synthesize maximumRating;
@synthesize minRatedGames;
@synthesize sameOpponent;
@synthesize comment;

@synthesize ratedString;
@synthesize stdHandicapString;
@synthesize weekendClockString;
@synthesize komiTypeName;
@synthesize myGame;

- (id)init {
	if (self = [super init]) {
		numberOfGames = 1;
		boardSize = 19;
		maxHandicap = 21;
		stdHandicap = NO;
		timeValue = 3;
		timeUnit = kTimePeriodMonths;
		japaneseTimeValue = 1;
		japaneseTimeUnit = kTimePeriodDays;
		japaneseTimePeriods = 10;
		canadianTimeValue = 15;
		canadianTimeUnit = kTimePeriodDays;
		canadianTimePeriods = 15;
		fischerTimeValue = 1;
		fischerTimeUnit = kTimePeriodDays;
		weekendClock = YES;
		rated = NO;
        requireRatedOpponent = NO;
		minimumRating = @"30 kyu";
		maximumRating = @"9 dan";
		myGame = true;
	}
	return self;
}

- (NSString *)ruleSetValue {
	NSString *ruleSetString = @"";
	
	switch(self.ruleSet) {
		case kRuleSetJapanese:
			ruleSetString = @"JAPANESE";
			break;
		case kRuleSetChinese:
			ruleSetString = @"CHINESE";
			break;
	}
	return ruleSetString;
}

- (NSString *)komiTypeValue {
	NSString *komiTypeString = @"";
	
	switch(self.komiType) {
		case kKomiTypeConventional:
			komiTypeString = @"conv";
			break;
		case kKomiTypeProper:
			komiTypeString = @"proper";
			break;
	}
	return komiTypeString;
}

- (NSString *)komiTypeString:(KomiType)aKomiType {
	NSString *komiTypeString = @"";
	
	switch(aKomiType) {
		case kKomiTypeConventional:
			komiTypeString = @"Conventional";
			break;
		case kKomiTypeProper:
			komiTypeString = @"Proper";
			break;
	}
	return komiTypeString;
}

- (NSString *)komiTypeString {
	return [self komiTypeString:self.komiType];
}

- (NSString *)jigoModeValue {
	NSString *jigoModeString = @"";
	
	switch(self.jigoMode) {
		case kJigoModeUnchanged:
			jigoModeString = @"KEEP_KOMI";
			break;
		case kByoYomiTypeCanadian:
			jigoModeString = @"ALLOW_JIGO";
			break;
		case kByoYomiTypeFischer:
			jigoModeString = @"NO_JIGO";
			break;			
	}
	return jigoModeString;
}

- (NSString *)byoYomiTypeValue {
	NSString *byoYomiString = @"";
	
	switch(self.byoYomiType) {
		case kByoYomiTypeJapanese:
			byoYomiString = @"JAP";
			break;
		case kByoYomiTypeCanadian:
			byoYomiString = @"CAN";
			break;
		case kByoYomiTypeFischer:
			byoYomiString = @"FIS";
			break;			
	}
	return byoYomiString;
}

- (NSString *)byoYomiTypeString:(ByoYomiType)aByoYomiType {
	NSString *byoYomiString = @"";
	
	switch(aByoYomiType) {
		case kByoYomiTypeJapanese:
			byoYomiString = @"Japanese";
			break;
		case kByoYomiTypeCanadian:
			byoYomiString = @"Canadian";
			break;
		case kByoYomiTypeFischer:
			byoYomiString = @"Fischer";
			break;			
	}
	return byoYomiString;
}

- (NSString *)byoYomiTypeString {
	return [self byoYomiTypeString:self.byoYomiType];
}


- (NSString *)boolValue:(BOOL) value {
	if (value) {
		return @"Y";
	}
	return @"N";
}

- (NSString *)singularTimePeriodValue:(TimePeriod)value {
	NSString *timePeriodString = @"";
	
	switch(value) {
		case kTimePeriodHours:
			timePeriodString = @"hour";
			break;
		case kTimePeriodDays:
			timePeriodString = @"day";
			break;
		case kTimePeriodMonths:
			timePeriodString = @"month";
			break;			
	}
	return timePeriodString;
}


- (NSString *)timePeriodValue:(TimePeriod)unit {
	return [[self singularTimePeriodValue:unit] stringByAppendingString:@"s"];
}


- (NSString *)timePeriodString:(int)count withTimeUnit:(TimePeriod)unit {
    if (count == 1) {
        return [NSString stringWithFormat:@"%d %@", count, [self singularTimePeriodValue:unit]];
    } else {
        return [NSString stringWithFormat:@"%d %@", count, [self timePeriodValue:unit]];
    }

}

- (void)dealloc {
    self.comment = nil;
	self.minimumRating = nil;
	self.maximumRating = nil;
	
	self.ratedString = nil;
	self.stdHandicapString = nil;
	self.weekendClockString = nil;
	self.komiTypeName = nil;
    [super dealloc];
}

@end
