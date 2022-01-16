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
	var bg:FlxSprite;

	public static var list:Array<String> = ['GHZ/Act1.ogg', 'GHZ/Act2.ogg'];

	override public function create()
	{
		super.create();
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;

		bg = new FlxSprite();
		bg.x = -4096;
		bg.y = 100;
		bg.frames = AssetPaths.getSparrowAtlas('bg_ghz');
		bg.scale.set(2, 2);
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		bg.animation.addByPrefix("bg", "bg moving instance 1", 30, true);
		bg.animation.play("bg");
		add(bg);

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

		if (FlxG.sound.music == null){
			FlxG.sound.playMusic('assets/music/' + list[FlxG.save.data.song], 1, true);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxTween.tween(sanic, { x: 624.5 }, 3.5, { ease: FlxEase.circOut });
		/*for (i in 0...list.length){
			FlxG.sound.music.play(list[0][1]);
		}*/
		if(FlxG.keys.justPressed.RIGHT){
			switchSong(1);
		}
		if(FlxG.keys.justPressed.LEFT){
			switchSong(-1);
		}
	}

	public function switchSong(change:Int = 1){
		FlxG.save.data.song += change;

		if (FlxG.save.data.song < 0){
			FlxG.save.data.song = 0;
		}
		if (FlxG.save.data.song > 1){
			FlxG.save.data.song = 1;
		}

		if (FlxG.sound.music != null){
			FlxG.sound.music.stop();
			FlxG.sound.playMusic('assets/music/' + list[FlxG.save.data.song], 1, true);
		}
	}
}
