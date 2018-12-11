package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author NInjaMuffin99
 */
class Player extends FlxSprite 
{
	private var speed:Float = 200;
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		
		makeGraphic(100, 100, FlxColor.BLACK);
		speed = FlxG.random.int(150, 500);
		drag.x = 500;
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		if (FlxG.keys.anyPressed(["D", "RIGHT"]))
		{
			velocity.x = speed;
		}
		if (FlxG.keys.anyPressed(["A", "LEFT"]))
		{
			velocity.x = -speed;
		}
		
		super.update(elapsed);
	}
	
}