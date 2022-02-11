package;
import flixel.FlxSprite;

class Runner extends FlxSprite{
    public function new(xPos:Float = 0, yPos:Float = 0, char:String = 'sonic'){
        super(xPos, yPos);

        x = xPos;
        y = yPos;
        

        switch(char){
            case 'sonic': // 0
                    loadGraphic('assets/images/sonicRun.png', true, 31, 38);
                    animation.add("run", [0, 1, 2, 3, 4, 5], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");

            case 'chibi sonic': // 1
                    loadGraphic('assets/images/chibiSonic.png', true, 16, 24);
                    animation.add("run", [0, 1, 2, 3], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    y += 30;
                    scale.set(6, 6);
                    animation.play("run");

            case 'tails': // 2
                    loadGraphic('assets/images/tailsRun.png', true, 39, 30);
                    animation.add("run", [1, 2, 3, 4], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");
        
            case 'chibi tails': // 3
                    loadGraphic('assets/images/chibiTails.png', true, 22, 24);
                    animation.add("run", [0, 1, 2, 3], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    y += 30;
                    scale.set(6, 6);
                    animation.play("run");

            case 'knuckles': // 4
                    loadGraphic('assets/images/knucklesRun.png', true, 34, 35);
                    animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");

            case 'chibi knuckles': // 5
		    loadGraphic('assets/images/chibiKnux.png', true, 18, 21);
                    animation.add("run", [0, 1, 2, 3], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    y += 40;
                    scale.set(6, 6);
                    animation.play("run");

            case 'mighty': // 6
                    loadGraphic('assets/images/mightyRun.png', true, 35, 33);
                    animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");

            case 'chibi mighty': // 7
                    loadGraphic('assets/images/chibiMighty.png', true, 17, 23);
                    animation.add("run", [0, 1, 2, 3], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    y += 30;
                    scale.set(6, 6);
                    animation.play("run");
			
            case 'ray': // 8
                    loadGraphic('assets/images/rayRun.png', true, 43, 38);
                    animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");
        
            case 'chibi ray': // 9
                    loadGraphic('assets/images/chibiRay.png', true, 23, 24);
                    animation.add("run", [0, 1, 2, 3], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    y += 30;
                    scale.set(6, 6);
                    animation.play("run");
			
            case 'super sonic': // 10
                    loadGraphic('assets/images/superSonicRun.png', true, 36, 35);
                    animation.add("run", [0, 1, 2, 3], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    x -= width * 2;
	            y += -25;
                    scale.set(6, 6);
                    animation.play("run");
                
            case 'eggman': // 11
                    loadGraphic(AssetPaths.eggmanRun__png, true, 58, 53); // FOXX I HATE YOU /j
                    animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 30, true);
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    y += 300;
                    scale.set(6, 6);
                    y -= height * 9 - 30;
                    animation.play("run");

            case 'metal sonic': // 12
                    loadGraphic('assets/images/metalSonicRun.png', true, 47, 27);
                    animation.add("run", [0, 1, 2, 3, 4, 5], 60, true);
                    screenCenter(Y);
                    y -= 50;
                    // sanic.screenCenter(X);
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");

            case 'heavy rider': // 13
                    loadGraphic('assets/images/HBHdriver.png', true, 53, 81);
                    animation.add("run", [0, 1, 2, 3, 4, 5, 6], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    y -= 120;
                    x -= width * 2;
                    scale.set(6, 6);
                    animation.play("run");

            case 'lil eggie': // 14
                    loadGraphic('assets/images/lilEggie.png', true, 56, 34);
                    animation.add("run", [0, 1, 2, 3, 4, 5], 60, true);
                    screenCenter(Y);
                    // sanic.screenCenter(X);
                    y += 50;
                    x -= width * 2;
                    scale.set(3, 3);
                    animation.play("run");
                    flipX = true;
            case 'sonicBS':
                loadGraphic('assets/images/sonicBS.png', true, 32, 54);
                animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
                screenCenter(X);
                screenCenter(Y);
                // sanic.screenCenter(X);
                y += 190;
                scale.set(4, 4);
                animation.play("run");
                flipX = true;
        }
        antialiasing = false;
    }
}
