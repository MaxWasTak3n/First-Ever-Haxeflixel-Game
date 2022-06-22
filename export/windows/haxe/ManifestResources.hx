package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_font_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei5293y4:typey4:TEXTy9:classNamey31:__ASSET__assets_data_room1_jsony2:idy26:assets%2Fdata%2Froom1.jsongoR0i7042R1R2R3y31:__ASSET__assets_data_room1_ogmoR5y26:assets%2Fdata%2Froom1.ogmogoR0i47604R1y4:FONTR3y30:__ASSET__assets_fonts_font_ttfR5y25:assets%2Ffonts%2Ffont.ttfgoR0i1302R1y5:IMAGER3y32:__ASSET__assets_icons_iconog_pngR5y27:assets%2Ficons%2FiconOG.pnggoR0i792R1R12R3y40:__ASSET__assets_images_bighousefront_pngR5y35:assets%2Fimages%2FBigHouseFront.pnggoR0i1126R1R12R3y33:__ASSET__assets_images_button_pngR5y28:assets%2Fimages%2Fbutton.pnggoR0i1040R1R12R3y31:__ASSET__assets_images_coin_pngR5y26:assets%2Fimages%2Fcoin.pnggoR0i1019R1R12R3y33:__ASSET__assets_images_health_pngR5y28:assets%2Fimages%2Fhealth.pnggoR0i956R1R12R3y37:__ASSET__assets_images_housesmall_pngR5y32:assets%2Fimages%2FhouseSmall.pnggoR0i336R1R12R3y31:__ASSET__assets_images_logo_pngR5y26:assets%2Fimages%2Flogo.pnggoR0i528R1R12R3y33:__ASSET__assets_images_player_pngR5y28:assets%2Fimages%2Fplayer.pnggoR0i354R1R12R3y31:__ASSET__assets_images_sign_pngR5y26:assets%2Fimages%2Fsign.pnggoR0i1553R1R12R3y32:__ASSET__assets_images_tiles_pngR5y27:assets%2Fimages%2Ftiles.pnggoR0i149R1R12R3y29:__ASSET__assets_images_xp_pngR5y24:assets%2Fimages%2Fxp.pnggoR0i1480231R1y5:MUSICR3y35:__ASSET__assets_music_mainmusic_oggR5y30:assets%2Fmusic%2FmainMusic.ogggoR0i4504R1y5:SOUNDR3y33:__ASSET__assets_sounds_select_oggR5y28:assets%2Fsounds%2Fselect.ogggoR0i5794R1R38R3y31:__ASSET__flixel_sounds_beep_oggR5y26:flixel%2Fsounds%2Fbeep.ogggoR0i33629R1R38R3y33:__ASSET__flixel_sounds_flixel_oggR5y28:flixel%2Fsounds%2Fflixel.ogggoR0i15744R1R9R3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R9R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i519R1R12R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i3280R1R12R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_room1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_room1_ogmo extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_font_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_iconog_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bighousefront_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_housesmall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_sign_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_xp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_mainmusic_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_select_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/room1.json") @:noCompletion #if display private #end class __ASSET__assets_data_room1_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/room1.ogmo") @:noCompletion #if display private #end class __ASSET__assets_data_room1_ogmo extends haxe.io.Bytes {}
@:keep @:font("assets/fonts/font.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_font_ttf extends lime.text.Font {}
@:keep @:image("assets/icons/iconOG.png") @:noCompletion #if display private #end class __ASSET__assets_icons_iconog_png extends lime.graphics.Image {}
@:keep @:image("assets/images/BigHouseFront.png") @:noCompletion #if display private #end class __ASSET__assets_images_bighousefront_png extends lime.graphics.Image {}
@:keep @:image("assets/images/button.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/coin.png") @:noCompletion #if display private #end class __ASSET__assets_images_coin_png extends lime.graphics.Image {}
@:keep @:image("assets/images/health.png") @:noCompletion #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:keep @:image("assets/images/houseSmall.png") @:noCompletion #if display private #end class __ASSET__assets_images_housesmall_png extends lime.graphics.Image {}
@:keep @:image("assets/images/logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/sign.png") @:noCompletion #if display private #end class __ASSET__assets_images_sign_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/xp.png") @:noCompletion #if display private #end class __ASSET__assets_images_xp_png extends lime.graphics.Image {}
@:keep @:file("assets/music/mainMusic.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_mainmusic_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/select.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_select_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/fonts/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/fonts/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("export/windows/obj/tmp/manifest/default.json") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_font_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_font_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/font.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "JoystixMonospace-Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_font_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_font_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_font_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_font_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_font_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_font_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
