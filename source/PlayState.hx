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
	var sanic:Runner;
	var ground:FlxSprite;
	var bg:FlxSprite;

	public static var pathList:Array<Dynamic> = [ // ogg file, which zone it is
		['Act1.ogg', 'GH'],
		['Act2.ogg', 'GH'],
		['Act1.ogg', 'CP'],
		['Act2.ogg', 'CP'],
		['Act1.ogg', 'SP'],
		['Act2.ogg', 'SP'],
		['Act1.ogg', 'FB'],
		['Act2.ogg', 'FB'],
		['Act1.ogg', 'PG']
	];

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
		
		sanic = new Runner(0, 0, FlxG.save.data.character);
		sanic.screenCenter(X);
		add(sanic);


		for (i in 0...pathList.length){
			FlxG.sound.cache('assets/music/' + pathList[i][1] + "Z/" + pathList[i][1] + pathList[i][0]);
		}

		if (FlxG.sound.music == null){
			FlxG.sound.playMusic('assets/music/' + pathList[FlxG.save.data.song][1] + "Z/" + pathList[FlxG.save.data.song][1] + pathList[FlxG.save.data.song][0], 1, true);
		}
		trace('assets/music/' + pathList[FlxG.save.data.song][1] + "Z/" + pathList[FlxG.save.data.song][1] + pathList[FlxG.save.data.song][0]);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		/*for (i in 0...list.length){
			FlxG.sound.music.play(list[0][1]);
		}*/
		if(FlxG.keys.justPressed.RIGHT){
			switchSong(1);
		}
		if(FlxG.keys.justPressed.LEFT){
			switchSong(-1);
		}

		if (FlxG.keys.justPressed.UP){
			switchChar(1);
		}
		if (FlxG.keys.justPressed.DOWN){
			switchChar(-1);
		}
	}

	public function switchChar(change:Int = 1){
		FlxG.save.data.characterNum += change;

		if (FlxG.save.data.characterNum >=  5){
			FlxG.save.data.characterNum = 5;
			//FlxG.save.data.character = '';
		}
		if (FlxG.save.data.characterNum <= 0){
			FlxG.save.data.characterNum = 0;
			//FlxG.save.data.character = 'sonic';
		}
		switch(FlxG.save.data.characterNum){
			case 0:
				FlxG.save.data.character = 'sonic';
			case 1:
				FlxG.save.data.character = 'tails';
			case 2:
				FlxG.save.data.character = 'knuckles';
			case 3:
				FlxG.save.data.character = 'mighty';
			case 4:
				FlxG.save.data.character = 'ray';
			case 4:
				FlxG.save.data.character = 'super sonic';
		}
		trace(FlxG.save.data.characterNum);
		remove(sanic);
		sanic = new Runner(0, 0, FlxG.save.data.character);
		sanic.screenCenter(X);
		sanic.screenCenter(Y);
		add(sanic);
	}

	public function switchSong(change:Int = 1){
		FlxG.save.data.song += change;

		if (FlxG.save.data.song < 0){
			FlxG.save.data.song = 0;
		}
		if (FlxG.save.data.song > 8){
			FlxG.save.data.song = 8;
		}
		
		if (FlxG.sound.music != null){
			FlxG.sound.music.stop();
			FlxG.sound.playMusic('assets/music/' + pathList[FlxG.save.data.song][1] + "Z/" + pathList[FlxG.save.data.song][1] + pathList[FlxG.save.data.song][0], 1, true);
		}
		trace('assets/music/' + pathList[FlxG.save.data.song][1] + "Z/" + pathList[FlxG.save.data.song][1] + pathList[FlxG.save.data.song][0]);
	}
}
