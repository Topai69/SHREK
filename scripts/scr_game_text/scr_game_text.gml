//// @param text_id
function scr_game_text(_text_id)
{
	switch(_text_id)
	{
		case "npc 1":
		scr_text("Hey, are you okay?");
		scr_text("I think so... maybe. Just having a bad day.");
			scr_option("Are you stuck here too?", "npc 1 - ask")
			scr_option("Womp womp", "npc 1 - mean")
		break;
		
		case "npc 1 - ask":
		scr_text("Yes. All I remember is mom telling me that dad went to the stars.");
		scr_text("But... I don’t understand. He didn’t say goodbye. He hasn’t come back yet.");
			scr_option("Before I ended up here, I was grieving too. It was so sudden.", "npc 1 - support");
			scr_option("Your dad is dead !", "npc 1 - mean_2");
		break;
		
		case "npc 1 - mean":
		scr_text("You’re so mean");
		global.paused_game = false;
		break;
		
		case "npc 1 - support":
		scr_text("Grieving?");
		scr_text("*sound*");
		scr_text("Oh, that must be the way out! Come on, let’s follow it!");
			break;
			
		
		case "npc 1 - mean_2":
		scr_text("Whaaat ? I don’t believe you. He’s gonna come back");
		scr_text("*sound*");
		scr_text("Oh, that must be the way out! Come on, let’s follow it!");
			break;
	}
}