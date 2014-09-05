package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author runinspring@gmail.com
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "/ass/font_blue.fnt", mimeType = "application/octet-stream")]
		private var fnt_blue:Class;
		[Embed(source = "/ass/font_blue.png")]
		private var png_blue:Class;
		
		[Embed(source = "ass/font_exp.fnt", mimeType = "application/octet-stream")]
		private var fnt_exp:Class;
		[Embed(source = "ass/font_exp.png")]
		private var png_exp:Class;
		
		[Embed(source = "ass/font_white.fnt", mimeType = "application/octet-stream")]
		private var fnt_white:Class;
		[Embed(source="ass/font_white.png")]
		private var png_white:Class;
		public function Main() {
			var f:FontBasic = new FontBasic(bmd_blue, obj_blue, true, true, true);			
			addChild(f);
			f.number = 45645;
		}
		public function get obj_blue():Object { return FNTAnalyzer.analyze(new fnt_blue); }
		public function get bmd_blue():BitmapData { return (new png_blue() as Bitmap).bitmapData; }
		
		public function get obj_exp():Object { return FNTAnalyzer.analyze(new fnt_exp); }
		public function get bmd_exp():BitmapData { return (new png_exp() as Bitmap).bitmapData; }
		
		public function get obj_white():Object { return FNTAnalyzer.analyze(new fnt_white); }
		public function get bmd_white():BitmapData { return (new png_white() as Bitmap).bitmapData; }
		
	}
}