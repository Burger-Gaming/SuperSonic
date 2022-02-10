package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class BlueSpheres extends FlxState {
    var globe:FlxSprite;
    var horizon:FlxSprite;
    var bg:FlxSprite;
    var yes:Runner;
    override function create() {
        super.create();

        bg = new FlxSprite();
        bg.antialiasing = false;
        bg.frames = AssetPaths.getSparrowAtlas('bsBG');
        bg.animation.addByPrefix('yes', 'bluesphere bg', 15, true);
        bg.animation.play('yes');
        bg.screenCenter(X);
        bg.screenCenter(Y);
        add(bg);
        
        /*horizon = new FlxSprite(0, 268).loadGraphic('assets/images/horizon.png');
        horizon.scale.set(4, 4);
        horizon.antialiasing = false;
        horizon.screenCenter(X);
        add(horizon);*/

        globe = new FlxSprite(0, 420);
        globe.scale.set(4, 4);
        globe.antialiasing = false;
        globe.frames = AssetPaths.getSparrowAtlas('blueSphere');
        globe.animation.addByPrefix('roll', 'bluesphere globe roll', 30, true);
        globe.animation.play('roll');
        globe.screenCenter(X);
        add(globe);

        yes = new Runner(0, 0, 'sonicBS');
        add(yes);

        FlxG.sound.playMusic('assets/music/soundtest/BlueSpheres.ogg');
    }

    override function update(elapsed:Float){
        if (FlxG.keys.justPressed.ESCAPE){
            FlxG.sound.music.destroy();
            FlxG.switchState(new SoundTest());
        }
    }
}