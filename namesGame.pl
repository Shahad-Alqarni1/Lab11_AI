% Names Game

% dynamic predicate
:-  dynamic letter/1.

% initial set of the letters
letter(a).
letter(b).
letter(c).

%s tarting the game
start :-
    write('Hi, This isthe "Name Game". '), nl,
    write('You will be given a set of English letters in which you will add, delete, or move to create you name. '), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    option(Choice).

% option 1: display th eletters
option(1) :-
    write('Current set of letters:'), nl,
    listing(letter),
    menu.

% option 2: add a letter
option(2) :-
    write('Enter the letter to add: '),
    read(L),
    assert(letter(L)),
    write('Letter added successfully.'), nl,
    menu.

% option 3: addd a letter at top
option(3) :-
    write('Enter the letter to add at the top: '),
    read(L),
    asserta(letter(L)),
    write('Letter added at the top successfully.'), nl,
    menu.

% option 4: add a letter at bottom
option(4) :-
    write('Enter the letter to add at the bottom: '),
    read(L),
    assertz(letter(L)),
    write('Letter added at the bottom successfully.'), nl,
    menu.

% option 5: delete a letter
option(5) :-
    write('Enter the letter to delete: '),
    read(L),
    (   retract(letter(L))
    ->  write('Letter deleted successfully.')
    ;   write('Letter not found in the database.')
    ),
    nl,
    menu.

% option 6: delete all letters
option(6) :-
    retractall(letter(_)),
    write('All letters have been deleted.'), nl,
    menu.

% option 7: exit
option(7) :-
    write('Exiting Name Game!'), nl.


