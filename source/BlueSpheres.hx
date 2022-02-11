package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;

class BlueSpheres extends FlxState {
    var globe:FlxSprite;
    //var horizon:FlxSprite;
    var bg:FlxSprite;
    var yes:Runner;
    var nextAnim:String = 'roll';
    override function create() {
        super.create();

        FlxG.sound.cache('assets/music/soundtest/BlueSpheres.ogg');
        FlxG.sound.playMusic('assets/music/soundtest/BlueSpheres.ogg');

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
        globe.animation.addByPrefix('roll-offset', 'bluesphere globe roll offset', 30, true);
        globe.animation.addByIndices('left', 'bluesphere globe turn left', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 30, false);
        globe.animation.addByIndices('right', 'bluesphere globe turn left', [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], "", 30, false);
        globe.animation.play('roll');
        globe.screenCenter(X);
        add(globe);

        yes = new Runner(0, 0, 'sonicBS');
        add(yes);

    }

    override function update(elapsed:Float){
        super.update(elapsed);
        if (FlxG.keys.justPressed.ESCAPE){
            FlxG.sound.music.destroy();
            FlxG.switchState(new SoundTest());
        }

        if (globe.animation.finished){
            globe.animation.play(nextAnim);
        }

        if(FlxG.keys.justPressed.RIGHT){
            globe.animation.stop();
            globe.animation.play('right', false);
            nextAnim = 'roll';
        }
        if(FlxG.keys.justPressed.LEFT){
            globe.animation.stop();
            globe.animation.play('left', false);
            nextAnim = 'roll-offset';
        }
    }
}