package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;

var image:String = 'clowmba.png';
var sound:String = 'clown.ogg';

class SoundTest extends FlxState {
    var yeah:FlxText;
    var nah:FlxText;
    var dash:FlxSprite;

    var fm:Int = 0;
    var pcm:Int = 0;
    var da:Int = 0;

    var curSelection:Int = 0;

    var thing:Array<String> = ['FM', 'PCM', 'DA'];
    override function create() {
        super.create();

        var bg:FlxSprite = new FlxSprite().loadGraphic('assets/images/soundtest/bg.png');
        bg.antialiasing = false;
        bg.scale.set(8, 8);
        add(bg);

        yeah = new FlxText();
		yeah.setFormat('assets/fonts/sonic-hud-font.ttf', 64, 0xFFFFFF, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF000000, true);
		yeah.text = 'sound test';
		yeah.screenCenter(X);
        yeah.y = 150;
		add(yeah);

        nah = new FlxText();
		nah.setFormat('assets/fonts/sonic-hud-font.ttf', 64, 0xFFFFFF, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, 0xFF000000, true);
		//nah.text = 'fm. no: ' + fm + '\npcm. no: ' + pcm + '\nda. no: ' + da;
		nah.screenCenter(X);
        nah.x -= 150;
        nah.y = 300;
		add(nah);

        dash = new FlxSprite(430, 325).loadGraphic('assets/images/soundtest/dash.png');
        dash.scale.set(8, 8);
        add(dash);

    }
    override function update(elapsed:Float) {
        super.update(elapsed);
        if (FlxG.keys.justPressed.UP){
            changeSelection(-1);
        }
        if (FlxG.keys.justPressed.DOWN){
            changeSelection(1);
        }
        if (FlxG.keys.justPressed.LEFT){
            changeNum(-1);
        }
        if (FlxG.keys.justPressed.RIGHT){
            changeNum(1);
        }
        if (FlxG.keys.justPressed.ENTER){
            comboCheck();
        }

        if (FlxG.keys.justPressed.ESCAPE){
            FlxG.sound.playMusic('assets/music/' + PlayState.pathList[FlxG.save.data.song][1] + "Z/" + PlayState.pathList[FlxG.save.data.song][1] + PlayState.pathList[FlxG.save.data.song][0], 1, true);
            FlxG.switchState(new PlayState());
        }
        nah.text = 'fm. no: ' + fm + '\npcm. no: ' + pcm + '\nda. no: ' + da;
    }

    public function changeSelection(change:Int = 1){
        curSelection += change;
        if (curSelection > 2){
            curSelection = 0;
        }
        if (curSelection < 0){
            curSelection = 2;
        }
        var tweenTo:Float = 0;

        switch(curSelection){
            case 0:
                tweenTo = 325;
            case 1:
                tweenTo = 370;
            case 2:
                tweenTo = 415;
        }

        FlxTween.tween(dash, { y: tweenTo }, 0.25);

        trace(curSelection);
        trace(thing[curSelection]);
    }
    public function changeNum(change:Int = 1){
        var maybe:String = thing[curSelection];
        switch(maybe){
            case 'FM':
                fm += change;
                if (fm < 0){
                    fm = 0;
                }
                if (fm > 99){
                    fm = 99;
                }
            case 'PCM':
                pcm += change;
                if (pcm < 0){
                    pcm = 0;
                }
                if (pcm > 99){
                    pcm = 99;
                }
            case 'DA':
                da += change;
                if (da < 0){
                    da = 0;
                }
                if (da > 99){
                    da = 99;
                }
        }
    }
    public function comboCheck(){
        if (fm == 7 && pcm == 27 && da == 87){
            FlxG.openURL('https://www.youtube.com/watch?v=a3Z7zEc7AXQ');
        }
        if (fm == 8 && pcm == 20 && da == 7){
            image = 'clowmba.png';
            sound = 'clown.ogg';
            FlxG.switchState(new ImgState());
        }
        if (fm == 6 && pcm == 16 && da == 8){
            image = 'fard.png';
            sound = 'fard.ogg';
            FlxG.switchState(new ImgState());
        }
    }
}

class ImgState extends FlxState {
    override function create(){
        var bg:FlxSprite = new FlxSprite().loadGraphic('assets/images/soundtest/' + image);
        add(bg);

        FlxG.sound.playMusic('assets/music/soundtest/' + sound);
    }
    override function update(elapsed:Float){
        if (FlxG.keys.justPressed.ESCAPE){
            FlxG.sound.music.destroy();
            FlxG.switchState(new SoundTest());
        }
    }
}