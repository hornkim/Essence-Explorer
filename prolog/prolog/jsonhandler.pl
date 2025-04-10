:- module(jsonhandler, [
      json_handler/2, 
      rest_handler/1, 
      rest_handler/2, 
      rest_handler/3, 
      rest_handler/4]).

:- meta_predicate json_handler(2, +).
:- meta_predicate rest_handler(2, +).

:- use_module(library(http/http_files)).
:- use_module(library(http/http_json)).

% used for Put with JSON request content
json_handler(Handler, Request) :-
   http_read_json_dict(Request, JSONIn, [value_string_as(atom)]),
   call(Handler, JSONIn, JSONOut),
   reply_json_dict(JSONOut).

% used for Get with REST parameters in URL 
rest_handler(Handler) :-
   call(Handler, JSONOut),
   reply_json_dict(JSONOut).

rest_handler(Handler, X) :-
   call(Handler, X, JSONOut),
   reply_json_dict(JSONOut).

rest_handler(Handler, X, Y) :-
      call(Handler, X, Y, JSONOut),
      reply_json_dict(JSONOut).

rest_handler(Handler, X, Y, Z) :-
      call(Handler, X, Y, Z, JSONOut),
      reply_json_dict(JSONOut).