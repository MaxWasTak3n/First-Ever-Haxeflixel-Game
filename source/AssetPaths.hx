package;


class AssetPaths
{
    public static function font(key:String)
    {
            return 'assets/fonts/$key.ttf';
    }

    public static function image(key:String)
        {
                return 'assets/images/$key.png';
        }

    public static function ogmo(key:String)
        {
                return 'assets/data/$key.ogmo';
        }

    public static function json(key:String)
        {
                return 'assets/data/$key.json';
        }
}