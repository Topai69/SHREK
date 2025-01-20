//// @param text_id
function scr_game_text(_text_id)
{
	switch(_text_id)
	{
		case "npc 1":
		scr_text("Me: Hey, are you okay?");
		scr_text("Griefling: I think so... maybe. Just having a bad day.");
			scr_option("Are you stuck here too?", "npc 1 - ask");
			scr_option("Womp, womp.", "npc 1 - mean");
		break;
		
		case "npc 1 - ask":
		scr_text("Griefling: Yes. All I remember is mom telling me that dad went to the stars.");
		scr_text("Griefling: But... I don’t understand. He didn’t say goodbye. He hasn’t come back yet.");
			scr_option("I am grieving too...", "npc 1 - support");
			scr_option("To be honest...", "npc 1 - mean_2");
		break;
		
		case "npc 1 - mean":
		scr_text("Griefling: You’re so mean...");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		case "npc 1 - support":
		scr_text("Griefling: Grieving?");
		scr_text("Griefling: Oh, that must be the way out! Come on, let’s follow it!");
			scr_option("Wait!!", "npc 1 - wait");
		break;
			
		
		case "npc 1 - mean_2":
		scr_text("Griefling: Whaaat ? I don’t believe you. He’s gonna come back");
		scr_text("Griefling: Oh, that must be the way out! Come on, let’s follow it!");
			scr_option("Wait!!", "npc 1 - wait");
		break;
		
		case "npc 1 - wait":
		scr_text("Me: Wait!!");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		case "npc 2":
		scr_text("Me: Ouch! No! That was the way out… ");
		scr_text("Me: I almost made it!");
		scr_text("Me: Yeah, that’s what I thought until I fell into this stupid hole!");
			scr_option("What happened to you?", "npc 2 - what");
			scr_option("Did you injure yourself?", "npc 2 - what");
			break;
		
		case "npc 2 - what":
		scr_text("Griefling: I thought I was ready to move on, but I pushed too hard, too fast.");
		scr_text("Griefling: Followed the sound, thinking I could just leave everything behind.");
		scr_text("Griefling: And now look at me! Stuck in this hole, worse than before!");
			scr_option("I’m so sorry… ", "npc 2 - me too");
			scr_option("This isn’t fair!", "npc 2 - cry");
			break;
		
		case "npc 2 - me too":
		scr_text("Me: I made the same mistake");
		scr_text("Griefling: It’s okay. It happens");
		scr_text("Griefling: Hey, maybe you can still get out.");
		scr_text("Griefling: Use this. Break your way out.");
			scr_option("Thank you!", "npc 2 - thanks");
			scr_option("Wow! A hammer! Can I try it on you?", "npc 2 - hammer");
			break;
			
		case "npc 2 - cry":
		scr_text("Griefling: None of us did. Grief doesn’t exactly send you an invitation.");
		scr_text("Griefling: Hey, maybe you can still get out.");
		scr_text("Griefling: Use this. Break your way out.");
			scr_option("Thank you!", "npc 2 - thanks");
			scr_option("Wow! A hammer!", "npc 2 - hammer");
			break;
		
		case "npc 2 - thanks":
		scr_text("Me: Thank you!");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		case "npc 2 - hammer":
		scr_text("Griefling: Don't you see I'm already injured, silly?!")
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		
		case "npc 3":
		scr_text("Griefling: Oh! Hi! Oh! Oh!");
		scr_text("Me: Hello?");
		scr_text("Griefling: Maybe you can help me move this box. I’m not strong enough on my own… ");
		scr_text("Me: Are you alright?");
		scr_text("Griefling: Hmm, not really. I lost touch with a friend.");
		scr_text("Griefling: I feel like I’ve done something wrong. Ugh, why am I sharing this with a stranger.");
			scr_option("So... What happened?", "npc 3 - ask");
			scr_option("You’re right I don’t care.", "npc 3 - mean");
		break;
		
		case "npc 3 - ask":
		scr_text("Griefling: Nothing really. We sort of stopped seeing each other and both lost interest in trying.");
		scr_text("Griefling:But it hurts. Yet I don’t want to try again.");
		scr_text("Me: …");
		scr_text("Griefling: I keep trying to blame something or someone, but I should probably face the facts… ");
		scr_text("Griefling: it’s my fault. I didn’t spend enough time and then we lost touch.");
		scr_text("Me: Yeah I get the feeling.");
		scr_text("Griefling: Someone is there so you always think there is a next time.");
		scr_text("Griefling: But then there isn’t and it feels so… unfair.")
		scr_text("Griefling: Yeah... Hey how about we help eachother? ");
			scr_option("You’re right.", "npc 3 - agree");
		break;
			
		case "npc 3 - agree":
		scr_text("Me: You're right");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		case "npc 3 - mean":
		scr_text("Griefling: Hmm you’re kind of mean.");
		scr_text("Griefling: Can you help me push the box anyways.");
			scr_option("I guess.", "npc 3 - mean 2");
		break;
			
		case "npc 3 - mean 2":
		scr_text("Me: I guess.");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		case "npc 4":
		scr_text("Me: Hey... are you okay?");
		scr_text("Griefling: No. I lost my cat... and now I can’t find my way out.");
			scr_option("I’m sorry. What happened?", "npc 4 - ask");
			scr_option("Was it your fault?", "npc 4 - mean");
		break;
			
		case "npc 4 - ask":
		scr_text("Griefling: He was my best friend. Always led the way when I didn’t know where to go.");
		scr_text("Griefling: Now he’s gone, and I feel.. empty.");
			scr_option("I lost someone too you know…", "npc 4 - too");
			scr_option("Yeah, yeah", "npc 4 - mean_2");
			break;
			
			case "npc 4 - mean":
		scr_text("Hey ! It wasn’t ! He was sick ! You’re so mean!");
		scr_text("He was my best friend. Always led the way when I didn’t know where to go.");
		scr_text("Now he’s gone, and I feel.. empty.");
		scr_text("Maybe I’m supposed to guide others... like my cat did for me.");
			scr_option("Let’s go. I’ll help you.", "npc 4 - go");
		break;
		
		case "npc 4 - mean_2":
		scr_text("Me: You’re so mean, find your own way out!!!");
		global.paused_game = false;
		break;
		
		case "npc 4 - too":
		scr_text("Me: I lost someone too you know… Do you know how to get out of here?");
		scr_text("Griefling: No, this place is a maze. We are trapped and alone forever.");
		global.paused_game = false;
		break;
		
			
		case "npc 4 - go":
		scr_text("Let’s go. I’ll help you.");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
		
		case "npc 5":
		scr_text("Hello there.");
		scr_text("Hi? Is this a way out?");
		scr_text("I believe so but I’m too scared to go through the bridge.");
		scr_text("Gosh, I’m too old for this.");
		scr_text("How did you get all the way here with all the rocks, and slopes and obstacles?");
		scr_text("You mean how did I bring my old buttock all the way here? ");
		scr_text("…");
		scr_text("You see for a long time I didn’t want to believe that I got so old.");
		scr_text("I felt like I had not lived and regretted it.");
		scr_text("But once I began accepting it, I was able to advance.");
		scr_text("Except for this little predicament here… but otherwise, everything was fine.");
		scr_text("So you accepted it, and then, everything was smooth.");
		scr_text("It didn’t always go the way I wanted but it did help.");
		scr_text("Sometimes, you have go through the hardships to accept the way things are.");
		scr_text("But it’s so hard.");
		scr_text("I didn’t say it wasn’t.");
			scr_option("You’re probably right.", "npc 5 - agree");
		break;
			
		case "npc 5 - agree":
		scr_text("You’re probably right.");
		audio_play_sound(snd_background_music, 1000, true);
		global.paused_game = false;
		break;
	}
}