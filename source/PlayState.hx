package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.graphics.frames.FlxAtlasFrames;
import lime.utils.Assets;

class PlayState extends FlxState
{
	var sanic:FlxSprite;
	var ground:FlxSprite;
	override public function create()
	{
		super.create();

		ground = new FlxSprite();
		ground.x = -2432;
		ground.y = 425;
		ground.frames = AssetPaths.getSparrowAtlas('ground_ghz');
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		ground.animation.addByIndices("ground", "moving ground", [10, 11, 12, 13, 14, 15, 16, 17, 18], "", 30, true);
		ground.animation.play("ground");
		add(ground);

		sanic = new FlxSprite().loadGraphic('assets/images/sonicRun.png', true, 31, 38);
		sanic.animation.add("run", [0, 1, 2, 3, 4, 5], 60, true);
		sanic.screenCenter(Y);
		// sanic.screenCenter(X);
		sanic.x -= sanic.width * 2;
		sanic.scale.set(6, 6);
		sanic.animation.play("run");
		add(sanic);
		trace(ground.x);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxTween.tween(sanic, { x: 624.5 }, 3.5, { ease: FlxEase.circOut });
	}
}
