package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.tile.FlxTilemap;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState
{
	public static var player:Player;

	var hud:FlxCamera;

	/* WACKY MAP STUFF */
	var map:FlxOgmo3Loader;
	var ground:FlxTilemap;
	var houseSmall:FlxTilemap;
	/*END OF WACKY MAP STUFF*/

	var epicCamTween:FlxTween;

	var roomNum:Int = 1;
	var money:Int = 0;
	var health:Int = 3;
	var xpAmount:Int = 5000;
	var facing:String;

	/* HUD */
	var scoreText:FlxText;
	var healthIcon:FlxSprite;
	var healthText:FlxText;
	var xpIcon:FlxSprite;
	var xpText:FlxText;
	var hudBG:FlxSprite;
	/* END OF HUD */

	override public function create()
	{

		FlxG.mouse.visible = false;

		map = new FlxOgmo3Loader(AssetPaths.ogmo('room1'), AssetPaths.json('room1'));

		ground = map.loadTilemap(AssetPaths.image('tiles'), "walls");
		ground.follow();
		ground.setTileProperties(1, NONE);
		ground.setTileProperties(2, ANY);
		add(ground);

		houseSmall = map.loadTilemap(AssetPaths.image('houseSmall'), "house");
		houseSmall.follow();
		houseSmall.setTileProperties(1, ANY);
		add(houseSmall);

		player = new Player(100, 100);
		player.scale.set(0.6, 0.6);
		add(player);

		camera = new FlxCamera();
		hud = new FlxCamera();
		FlxG.cameras.reset(camera);
		FlxG.cameras.add(hud);
		camera.setScrollBoundsRect(0, 0, 640, 480);
		camera.follow(player, LOCKON, 0.9);
		hud.bgColor = FlxColor.TRANSPARENT;
		FlxCamera.defaultCameras = [camera];

		FlxTween.tween(camera, {zoom: 5.5}, 0.1);

		FlxG.camera.fade(FlxColor.BLACK, 0.33, true);

		/* HUD SHENANIGANS */
		hudBG = new FlxSprite().makeGraphic(FlxG.width, 100, FlxColor.BLACK);
		hudBG.alpha = 0.7;

		healthIcon = new FlxSprite(AssetPaths.image('health'));
		healthIcon.scale.set(8, 8);
		healthIcon.x = hudBG.x / 4 + (healthIcon.width / 2) + 40;
		healthIcon.y = hudBG.height / 2 - healthIcon.height / 2;

		healthText = new FlxText(0, 0, 0, health + ' / ' + health, 30);
		healthText.setFormat(AssetPaths.font("font"), 40, FlxColor.RED, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		healthText.borderSize = 1.25;
		healthText.x = healthIcon.x + 50;
		healthText.y = (healthIcon.y / 2);

		xpIcon = new FlxSprite(AssetPaths.image('xp'));
		xpIcon.scale.set(8, 8);
		xpIcon.x = (FlxG.width - xpIcon.width / 2) - 40;
		xpIcon.y = hudBG.height / 2 - xpIcon.height / 2;

		xpText = new FlxText(0, 0, 0, '' + xpAmount, 30);
		xpText.setFormat(AssetPaths.font("font"), 40, FlxColor.GREEN, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		xpText.borderSize = 1.25;
		if (xpAmount <= 1000)
		xpText.x = (xpIcon.x - xpIcon.width) - 100;
		else if (xpAmount <= 10000)
		xpText.x = (xpIcon.x - xpIcon.width) - 170;
		else 
		xpText.x = (xpIcon.x - xpIcon.width) - 200;
		xpText.y = (xpIcon.y / 2);

		hudBG.cameras = [hud];
		healthIcon.cameras = [hud];
		xpIcon.cameras = [hud];
		healthText.cameras = [hud];
		xpText.cameras = [hud];

		add(hudBG);
		add(healthIcon);
		add(xpIcon);
		add(healthText);
		add(xpText);
		/* END OF HUD SHENANIGANS */

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(player, houseSmall);
	}
}