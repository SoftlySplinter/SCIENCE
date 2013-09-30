# SEM2220 - Mobile Solutions

Mobile devices (phones, tablets and other handheld devices) are the fastest growing area of computing. Typical applications involve a wide range of software and system issues. This module will investigate those issues, giving students experience and understanding of the best ways of building different types of mobile applications.


## Introduction

*Scope of mobile systems, , mobile web, native apps, design choices, main platforms, overview of implications (2 lectures)*

### Staff

- Chris Loftus (cwl) *co-ordinator*
- Neil Taylor (nst)
- Andrew Star (aos)

### Learning Outcomes

1. Demonstrate an advanced understanding of the domain of mobile systems
2. Analyse and evaluate mobile solutions in a range of application areas and be able to critically evaluate their effectiveness.
3. Evaluate the social, legal, ethical and professional issues involved in implementing mobile applications.
4. Implement representative mobile systems

### Assessment

- Case study analysis **40%**
- Mobile Web-based Programming project **20%**
- iOS-based Programming project **20%**
- Android-based Programming project **20%**

### Motivation

In 2012 the whole mobiles ecosystem's revenue was $1,551 billion; equivalent to 2.2% of global GDP

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
