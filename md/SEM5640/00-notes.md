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

## Construction Technologies

*Examination of technical solutions for building enterprise applications as provided by enterprise Java and .NET for building distributed applications.*

These include:
* support for server-side MVC, e.g. JavaServer Faces and ASP.NET MVC; 
* business objects, e.g. Enterprise JavaBeans; 
* object to relational mapping, e.g. MS LINQ, Java Persistence API; 
* messaging systems, e.g. Java Messaging Service;
* interoperability, e.g. SOAP-based web services.

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

#### Useful Features

* Templating
* Validation & Schemas
* i18n
* Security
* Database access
* Support for good design patterns
* Tight Integration
* Testing Frameworks
* Web Service support

Generally: higher level libraries and code reuse.

##### i18n and L10n

Internationalisation and localisation are both important. Don't hardcode for the locale, instead store translations in DB or files and load them dynamically.

### Server-Side MVC

#### JavaServer Faces (JSF)

Provides:

* Templating
  * Facelets
  * JavaServer Pages (JSP)
* Validators
* MVC Pull
* Navigation
  * Fixed
  * Dynamic
* AJAX
* i18n/L10n
* Session Management
* DB Access
  * JDBC
  * ORM frameworks
* Testing Frameworks
* Code reuse
* Web Services and resources

##### Basic Technology

Basic Api for represention components and managing their state; handling events, server-side validation and data conversion; defining page navigation; supporting i18n and accessibility; and providing extensibility.

A tag library for adding components to web pages and connecting components to server-side objects.

##### Expression Language

Like most scripting languages `$` and `#` are used.

`${expr}` are *rvalues* (read-only) and are processed immediately.

`#{expr}` are *lvalues (read-write) and have deferred evaluation. Also used for method expressions.

`${object.variable}` calls `object.getVariable()` under the covers.

`#{object.method}` calls `object.method()`.

##### Faces

A replacement for JavaServer Pages (which are now deprecated).

Write (X)HTML with special tags which have an XML appearance which will be rendered as HTML with functionality behind it.

`<h:body>` is the top level tag.

All pages will tend to act like a form, so `<h:form>` is very commonly used, even in cases where there would not normally be a form.

##### Common Attributes

* `id`
* `style` to associate CSS
* `rendered` is a condition to check is the element should be rendered on the page. The condition can be an expression from the Expression Language.
* `value` the value of the component, again this can be from the Expression Language, which links the view to the model.

##### Composite Components

Built from standard components.

These can be parametrised and stored in `resources`; they have a namespace (default: `http://xmlns.jcp.org/jsf/composite/ezcomp`)

```xml
<!DOCTYUPE html PUBLIC ...>
<html xmlns="..."
      xmlns:cc = "..."
      xmlns:h = "...">

<!-- INTERFACE -->
<cc:interface>
  <cc:attribute name="x" required="true" />
</cc:interface>

<!-- IMPLEMENTATION -->
<cc:implementation>
  <p>
    <h:outputLabel for="i" value="Repeats" />
    <h:inputText id="i" value="{cc.attrs.x}" />
    <h:message for="repeat" />
  </p>
</cc:implementation>
```

##### Templating

Can create template pages which has values to fill in. The inheriting page has to fill in these values.

##### Navigation

Write navigation rules in XML, each rule is a page (view). For each page there is a set of outcomes (in string form). For each outcome a next page is specified.

Typically stored in `faces-config.xml`

Outcomes are generated from the `action` attributes from components.

There are implicit navigation rules which falls back to a matching page if it can be found.

##### Converters

Implement `javax.faces.convert.Converter`

Have associated error string displayed if conversion fails (`<h:messages>`).

Number of default converters for most Java Objects and primitives.

Converters are used in four ways:

1. Bind the component to a managed bean property of the right type (default).
2. Put the converter class in the component's `converter` attribute.
3. For numbers and dates, nest the `f:convertDateTime` or `f:convertNumber` tag inside the component.
4. Put the `f:converter` tag inside the component and refer to the converter (general purpose tag).

##### Events & Listeners

Part of the component model, application events are generated by components (ultimately from the rendered page).

The JSF application can map HTTP requests to the specific handling code.

Two types of event:

1. Application event; when the user activates a component that implements `ActionSource` (buttons, links, etc.).
2. Value-change event; when the users changes the value of a component represented by `UIInput`.

Listeners cause the application to respond to events:

1. Implement an event listener class to handle the event and register it to a component.
2. Implement a method of a managed bean and refer to it in the EL attribute in the component tag.

##### Validators

Similar to converters, but only provide validation.

Implement `javax.faces.validator.Validator`

Again, default validators are provided.

Registered by:

1. nesting the validator's tag inside the component
2. Nesting the `f:validator` tag inside the component.

`BeanValidator` uses validation methods in the bean instead of having to write a separate class. Also allows the validation to be model-state specific.

###### Bean Validation

```java
public void validateVar(FacesContext context, UIComponent toValidate, Object value) {
    int input = (Integer) value; // cast the given value
    if(!condition) {
      ((UIInput) toValidate).setValid(false);
      FacesMessage message = newFacesMessage(
        "error message");
      context.addMessage(
        toValidate.getClientId(context), 
        message);
    }
}
```

##### Lifecycle

Starts when the client request a URL and ends with the server response.

#### ASP.NET

### Business Objects

#### Enterprise Java Beans

### Object Relational Mapping (ORM)

#### MS LINQ

#### Java Persistence API

Access to database at SQL level or through an ORM Framework

##### JDBC

Provides direct access to a database.

### Messaging Systems

#### Java Messaging Service

### Interoperability

#### SOAP-based Web Services

## Design Issues

*A number of enterprise application design patterns will be reviewed within the context of technologies discussed in 2. Building multi-tier applications requires developers to know more than just technologies, they must also know and use design techniques suited to their development. Students will learn about reusable enterprise design patterns, and in particular those used for the development of distributed, multi-tier applications.*

## Wider Issues

*Examination of current issues that are related to 2 and 3, e.g. scalability; approaches to testing and deployment; the use of cloud computing.*

