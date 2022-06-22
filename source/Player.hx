package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Player extends FlxSprite
{
	public static var speed:Float = 0.6;
	var running:Bool = false;
	var dir:String;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic(AssetPaths.image('player'), true, 12, 18);
		animation.add("left-right", [4, 5, 6, 7], 6, true);
		animation.add("down", [8, 9], 6, true);
		animation.add("up", [10, 11], 6, true);
		animation.add("idle", [0, 1, 2, 3], 6, true);
	}

	override function update(elapsed:Float)
	{
		if (speed >= 1)
			speed = 1;
		updateMovement();
		super.update(elapsed);
	}

	function updateMovement() {

		final ogSpeed = speed;
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (FlxG.keys.pressed.SHIFT) {
			running = true;
		} else {
			running = false;
		}

		if (running)
			speed = ogSpeed + 0.4;
		else
			speed = ogSpeed;

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (up) {
			PlayState.player.y = PlayState.player.y - speed;
			dir = 'UP';
		}
		if (down) {
			PlayState.player.y = PlayState.player.y + speed;
			dir = 'DOWN';
		}
		if (left) {
			PlayState.player.x = PlayState.player.x - speed;
			dir = 'LEFT';
			FlxTween.tween(PlayState.player.scale, {x:-0.6}, 0.09, { ease: FlxEase.quadInOut, type: FlxTween.ONESHOT } );
		}
		if (right) {
			PlayState.player.x = PlayState.player.x + speed;
			dir = 'RIGHT';
			FlxTween.tween(PlayState.player.scale, {x:0.6}, 0.09, { ease: FlxEase.quadInOut, type: FlxTween.ONESHOT } );
		}

		if (!right && !left && !up && !down)
			dir = 'NONE';

		
		switch (dir)
		{
			case 'UP':
				animation.play("up");
			case 'DOWN':
				animation.play("down");
			case 'LEFT':
				PlayState.player.animation.play('left-right');
			case 'RIGHT':
				PlayState.player.animation.play('left-right');
			case 'NONE':
				PlayState.player.animation.play('idle');
		}
	}
}
