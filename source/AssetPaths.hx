package;

// stealing code from fnf lol
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;

@:build(flixel.system.FlxAssets.buildFileReferences("assets", true))
class AssetPaths {
    inline static public function getSparrowAtlas(key:String)
        {
            return FlxAtlasFrames.fromSparrow('assets/images/' + key + '.png', 'assets/images/' + key + '.xml');
        }
}
