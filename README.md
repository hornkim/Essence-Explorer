# Essence-Explorer
A prolog application to help research Essence Semat innovations. https://semat.org/

This software aims to provide tools for researchers in Software Engineering to have a full end to end personal implentation of Essence, an OMG Standard.
The tool allows models to be built then viewed and explored. It is a work in progress and is in no way complete.

The Explorer uses a simple client-server model with a Javascript front end, and a SWIPL Prolog backend to serve models and web pages. 
The model contents has been derived from the  Essence OMG standard and the public examples provided by Ivar Jacobsen International. 
There has been no exhaustive review of the code or models for validity. There is no relationshio between the Author and Ivar Jacobsen Int.

The ability to have the full E2E code and be able to edit this allows any aspect of Essence to be researched and changed.
A power point presentation is included to illustrate its features and design.

The tool provides no security, scalability, reliability etc and is designed as a single person desktop application. 

To use the application first install SWIPL prolog: https://www.swi-prolog.org/

To start the application, from the top level, execute: swipl prolog/semat_server.pl

In a browser go to http://localhost:8000/




