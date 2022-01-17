package;
import flixel.FlxSprite;

class Runner extends FlxSprite{
    public function new(xPos:Float = 0, yPos:Float = 0, char:String = 'sonic'){
        super(xPos, yPos);

        x = xPos;
        y = yPos;

        switch(char){
            case 'sonic':
                loadGraphic('assets/images/sonicRun.png', true, 31, 38);
		        animation.add("run", [0, 1, 2, 3, 4, 5], 60, true);
		        screenCenter(Y);
		        // sanic.screenCenter(X);
		        x -= width * 2;
		        scale.set(6, 6);
		        animation.play("run");

            case 'tails':
                loadGraphic('assets/images/tailsRun.png', true, 39, 30);
		        animation.add("run", [1, 2, 3, 4], 60, true);
		        screenCenter(Y);
		        // sanic.screenCenter(X);
		        x -= width * 2;
		        scale.set(6, 6);
		        animation.play("run");

            case 'knuckles':
                loadGraphic('assets/images/knucklesRun.png', true, 34, 35);
		        animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
		        screenCenter(Y);
		        // sanic.screenCenter(X);
		        x -= width * 2;
		        scale.set(6, 6);
		        animation.play("run");
            case 'mighty':
                loadGraphic('assets/images/mightyRun.png', true, 35, 33);
		        animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
		        screenCenter(Y);
		        // sanic.screenCenter(X);
		        x -= width * 2;
		        scale.set(6, 6);
		        animation.play("run");
            case 'ray':
                loadGraphic('assets/images/rayRun.png', true, 43, 38);
                animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7], 60, true);
                screenCenter(Y);
                // sanic.screenCenter(X);
                x -= width * 2;
                scale.set(6, 6);
                animation.play("run");
        }
        antialiasing = false;
    }
}