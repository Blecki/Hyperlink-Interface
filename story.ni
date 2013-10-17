"Hyperlink Interface Test" by Anthony Casteel

Include Hyperlink Interface by Anthony Casteel.
Include Conversation Package by Eric Eve.
Include Complex Listing by Emily Short.

The void is a room.
The player is in the void.

The sceptre is a thing in the void.
The box is an enterable container in the void.

Bob is a man in the void.
The ask-suggestions of Bob are { sceptre }.
The tell-suggestions of Bob are { box }.

Response of Bob when asked about the sceptre:
	Say "'That's a fine wand,' Bob says.".
Response of Bob when told about the box:
	Say "'Box? Where? Do you mean the time machine?'".
	
Put the sceptre in the box is a standard hyperlink action with printed name "put the sceptre in the box" and command text "put sceptre in box".
Action fruitful for put the sceptre in the box:
	If the player does not enclose the sceptre, rule fails.
The special actions of the sceptre are { put the sceptre in the box }.
