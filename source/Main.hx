package;

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.display.FPS;

class Main extends Sprite
{
	public static var fpsVar:FPS;
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState, 1, 144, 144, true, false));
		addChild(new FPS(3, 3, 0xFF0000));
	}
}
