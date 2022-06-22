package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxEase.EaseFunction;
import flixel.tweens.FlxTween;
import flixel.FlxG;
using flixel.util.FlxSpriteUtil;

class MainMenuState extends FlxState
{
	public static var ver:String = '0.1';
	var playButton:FlxButton;
	var introText:FlxText;
	var introTween:FlxTween;
	var logo:FlxSprite;
	var infiniteTween:FlxTween;

	override public function create()
	{

		if (FlxG.sound.music == null)
			{
				FlxG.sound.playMusic('assets/music/mainMusic.ogg', 0.8, true);
			}

		var bg = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.GREEN, true);
		add(bg);

		super.create();
		logo = new FlxSprite();
		logo.loadGraphic(AssetPaths.image('logo'));
		logo.x = FlxG.width / 2 - logo.width / 2;
		logo.y = FlxG.height + 500;
		introTween = FlxTween.tween(logo, { y: FlxG.height * 0.3 }, 2, { ease: FlxEase.circOut, onComplete: upDownLoop});

		logo.scale.set(10, 10);
		add(logo);


		playButton = new FlxButton(0, 0, "Play", onClick);
		playButton.x = (FlxG.width / 2) - playButton.width;
		playButton.y = FlxG.height - playButton.height - 10;
		add(playButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function onClick() {
		FlxG.switchState(new PlayState());
		FlxG.sound.play('assets/sounds/select.ogg');
	}

	function upDownLoop(tween:FlxTween):Void {
		FlxTween.tween(logo, {y: logo.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});
	}
}
