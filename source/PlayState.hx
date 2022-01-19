package;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.graphics.frames.FlxAtlasFrames;
import lime.utils.Assets;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var sanic:Runner;
	var ground:FlxSprite;
	var bg:FlxSprite;
	var thing:Float = 0;
	var fan:FlxSprite;
	public var stageList = pathList[FlxG.save.data.stage][1];

	public var songName = pathList[FlxG.save.data.stage][2];
	var songText:FlxText;
	var charText:FlxText;

	public static var pathList:Array<Dynamic> = [ // ogg file, which zone it is, song name
		['Act1.ogg', 'GH', 'Green Hill Zone - Act 1'], // Green Hill
		['Act2.ogg', 'GH', 'Green Hill Zone - Act 2'],
		['Act1.ogg', 'CP', 'Chemical Plant Zone - Act 1'], // Chemical Plant
		['Act2.ogg', 'CP', 'Chemical Plant Zone - Act 2'],
		['Act1.ogg', 'SP', 'Studiopolis Zone - Act 1'], // Studiopolis
		['Act2.ogg', 'SP', 'Studiopolis Zone - Act 2'],
		['Act1.ogg', 'FB', 'Flying Battery Zone - Act 1'], // Flying Battery
		['Act2.ogg', 'FB', 'Flying Battery Zone - Act 2'],
		['Act1.ogg', 'PG', 'Press Garden Zone - Act 1'], // Press Garden
		['Act2.ogg', 'PG', 'Press Garden Zone - Act 2'],
		['Act1.ogg', 'SS', 'Stardust Speedway Zone - Act 1'], // Stardust Speedway
		['Act2.ogg', 'SS', 'Stardust Speedway Zone - Act 2'],
		['Act1.ogg', 'HC', 'Hydrocity Zone - Act 1'], // Hydrocity
		['Act2.ogg', 'HC', 'Hydrocity Zone - Act 2'],
		['Act1.ogg', 'MS', 'Mirage Saloon Zone - Act 1'], // Mirage Saloon
	   ['Act1K.ogg', 'MS', 'Mirage Saloon Zone - Act 1 (Knuckles)'], // knuckles variant of act 1 mirage saloon
	    ['Act2.ogg', 'MS', 'Mirage Saloon Zone - Act 2'],
		['Act1.ogg', 'OO', 'Oil Ocean Zone - Act 1'], // Oil Ocean
		['Act2.ogg', 'OO', 'Oil Ocean Zone - Act 2'],
		['Act1.ogg', 'LR', 'Lava Reef Zone - Act 1'], // Lava Reef
		['Act2.ogg', 'LR', 'Lava Reef Zone - Act 2'],
		['Act1.ogg', 'MM', 'Metallic Madness Zone - Act 1'], // Metallic Madness
		['Act2.ogg', 'MM', 'Metallic Madness Zone - Act 2'],
		['Act1.ogg', 'TM', 'Titanic Monarch Zone - Act 1'], // Titanic Monarch
		['Act2.ogg', 'TM', 'Titanic Monarch Zone - Act 2'],
  ['EggReverie.ogg', 'TM', 'Egg Reverie Zone'], // Egg Reverie, stage is complicated to add so i kept it in TM
		['Act.ogg',	 'AI', 'Angel Island Zone'] // sucks that they didnt make this a full zone, just DLC
	];

	override public function create()
	{
		super.create();
		FlxG.autoPause = false;
		FlxG.mouse.visible = false;

		addStage();

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

		if (FlxG.save.data.characterNum >=  14){
			FlxG.save.data.characterNum = 14;
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
				FlxG.save.data.character = 'chibi sonic';
			case 2:
				FlxG.save.data.character = 'tails';
			case 3:
				FlxG.save.data.character = 'chibi tails';
			case 4:
				FlxG.save.data.character = 'knuckles';
			case 5:
				FlxG.save.data.character = 'chibi knuckles';
			case 6:
				FlxG.save.data.character = 'mighty';
			case 7:
				FlxG.save.data.character = 'chibi mighty';
			case 8:
				FlxG.save.data.character = 'ray';
			case 9:
				FlxG.save.data.character = 'chibi ray';
			case 10:
				FlxG.save.data.character = 'super sonic';
			case 11:
				FlxG.save.data.character = 'eggman';
			case 12:
				FlxG.save.data.character = 'metal sonic';
			case 13:
				FlxG.save.data.character = 'heavy rider';
			case 14:
				FlxG.save.data.character = 'lil eggie';
		}
		trace(FlxG.save.data.characterNum);
		sanic.destroy();
		sanic = new Runner(0, 435, FlxG.save.data.character);
		sanic.screenCenter(X);
		//sanic.screenCenter(Y);
		add(sanic);

		charText.destroy();
		charText = new FlxText();
		charText.setFormat('assets/fonts/sonic-hud-font.ttf', 32, 0xFFFFFF00, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF0000FF, true);
		charText.text = 'current character: ' + FlxG.save.data.character;
		charText.y = FlxG.height - charText.height;
		add(charText);
	}

	public function switchSong(change:Int = 1){
		FlxG.save.data.song += change;

		if (FlxG.save.data.song < 0){
			FlxG.save.data.song = 0;
		}
		if (FlxG.save.data.song > 26){
			FlxG.save.data.song = 26;
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
		if (FlxG.save.data.stage >= 26){
			FlxG.save.data.stage = 26;
		}
		stageList = pathList[FlxG.save.data.stage][1];

		trace(stageList);
		bg.destroy();
		ground.destroy();
		sanic.destroy();
		songText.destroy();
		charText.destroy();

		addStage();
	}

	public function addStage(){
		var stageLocation:Float = -4096;
		// setting the x properly so the loop looks clean
		// if you are making a stage and need to do this, look at the frameX variable in the first frame for your new value
		switch(stageList){
			case 'GH':
				stageLocation = -4096;
			case 'CP' | 'MS':
				stageLocation = -1536;
			case 'SP' | 'FB' | 'PG' | 'HC' | 'OO' | 'LR' | 'TM' | 'AI':
				stageLocation = -2048;
			case 'MM':
				stageLocation = -2034;
			case 'SS':
				stageLocation = -3072;
		}
		bg = new FlxSprite();
		bg.x = stageLocation;
		bg.y = 150;
		// adjusting location again
		switch(stageList){
			case 'CP':
				bg.y -= 200;
			case 'SP':
				bg.y -= 650;
			case 'FB':
				bg.y -= 700;
			case 'PG':
				bg.y -= 250;
			case 'SS':
				bg.y -= 500;
			case 'MS':
				bg.y -= 384.25;
			case 'OO':
				bg.y -= 244;
			case 'LR':
				bg.y = 0;
		}
		bg.frames = AssetPaths.getSparrowAtlas('bg_' + stageList + 'Z');
		bg.scale.set(2, 2);
		/*if (stageList == 'SP'){
			bg.y -= 25;
		}*/
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		bg.animation.addByPrefix("bg", "bg moving instance 1", 30, true);
		bg.animation.play("bg");
		add(bg);
		ground = new FlxSprite();
		ground.x = -2432;
		ground.y = 435;
		ground.frames = AssetPaths.getSparrowAtlas('ground_' + stageList + 'Z');
		//ground.animation.addByPrefix("ground", "moving ground", 30, true);
		// preventing the ground from disappearing
		ground.animation.addByIndices("ground", "moving ground", [10, 11, 12, 13, 14, 15, 16, 17, 18], "", 30, true);
		ground.animation.play("ground");
		add(ground);

		sanic = new Runner(0, 435, FlxG.save.data.character);
		sanic.screenCenter(X);
		add(sanic);

		songText = new FlxText();
		songText.setFormat('assets/fonts/sonic-hud-font.ttf', 32, 0xFFFFFF00, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF0000FF, true);
		//songText.screenCenter(X);
		//songText.x = FlxG.width / 2 - songText.width / 2;
		songText.text = pathList[FlxG.save.data.stage][2].toLowerCase();
		songText.y = 0;
		add(songText);

		charText = new FlxText();
		charText.setFormat('assets/fonts/sonic-hud-font.ttf', 32, 0xFFFFFF00, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF0000FF, true);
		charText.text = 'current character: ' + FlxG.save.data.character;
		charText.y = FlxG.height - charText.height;
		add(charText);
	}
	public function test(){
		
	}
}
