Version 1 of Hyperlink Interface by Anthony Casteel begins here.

"A hyperlink interface exposing navigation and common commands"

include Basic Screen Effects by Emily Short.
include Glulx Text Effects by Emily Short.
Include Inline Hyperlinks by Erik Temple.

Chapter - Hyperlink Interface


Section - Mode Switching

Hyperlink-mode is a number that varies. Hyperlink-mode is 2.

Mode switching is an action out of world applying to one topic. Understand "mode [text]" as mode switching.
Implicit mode is an action out of world applying to nothing. Understand "mode" as implicit mode.

After reading a command:
	if the player's command includes "mode" or the player's command includes "hyperlinks":
		If the player's command includes "none" or the player's command includes "off":
			Now hyperlink-mode is 0;
			Now the command prompt is ">";
		Otherwise if the player's command includes "hilite":
			Now hyperlink-mode is 1;
			Now the command prompt is ">";
		Otherwise if the player's command includes "link" or the player's command includes "on" or the player's command includes "links":
			Now hyperlink-mode is 2;
			Now the command prompt is "[link]look[end link] - [link]commands[end link]>";
		Otherwise if the player's command includes "blind" or the player's command includes "accessible" or the player's command includes "impaired":
			Now hyperlink-mode is 3;
			Now the command prompt is ">";
		Otherwise:
			Say "(Use the mode command to switch between different modes of presenting this story. The available modes are[line break]none - There will be no hiliting and no text[line break]hilite - Keywords, object names, and other important text is hilited[line break]links - Keywords, object names, and important text becomes links that enter commands[line break]accessible - Like hilite, except hiliting is done *like this* rather than using text color[line break]Type 'mode mode-of-choice' to change the mode.)";
		If hyperlink-mode is 0:
			Say "(All hiliting and linking is disabled. You can re-enable it with the 'mode' command. Try 'mode help' for a description of available modes.)";
		If hyperlink-mode is 1:
			Say "(Normal hiliting is enabled. You can change the mode with the 'mode' command. Try 'mode help' for a description of available modes.)";
		if hyperlink-mode is 2:
			Say "(Linking and hiliting is enabled. You can disable it with the 'mode' command. Try 'mode help' for a description of available modes. Every action necessary to complete the game is possible in this mode, but some fun but unecessary actions are not accessible.)";
		if hyperlink-mode is 3:
			Say "(Accessible mode enabled. You can change the mode with the 'mode' command. Try 'mode help' for a description of available modes.)".

To decide whether hyperlinks are currently enabled:
	if hyperlink-mode is 2, decide yes;
	decide no.
	
To decide whether hyperlinks are currently disabled:
	If hyperlink-mode is 2, decide no;
	decide yes.

To say end link: [These links only appear hilited in mode 2.]
	let hyperlink index be a number;
	stop capturing text;
	if the hyperlinked text is "":
		now the hyperlinked text is "[captured text]";
	now the hyperlinked command is "[captured text]";
	If hyperlink-mode is 0:
		Say "[hyperlinked text]";
	If hyperlink-mode is 1:
		Say "[hyperlinked text]";
	If hyperlink-mode is 2:
		if the hyperlinked command is listed in the hyperlink list:
			repeat with count running from 1 to the number of entries in the hyperlink list:
				if entry (count) of the hyperlink list is hyperlinked command:
					let hyperlink index be count;
		otherwise unless the hyperlinked command is "":
			add hyperlinked command to hyperlink list;
			let hyperlink index be the number of entries of hyperlink list;
		say "[set link (hyperlink index)][hyperlinked text][terminate link]";
	If hyperlink-mode is 3:
		Say "[hyperlinked text]".
		
To say end link hilite: [Links ended this way will hilite in modes 1 and 3.]
	let hyperlink index be a number;
	stop capturing text;
	if the hyperlinked text is "":
		now the hyperlinked text is "[captured text]";
	now the hyperlinked command is "[captured text]";
	If hyperlink-mode is 0:
		Say "[hyperlinked text]";
	If hyperlink-mode is 1:
		Say "[interest][hyperlinked text][normal]";
	If hyperlink-mode is 2:
		if the hyperlinked command is listed in the hyperlink list:
			repeat with count running from 1 to the number of entries in the hyperlink list:
				if entry (count) of the hyperlink list is hyperlinked command:
					let hyperlink index be count;
		otherwise unless the hyperlinked command is "":
			add hyperlinked command to hyperlink list;
			let hyperlink index be the number of entries of hyperlink list;
		say "[set link (hyperlink index)][hyperlinked text][terminate link]";
	If hyperlink-mode is 3:
		Say "*[hyperlinked text]*".
		
When play begins:
	Now the command prompt is "[link]look[end link] - [link]commands[end link]>";
	Say "[bracket]This game can be played in several different modes. Currently, it is in hyperlink mode. Hyperlinks can be turned off. This game can also be played in hilite mode, where important keywords are hilited, and accessible mode, which uses a form of hiliting friendly to the visually impaired. Use the 'mode' command to change the mode. Try 'mode help' to get a description of available modes.[close bracket]".
	


Section - Glulx formatting for hilite mode

[These are the colors used when the interface is in hilite mode]

Table of User Styles (continued) 
style name	boldness	glulx color
special-style-1	bold-weight	g-faded-blue
special-style-2	bold-weight	g-faded-red

Table of Common Color Values (continued)
glulx color value	assigned number
g-faded-blue	2846917
g-faded-red	9257538

To say interest:
	say first custom style.
To say command:
	say second custom style.
To say normal:
	say roman type.
To say italic:
	say italic type.



Section - Printing names of things

[Anytime the name of an object is printed, turn it into a link.]
	
To say x (bob - a thing):
	Say "[link][the printed name of bob][as]x [the printed name of bob][end link]".
		
Rule for printing the name of a thing (called Bob):
	Say "[link][the printed name of Bob][as]x [the printed name of Bob][end link]".
	


Section - Hyperlink Actions

A hyperlink action is a kind of thing.
A hyperlink action has some text called the command text.

[Projected hyperlink actions appear in the 'global' command list as well as the object list.]
A hyperlink action can be projected. A hyperlink action is usually not projected.

An object has a list of hyperlink actions called the special actions.
A object can be action-list-suppressed. An object is usually not action-list-suppressed.

A standard hyperlink action is a kind of hyperlink action.
A global hyperlink action is a kind of hyperlink action.

The active item is an object that varies.
The action fruitful rules is an object-based rulebook with default success.
Action fruitful rule for something (this is the actions are fruitful by default rule):
	Rule succeeds.

Section - Standard actions


[Define some actions that would reasonably apply to every object in the game.]

The take action is a standard hyperlink action with printed name "take [if the active item is not proper-named]the [end if][printed name of the active item]" and command text "get [printed name of the active item]".
Action fruitful rule for the take action:
	If the active item is fixed in place:
		Rule fails;
	If the player encloses the active item:
		Rule fails;
	If the active item is a person:
		Rule fails.
		
The drop action is a standard hyperlink action with printed name "drop [if the active item is not proper-named]the [end if][printed name of the active item]" and command text "drop [printed name of the active item]".
Action fruitful rule for the drop action:
	If the player does not enclose the active item:
		Rule fails.
		
The enter-enterable-container-action is a projected standard hyperlink action with printed name "enter the [printed name of the active item]" and command text "enter [printed name of the active item]".
Action fruitful rule for enter-enterable-container-action:
	If the active item is not enterable:
		Rule fails;
	If the active item encloses the player:
		Rule fails.
		
The exit-container-action is a standard hyperlink action with printed name "exit" and command text "exit".
Action fruitful rule for exit-container-action:
	If the active item does not enclose the player:
		Rule fails.

The open-openable-thing-action is a standard hyperlink action with printed name "open it" and command text "open [printed name of the active item]".
Action fruitful rule for open-openable-thing-action:
	If the active item is not openable:
		Rule fails;
	If the active item is open:
		Rule fails.
		
The close-openable-thing-action is a standard hyperlink action with printed name "close it" and command text "close [printed name of the active item]".
Action fruitful rule for close-openable-thing-action:
	If the active item is not openable or the active item is closed:
		Rule fails.


[Define some global actions that are always available.]

The look action is a global hyperlink action with printed name "look around" and command text "look".

The wait action is a global hyperlink action with printed name "do nothing at all" and command text "wait".
	
The list inventory action is a global hyperlink action with printed name "see what you are carrying" and command text "inventory".


	
Section - Listing object actions
		
After examining something (called the item) when hyperlinks are currently enabled (this is the list available object actions rule):
	If the item is action-list-suppressed:
		Continue the action;
	Now the active item is the item;
	Let L be a list of hyperlink actions;
	Repeat with B running through every standard hyperlink action:
		Consider the action fruitful rules for B;
		If the rule succeeded:
			Add B to L, if absent;
	Repeat with B running through the special actions of the item:
		Consider the action fruitful rules for B;
		If the rule succeeded:
			Add B to L, if absent;
	If the number of entries in L is not 0:
		If the number of entries in L is 1:
			Say "You could [link][printed name of entry 1 in L][as][command text of entry 1 in L][end link].";
		Otherwise:
			Say "You could..";
			Repeat with A running through L:
				Say "  [link][printed name of A][as][command text of A][end link].";
	Continue the action.
	
Section - Listing global actions

Listing basic commands is an action out of world applying to nothing.
Understand "commands" as listing basic commands.

Carry out listing basic commands:
	Let L be a list of hyperlink actions;
	Now the active item is nothing;
	Repeat with B running through every global hyperlink action:
		Consider the action fruitful rules for B;
		If the rule succeeded:
			Add B to L, if absent;
	Repeat with B running through the special actions of the location of the player:
		Consider the action fruitful rules for B;
		If the rule succeeded:
			Add B to L, if absent;
	If something encloses the player: [Include the special actions of anything the player happens to be inside]
		Let X be a random thing that encloses the player;
		Now the active item is X;
		Repeat with C running through the special actions of X:
			Consider the action fruitful rules for C;
			If the rule succeeded:
				Add C to L, if absent;
	Repeat with item running through every visible thing:
		Now the active item is item;
		Repeat with C running through the special actions of item:
			If C is projected:
				Consider the action fruitful rules for C;
				If the rule succeeded:
					Add C to L, if absent;
	If the number of entries in L is not 0:
		If the number of entries in L is 1:
			Say "You could [link][printed name of entry 1 in L][as][command text of entry 1 in L][end link].";
		Otherwise:
			Say "You could..";
			Repeat with A running through L:
				Say "  [link][printed name of A][as][command text of A][end link].".
	


Section - Listing Exits

[Making a room 'exits-invisible' will hide the list of exits.]
A room can be exits-visible or exits-invisible. A room is usually exits-visible.

To say closed door: say "(closed)".

To say no obvious exits: say "You can see no obvious exits."

A door has a text called passing text. Passing text of a door is usually "through".
A door has a text called closed text.  Closed text of a door is usually "[closed door]".
A door can be obvious.  Doors are usually obvious.

The exit obviousness rules are an object-based rulebook.  
The door obviousness rules are an object-based rulebook.

Last door obviousness rule for a door (called gateway) (this is the check obvious doors rule):
	if gateway is not obvious, rule fails.

An exit obviousness rule for a room (called place) (this is the darkness hides exits rule):
	if not in darkness, make no decision;
	if place is not visited, rule fails.

To decide if (way - a direction) is a listable exit:
	let place be the room way from the location;
	if place is not a room then decide no;
	consider the exit obviousness rules for place;
	if the rule failed, decide no;
	let gateway be the room-or-door way from the location;
	if gateway is a door
	begin;
		consider the door obviousness rules for gateway;
		if the rule failed, decide no;
	end if;
	decide yes.

Definition: A direction is exit-listable if it is a listable exit.

Listing exits is an activity.

The last for listing exits rule (this is the standard exit listing rule):
	let exits be the number of exit-listable directions;
	if exits is 0:
		say "[no obvious exits]";
		Stop the action;
	Let L be the list of exit-listable directions;
	If exits is 1:
		Let E be entry 1 of L;
		Say "You can only go [link][E][as][printed name of E][end link]";
		Let place be the room E from the location;
		Let gateway be the room-or-door E from location;
		If gateway is a door:
			Say " ([passing text of gateway] [link][the printed name of the gateway][as]x [the printed name of the gateway][end link]";
			If gateway is closed:
				Say " [closed text of gateway]";
			Say ")";
		If place is visited:
			Say " (to [place])";
		Say " from here.";
	Otherwise:
		Say "You can go[line break]";
		Repeat with E running through L:
			Say "  [link][E][as][printed name of E][end link]";
			Let place be the room E from the location;
			Let gateway be the room-or-door E from location;
			If gateway is a door: [Add a link to 'x door' to allow the player to examine the doorway.]
				Say " ([passing text of gateway] [link][the printed name of the gateway][as]x [the printed name of the gateway][end link]"; 
				If gateway is closed:
					Say " [closed text of gateway]";
				Say ")";
			If place is visited:
				Say " (to [place])";
			Say "[line break]".

This is the exits rule: if the location of the player is exits-visible, carry out the listing exits activity.
The exits rule is listed last in the carry out looking rules.

Listing exits is an action applying to nothing.
Understand the command "exits" as something new.
Understand "exits" as listing exits.
Carry out listing exits: carry out the listing exits activity.

[Keep doors from appearing in the room contents since they now appear in the exits list]
Before listing nondescript items of a room (called the room):
	repeat with door running through every door in the room:
		now the door is not marked for listing.





Section - Printing the name of topics (For use with Conversation Package by Eric Eve)

Include Complex Listing by Emily Short.
[Todo: Entirely replace Conversation Package's topic listing activity to remove dependancy on Complex Listing, and to properly support distinction between ask/tell.]

[There are two things we need to tweak for conversations:
	First, when listing topics, topic names should be a link to ask - not examine!
	Second, people get additional actions to greet them and list topics.
]

[Rule for printing the name of a thing (called Bob) when printing suggestion is true:
	Say "[the printed name of Bob]".]
	
Rule for printing the name of a thing (called the current topic) while listing suggested topics (this is the print ask link rule):
	If the current topic is the current interlocutor:
		If the current interlocutor is not proper-named:
			Say "the "; [Hack because the interlocutor appears before the list]
	Say "[link][the printed name of the current topic][as]ask [the printed name of the current interlocutor] about [the printed name of the current topic][end link]".

Section - Standard conversation actions (For use with Conversation Package by Eric Eve)

The greet action is a standard hyperlink action with printed name "say hello" and command text "talk to [printed name of the active item]".
Action fruitful rule for the greet action:
	If the active item is not a person:
		Rule fails;
	If the active item is the current interlocutor:
		Rule fails.
		
The suggest topics action is a standard hyperlink action with printed name "suggest conversation topics" and command text "topics".
Action fruitful rule for the suggest topics action:
	If the active item is not a person:
		Rule fails;
	If the active item is not the current interlocutor:
		Rule fails.
		



[TODO: Incorporate threaded conversation]


Hyperlink Interface ends here.

---- Documentation ----

