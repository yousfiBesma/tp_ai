


% tâches.
% task(ID, Description, Assigné, StatutDeCompletion).
:- dynamic task/4.

% 1. Définir un prédicat pour créer une tâche avec le statut initial de completion à faux.
create_task(ID, Description, Assigne) :-
    assertz(task(ID, Description, Assigne, false)),
    format('Task created: ~w.~n', [ID]).

% 2. Prédicat pour assigner une tâche à un utilisateur.
assign_task(ID, NouvelAssigne) :-
    retractall(task(ID, Description, _, Statut)), % Retire l’assigné actuel
    assertz(task(ID, Description, NouvelAssigne, Statut)), % Assigne le nouvel utilisateur
    format('Task ~w assigned to user : ~w.~n', [ID, NouvelAssigne]).

% 3. Prédicat pour marquer une tâche comme terminée.
mark_completed(ID) :-
    retractall(task(ID, Description, Assigne, _)), % Retire le statut actuel
    assertz(task(ID, Description, Assigne, true)),% Met à jour le statut en vrai
    format('Task ~w marked as completed.~n', [ID]).
% 4. Prédicat pour afficher toutes les tâches.
display_tasks :-
    forall(task(ID, Description, Assigne, Statut),
        (format('Tâche ~w :~n', [ID]),
            format('- Description : ~w~n', [Description]),
            format('- Assigné : ~w~n', [Assigne]),
            format('- Statut de complétion : ~w~n~n', [Statut]))).

% 5. Prédicat pour afficher les tâches assignées à un utilisateur spécifique.
display_tasks_assigned_to(Utilisateur) :-
    format('Tâches assignées à ~w :~n', [Utilisateur]),
    forall(task(ID, Description, Utilisateur, Statut),
        (format('Tâche ~w :~n', [ID]),
            format('- Description : ~w~n', [Description]),
            format('- Statut de complétion : ~w~n~n', [Statut]))).

% 6. Prédicat pour afficher les tâches terminées.
display_completed_tasks :-
    write('Tâches terminées :~n'),
    forall(task(ID, Description, Assigne, true),
        (format('Tâche ~w :~n', [ID]),
            format('- Description : ~w~n', [Description]),
            format('- Assigné : ~w~n~n', [Assigne]))).


% ?- create_task(1, 'Implement login functionality', 'Alice').
% ?- create_task(4, 'create a web site', 'besma').
% ?- create_task(2, 'Design homepage layout', 'Bob').
% ?- assign_task(1, 'John').
% ?- assign_task(4, 'asma').
% ?- mark_completed(2).
% ?- display_tasks.
% ?- display_tasks_assigned_to('Alice').
% ?- display_completed_tasks.