# SEM5640 - Developing Advanced Internet-Based Applications

This module builds on SE31520 examining further the development processes, techniques and technologies for constructing Internet-based, distributed software systems. Particular emphasis is placed on studying and applying enterprise design patterns. Students, working in small groups, will build, using a modern software engineering methodology, a distributed application that employs the technologies and concepts taught in this and previous modules.

*Nigel Hardy awesome tally: 2*

## Introduction

*Provides a road-map to the module, with a brief overview of main concepts and how they interrelate.*

### Staff

* **[Neil Taylor](mailto:nst@aber.ac.uk)**
* [Nigel Hardy](nwh@aber.ac.uk)

### Learning Outcomes

1. Analyse a complex software engineering problem.
2. Within a group design and implement an original solution to the problem.
3. Test and critically evaluate their solution.
4. Critically assess the relative merits of various software development methodologies within the context of the given problem and nature of the project team.
5. Working in a group, apply the chosen software development methodology to solve the given problem.
6. Critically explain the relative merits of alternative server-side technologies.
7. Demonstrate a critical appreciation of design issues encountered when developing multi-tier, distributed applications.

### Assessment

* Group Programming project and report **75%**
* Exam **25%**

### Internet Applications

* Uses network connection
* Browser-based
* Client-server model
* Reliance of collection of internet standards (e.g. HTTP)

### Advanced Internet Applications

* AJAX/Plugins support to provide a client rich experience
* Multiple Application/Servers
* Distributed or more complex processing
* Transaction (DB) support
* REST/SOAP or other remote procedure calls

No precise definition.

### Overview

There are several themes this module will look at:

* Multi-Tier Internet Applications
* Developing using .NET and Java EE
* Design Patterns
  * MVC
  * ORM
* Web Services
  * REST
  * SOAP
  * RMI/RPC
* Building Applications
  * Cloud Computing
  * Structure and deployment

#### Multi-Tier Internet Applications

Applications that involve multiple servers which run different parts of the application so that the business logic is separated from the presentation logic.

Different parts tend to include:

* Client
* Web
* Business Logic
* Data/EIS

Lots of small applications which build up a larger, more complex, application.

Communication between the servers provides the linkage between the applications.

Supports scalability if done correctly. Also more resistant to failure. Potentially more secure (more important servers firewalled).

Should all be transparent to the user.

### Java Enterprise Edition (J2EE)

* Building web applications
* JavaServer Faces
* Enterprise Java Beans
* Portability

#### .NET

* Building web applications
* Web Forms, MVC
* C#
* Tiers and layers

#### Design Patterns

Two types of issues:

##### Patterns of Enterprise Architecture

* Building and structuring the application
* Relate to .NET and Java

##### Patterns of Enterprise Integration

* Making applications communicate
* Examples:
  * Apache Camel
  * Apache ActiveMQ

#### Building Applications

Using Cloud computing and how relevant it really is.

Examples from eBay of structure and deployment.

#### Web Services

Application that provide services which have destination endpoints with operations.

SOAP XML, WSDL and REST are the big players.

Alternatives to REST?

### Java Enterprise Edition (Java EE)

Java is a language (JDK) and a platform (JRE).

The platform is the Java Virtual Machine and a set of APIs.

Four platforms:

1. Java Standard Edition (SE)
2. Java Enterprise Edition (EE)
3. Java Mobile Edition (ME)
4. Java FX

#### Java EE

A superset of Java Set, providing a development model, APIs and runtime environment (the server).

> *"For developing and running large-scale, multi-tiered, scalable, reliable and secure network systems"* - The Oracle BS

#### Java EE Web Tier

Access the web tier with HTTP(S).

Provides static resources and dynamic page generation. Handles client input and navigation flow with maintance of state.

JavaBeans provide temporary storage on the Web Tier.

Can do simple logic, could build the whole application in this tier, but would be a bad design.

#### Java EE Business Tier

Provides Enterprise Java Beans (EJB) components.

Access to Java Logic, etc. which provide the business logic.

#### Java EE Enterprise Information System (EIS) Tier

Logically and typically on other machines, typically "foreign" technology.

#### Other Clients

Can build Java Applications or Web Applications which access the EJB components directly. Uses remote procedure calls.

#### Java EE Application Server

Provides:

* The JVM and core APIs
* The EE APIs
* Component containers
  * component lifecycle management
    * creation
    * association
  * services to components
    * security
    * transaction management
    * directory lookup
    * remote connectivity

##### Containers

A set of Java classes packaged into a jar file.

Can be deployed using either:

* XML descriptors
* Java annotations

Annotations are widely used, but can be overriden by descriptors.

Components plus deployment descriptors make up a module, each for one container type.

Four types of EE modules:

* Web modules `.war`
* EJB modules `.jar`
* Application client modules `.jar`
* Resource Adapter Modules `.rar`

A set of modules makes up a Enterprise archive: `.ear`

#### Servlets

Servlets are the olderest EE web component.

Servlets act as a dynamic page, which have a URL, and must receive a HTTP request, from this it generates a HTTP response.

Is a Java object with a managed lifecycle.

Extension of `javax.servlet.http.HttpServlet` class.

##### Lifecycle

Managed by the web container.

The first call is:

* Load class
* Create an instance
* Call `init()`

Any call:

* Handle the HTTP request

Perhaps calls `destroy()`

Only one instance is needed by a running server.

##### Handling Requests

The `HttpServlet` class has stubs for all the HTTP methods `doGet(...)` etc.

`service()` method used to handle the finding of appropriate methods for the HTTP headers.

Common to use the same method to handle `GET` and `POST` (for some strange reason, this sounds bad).

###### Request

Provides access to:

* Call details
* Parameters
* Body
* A reader
* Context

###### Response

Provides access to:

* Response code
* Headers
* A writer (for the body)

###### Forwarding

Can forward requests to other servlets, passing on the request and response objects. Used for branching on context, for example.


```java
RequestDispatcher d = req.getRequestDispatcher('name');
d.forward(req, resp)
```

###### Instance Variables and Servlets

A servlet could have instance variables, however these variables are not specific to a connection, rather the whole servlet.

There may also be multiple servlets so there is no guarantee that these will be the same.

Need features for session data.

Reminder that HTTP is stateless.

###### Sessions

The request must carry some identification of the session, server usually generates this information.

* Parameters
* Cookies

Remember EU Cookie Law

###### Error Redirects

Specified in the `web.xml` descriptor.

## Construction Technologies

*Examination of technical solutions for building enterprise applications as provided by enterprise Java and .NET for building distributed applications.*

These include:
* support for server-side MVC, e.g. JavaServer Faces and ASP.NET MVC; 
* business objects, e.g. Enterprise JavaBeans; 
* object to relational mapping, e.g. MS LINQ, Java Persistence API; 
* messaging systems, e.g. Java Messaging Service;
* interoperability, e.g. SOAP-based web services.

### Server-Side MVC

#### Java Server Faces

#### ASP.NET

### Business Objects

#### Enterprise Java Beans

### Object Relational Mapping (ORM)

#### MS LINQ

#### Java Persistence API

### Messaging Systems

#### Java Messaging Service

### Interoperability

#### SOAP-based Web Services

## Design Issues

*A number of enterprise application design patterns will be reviewed within the context of technologies discussed in 2. Building multi-tier applications requires developers to know more than just technologies, they must also know and use design techniques suited to their development. Students will learn about reusable enterprise design patterns, and in particular those used for the development of distributed, multi-tier applications.*

## Wider Issues

*Examination of current issues that are related to 2 and 3, e.g. scalability; approaches to testing and deployment; the use of cloud computing.*

