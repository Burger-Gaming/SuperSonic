package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.graphics.frames.FlxAtlasFrames;
import lime.utils.Assets;
import flixel.group.FlxSpriteGroup;

class PlayState extends FlxState
{
	var sanic:Runner;
	var ground:FlxSprite;
	var bg:FlxSprite;
	var thing:Float = 0;
	var fan:FlxSprite;
	public var stageList = pathList[FlxG.save.data.stage][1];

	public static var pathList:Array<Dynamic> = [ // ogg file, which zone it is
		['Act1.ogg', 'GH'],
		['Act2.ogg', 'GH'],
		['Act1.ogg', 'CP'],
		['Act2.ogg', 'CP'],
		['Act1.ogg', 'SP'],
		['Act2.ogg', 'SP'],
		['Act1.ogg', 'FB'],
		['Act2.ogg', 'FB'],
		['Act1.ogg', 'PG'],
		['Act2.ogg', 'PG'],
		['Act1.ogg', 'SS'],
		['Act2.ogg', 'SS'],
		['Act1.ogg', 'HC'],
		['Act2.ogg', 'HC'],
		['Act1.ogg', 'MS'],
	   ['Act1K.ogg', 'MS'],
	    ['Act2.ogg', 'MS'],
		['Act1.ogg', 'OO'],
		['Act2.ogg', 'OO']
	];

	override public function create()
	{
		super.create();
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;

		bg = new FlxSprite();
		bg.x = -4096;
		if (stageList == 'FB'){
			bg.x -= 250;
		}
		if (stageList == 'PG'){
			bg.y -= 250;
		}
		bg.y = 150;
		bg.frames = AssetPaths.getSparrowAtlas('bg_' + stageList + 'Z');
		bg.scale.set(2, 2);
		/*if (stageList == 'SP'){
			bg.y -= 25;
		}*/
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		if (stageList != 'OO'){
		bg.animation.addByPrefix("bg", "bg moving instance 1", 30, true);
		bg.animation.play("bg");
		}
		add(bg);
		ground = new FlxSprite();
		ground.x = -2432;
		ground.y = 435;
		ground.frames = AssetPaths.getSparrowAtlas('ground_' + stageList + 'Z');
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		if (stageList != 'OO'){
			ground.animation.addByIndices("ground", "moving ground", [10, 11, 12, 13, 14, 15, 16, 17, 18], "", 30, true);
			ground.animation.play("ground");
		} else{
			ground.animation.addByIndices("ground", "moving ground", [14], "", 30, true);
			ground.animation.play("ground");
		}
		add(ground);

		if (stageList == 'OO'){
			fan = new FlxSprite().loadGraphic('assets/images/fan.png', true, 24, 32);
			fan.animation.add('blow', [0, 1, 2, 3], 60, true);
			fan.screenCenter(Y);
			fan.screenCenter(X);
			fan.x += 300;
			fan.scale.set(6, 6);
			fan.animation.play('blow');
			add(fan);
		}
		
		sanic = new Runner(0, 435, FlxG.save.data.character);
		sanic.screenCenter(X);
		add(sanic);



		/*for (i in 0...pathList.length){
			FlxG.sound.cache('assets/music/' + pathList[i][1] + "Z/" + pathList[i][1] + pathList[i][0]);
		}*/

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
			switchStage(1);
		}
		if(FlxG.keys.justPressed.LEFT){
			switchSong(-1);
			switchStage(-1);
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

		if (FlxG.save.data.characterNum >=  9){
			FlxG.save.data.characterNum = 9;
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
			case 5:
				FlxG.save.data.character = 'super sonic';
			case 6:
				FlxG.save.data.character = 'eggman';
			case 7:
				FlxG.save.data.character = 'metal sonic';
			case 8:
				FlxG.save.data.character = 'heavy rider';
			case 9:
				FlxG.save.data.character = 'lil eggie';
		}
		trace(FlxG.save.data.characterNum);
		remove(sanic);
		sanic = new Runner(0, 435, FlxG.save.data.character);
		sanic.screenCenter(X);
		//sanic.screenCenter(Y);
		add(sanic);
	}

	public function switchSong(change:Int = 1){
		FlxG.save.data.song += change;

		if (FlxG.save.data.song < 0){
			FlxG.save.data.song = 0;
		}
		if (FlxG.save.data.song > 18){
			FlxG.save.data.song = 18;
		}
		
		if (FlxG.sound.music != null){
			FlxG.sound.music.destroy();
			FlxG.sound.playMusic('assets/music/' + pathList[FlxG.save.data.song][1] + "Z/" + pathList[FlxG.save.data.song][1] + pathList[FlxG.save.data.song][0], 1, true);
		}
		trace('assets/music/' + pathList[FlxG.save.data.song][1] + "Z/" + pathList[FlxG.save.data.song][1] + pathList[FlxG.save.data.song][0]);
	}

	public function switchStage(change:Int = 1){
		FlxG.save.data.stage += change;
		if (FlxG.save.data.stage <= 0){
			FlxG.save.data.stage = 0;
		}
		if (FlxG.save.data.stage >= 18){
			FlxG.save.data.stage = 18;
		}
		stageList = pathList[FlxG.save.data.stage][1];

		trace(stageList);
		bg.destroy();
		ground.destroy();
		if (stageList == 'OO'){
			fan.destroy();
		}

		bg = new FlxSprite();
		bg.x = -4096;
		if (stageList == 'FB'){
			bg.x -= 250;
		}
		if (stageList == 'PG'){
			bg.y -= 250;
		}
		bg.y = 150;
		bg.frames = AssetPaths.getSparrowAtlas('bg_' + stageList + 'Z');
		bg.scale.set(2, 2);
		/*if (stageList == 'SP'){
			bg.y -= 25;
		}*/
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		if (stageList != 'OO'){
		bg.animation.addByPrefix("bg", "bg moving instance 1", 30, true);
		bg.animation.play("bg");
		}
		add(bg);
		ground = new FlxSprite();
		ground.x = -2432;
		ground.y = 435;
		ground.frames = AssetPaths.getSparrowAtlas('ground_' + stageList + 'Z');
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		if (stageList != 'OO'){
			ground.animation.addByIndices("ground", "moving ground", [10, 11, 12, 13, 14, 15, 16, 17, 18], "", 30, true);
			ground.animation.play("ground");
		} else{
			ground.animation.addByIndices("ground", "moving ground", [14], "", 30, true);
			ground.animation.play("ground");
		}
		add(ground);

		if (stageList == 'OO'){
			fan = new FlxSprite().loadGraphic('assets/images/fan.png', true, 24, 32);
			fan.animation.add('blow', [0, 1, 2, 3], 60, true);
			fan.screenCenter(Y);
			fan.screenCenter(X);
			fan.x += 300;
			fan.scale.set(6, 6);
			fan.animation.play('blow');
			add(fan);
		}

		sanic.destroy();
		sanic = new Runner(0, 435, FlxG.save.data.character);
		sanic.screenCenter(X);
		add(sanic);
	}
}
