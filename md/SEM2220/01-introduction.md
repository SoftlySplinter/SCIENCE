# SEM2220 - Mobile Solutions

Mobile devices (phones, tablets and other handheld devices) are the fastest growing area of computing. Typical applications involve a wide range of software and system issues. This module will investigate those issues, giving students experience and understanding of the best ways of building different types of mobile applications.


## Introduction

*Scope of mobile systems, , mobile web, native apps, design choices, main platforms, overview of implications (2 lectures)*

### Staff

- **[Chris Loftus](mailto:cwl@aber.ac.uk) (E38)**
- [Neil Taylor](mailto:nst@aber.ac.uk) (C58)
- [Andrew Star](mailto:aos@aber.ac.uk) (C47)

### Learning Outcomes

1. Demonstrate an advanced understanding of the domain of mobile systems.
  * Quite a broad overview of these systems.
  * High level view.
  * Give a flavour of specific systems (iOS, Android).
2. Analyse and evaluate mobile solutions in a range of application areas and be able to critically evaluate their effectiveness.
  * Have to be critical at M level.
  * Research. Pros and cons.
3. Evaluate the social, legal, ethical and professional issues involved in implementing mobile applications.
  * Neil will be talking about this in the context of mobile.
4. Implement representative mobile systems.
  * Playing with the technologies.
  * Building an android, iOS and mobile web app.

### Assessment

- Mobile Web-based Programming project **20%** *22/10/2013 to 04/11/2013*
- iOS-based Programming project **20%** *12/11/2013 to 25/11/2013*
- Android-based Programming project **20%** *02/12/2013 to 16/12/2013*
- Case study analysis **40%** *10/12/2013 to 22/01/2014*

### Motivation

In 2012 the whole mobiles ecosystem's revenue was $1,551 billion; equivalent to 2.2% of global GDP. 

5% CAGR (Compound Annual Growth Rate).

These are only projected figures, the picture is much bigger than this as this only includes money which takes into account the money which stays within the ecosystem (doesn't include ecommerce, etc.). The affect is much higher.

### Mobile Landscape

Constantly changing given that its a new market. The iPhone was the real kickstarter for this in 2007.

[Timeline](https://gsmaintelligence.com/timeline/) of the history mobile telephones.

Difference between "smart" and "feature" phones.

Mobile subscribers are growing 4 times faster than the global population. Reducing now (especially in the West) due to market saturation.

More scope for growth in developing countries.

Asia Pacific accounts for approximately half of global subscribers.

Total sim-enabled connections (including machine to machine (M2M) connections). Estimated 7.6% CAGR 2012-2017. Percentage of M2M connections is increasing rapidly.

Multiple devices (tables/phones/etc.) allow growth in sim-enabled connections.

Mobile data traffic is increasing rapidly. Video speculated to be one of the most rapidly increasing traffic.

### Mobile versus Desktop

Over time the sales of desktops (PCs & Laptops) is decreasing while the sale of mobile devices is increasing.

### Some predictions by GSMA

* Asia predicted to add approx. 50% of all connections/subscribers between 2013-17
* Same period Latin America and Africa next 20%
* Subscriber growth in developed nations slowing (e.g. 1% in UK)
* Total data traffic load in 2012 was 0.9 Exabyte/month).
* Predicted to be 11.2 EB/mth.


### Chief Stakeholders

* Network operators
* Content providers
* OS vendors
* Device vendors



### Fragmentation and Differentiation

Issue of fragmentation and differentiation, related to:
* the number of OS variants, 
* the number of device vendors wishing to customise the OS, 
* different browsers,
* Network operators and device vendors do not like commoditisation.
  * Don't want to be treated like commodities which are values on price.

Top 25 ranked apps in 2012 take 15% of all revenue. Only 2% of App Store newcomers get into the top 250 apps.

Free apps are becoming more of a norm, especially with the saturation of android.

## Objective-C

*A quick primer on Obj-C*

### Basic Syntax and Objects


#### Logging and Strings

```objc
NSLog(@"Message");

NSString *var = @"Some message";
NSLog(@"Message: %@.", var);
```

#### Booleans

```objc
BOOL true = YES;
BOOL false = NO;
```

#### Numbers

```objc
NSNumber *num = @10;

// Conversion to unsigned int
NSUInteger uInt = [num unsignedIntegerValue];
```

#### Arrays

```objc
NSArray *arr = @[...];

// Accessing elements
arr[index];

// Something about NSArrays being immutable objects.
```

#### Dictionaries

```objc
NSDictionary *dict = @{@"key": @"value"};

// Accessing
NSString *val = dict[@"key"];
```

### Objects and Messages

Messages are Objective-C's version of methods, where the Java syntax would be:

```java
ObjectName.methodName()
```

The Objective-C syntax is:

```objc
[objectName messageName]
```

Example:

```objc
NSArray *temp = @[@"Test", @"2"];

NSLog(@"%@", [temp description]);
// Logs information about temp
```

#### Storing the output of Messages

Just need to worry about typing

```objc
NSArray *temp = @[@"Test", @"2"];
NSString *result = [temp description]
NSLog(result);
```

#### Parameters

Messages can have parameters, however they may act differently than expected.

```objc
[object methodName:parameter namedParameter:value]
```

#### Initialisation

```objc
[[Class alloc] init];
```

### Conditionals and Loops

```
if(condition) {
    // ...
} else if(condition) {
    // ...
} else {
    // ...
}
```

```
switch(thing) {
    case value:
        // ...
        break;
}
```

```
for(Class *item in iterable) {
    // ...
}
```

### Blocks

Blocks are like basic methods.

```objc
void (^block)(void) = ^{
    // ...
};
```

Inkoving a block:

```objc
block();
```

### Classes

In a header file:

```objc
@interface Name : NSObject
@property Type *name;
@property NSString *myName;
@end
```

Implementing the interface:

```objc
#import Name.h

@implementation Name
@end
```

Accessing properties

```objc
Name *name = [[Name alloc] init];
name.myName = @"Value";
```

## Mobile Web

*Basic tools, responsive web, matching platform expectations, testing, delivery. (5 lectures plus practicals)*

## IOS Native Apps

*Objective-C, relevant design patterns, platform design considerations, handling data, using sensors and location (5 lectures plus practicals)*

## Android Native Apps

*Relevant design patterns, platform design considerations, handling data, using sensors and location, handling device variation (5 lectures plus practicals)*

## Bringing it all together

*Legal, social, ethical and professional issues. Selecting platforms and delivery methods, getting the interface right. (3 lectures)*
