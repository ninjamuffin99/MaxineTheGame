package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import io.newgrounds.NG;

class PlayState extends FlxState
{
	private var player:Player;
	private var leftWall:FlxObject;
	
	private var fast:Float = 0;
	
	override public function create():Void
	{
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic("assets/music/dedicatedToTheGirlReadingThis.ogg", 0.7);
		}
		
		FlxG.camera.bgColor = FlxColor.WHITE;
		
		player = new Player(10, 350);
		add(player);
		
		var ground:FlxSprite = new FlxSprite(0, player.y + player.height).makeGraphic(FlxG.width, 10, FlxColor.BLACK);
		add(ground);
		
		leftWall = new FlxObject( -10, 0, 10, FlxG.height);
		leftWall.immovable = true;
		add(leftWall);
		
		var text:FlxText = new FlxText(20, 20, 0, "Move right to win\nShoutout to PhantomArcade3k on Newgrounds.com\nhe is an inspiration", 16);
		text.color = FlxColor.BLACK; 	
		add(text);
		
		if (NGio.isLoggedIn)
		{
			if (NG.core.user.name == "phantomarcade")
			{
				var medal = NG.core.medals.get(56060);
				if (!medal.unlocked)
					medal.sendUnlock();
			}
			
		}
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (player.x >= FlxG.width)
		{
			Ending.speedScore = fast;
			FlxG.switchState(new Ending());
		}
		
		fast += FlxG.elapsed;
		
		FlxG.collide(leftWall, player);
		
		super.update(elapsed);
	}
}