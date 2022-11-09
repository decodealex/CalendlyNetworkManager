# CalendlyNetworkService

This is the NetworkService for the Calendly project in its own Swift Package Manager compliant package.

## Build tools & versions used
- Xcode 14.1
- swift-tools-version 5.5.

## Steps to run the app
The only thing you can really do here is run the tests.  
## My focus here:
I focused on making an extensible API that could easily have dozens of endpoints added to it without things getting disorganized or hard to test.  I also wanted to make it as user-friendly for the client app as possible.  
My goal was to create code that will be easy to use now and easy to maintain in the future. 
I wanted my objects to follow single responsibility principles and maximum coded decoupling:
- Endpoint is responsible for URLRequest creation
- NetworkService is responsible for performing API requests
- You can easily create a new endpoint by conforming to the Endpoint protocol (example: EventTypeEndpoint)
- I didn't have enough time to cover this library with unit tests. URL creation is the only feature that has unit tests. 
