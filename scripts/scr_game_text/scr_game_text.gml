//// @param text_id
function scr_game_text(_text_id)
{
	switch(_text_id)
	{
		case "npc 1":
		scr_text("Hey, are you okay?");
		scr_text("I think so... maybe. Just having a bad day.");
			scr_option("Yeah, me too...", "npc 1 - yes")
			scr_option("Are you stuck here too?", "npc 1 - ask")
		break;
		
		case "npc 1 - ask":
		scr_text("Yes. All I remember is mom telling me that dad went to the stars.");
		scr_text("But... I don’t understand. He didn’t say goodbye. He hasn’t come back yet.");
		break;
		
		case "npc 1 - yes":
		scr_text("Grieving?");
		break;
	}
}