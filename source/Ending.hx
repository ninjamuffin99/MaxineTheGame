package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import io.newgrounds.NG;

/**
 * ...
 * @author NInjaMuffin99
 */
class Ending extends FlxState 
{
	
	private var rate5:FlxText;
	private var blam:FlxText;
	
	public static var speedScore:Float = 0;

	override public function create():Void 
	{
		var board = NG.core.scoreBoards.get(8391);// ID found in NG project view
		board.postScore(Std.int(speedScore * 1000));
		
		var medal = NG.core.medals.get(56061);
			if (!medal.unlocked)
				medal.sendUnlock();
		
		var info:FlxText = new FlxText(0, 0, FlxG.width * 0.8, "'Time isn't a measure of quality. \nDid he make it in 2 hours, maybe even an hour? Quite possibly, yeah. With talent, tech, and abilities he practiced for a life time.' - PhantomArcade 2018\n\nTHE END\nPRESS SPACE TO RESTART", 20);
		info.alignment = FlxTextAlign.CENTER;
		info.screenCenter();
		add(info);
		
		rate5 = new FlxText(20, 20, 0, "RATE 5", 16);
		add(rate5);
		
		blam = new FlxText(FlxG.width - 170, 50, 0, "PLS NO BLAM", 16);
		add(blam);
		
		speedScore = FlxMath.roundDecimal(speedScore, 2);
		
		var record:FlxText = new FlxText(0, FlxG.height * 0.8, 0, "You beat the game in " + speedScore + " seconds", 12);
		record.screenCenter(X);
		add(record);
		
		var cred:FlxText = new FlxText(10, FlxG.height - 20, 0, "Design and music by ninjamuffin99", 16);
		add(cred);
		
		FlxG.camera.bgColor = FlxColor.BLACK;
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
		
		rate5.angle += 45 * FlxG.elapsed;
		blam.angle -= 30 * FlxG.elapsed;
		
		super.update(elapsed);
	}
	
}