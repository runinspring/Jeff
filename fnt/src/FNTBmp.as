package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * fnt格式的位图字体
	 * @author runinspring@gmail.com
	 */
	public class FNTBmp 
	{
		/**
		 * 
		 * @param	_sourceBMD 原始的大图像
		 * @param	_fntObj  解析好的fnt对象 
		 * @param	_str 要显示的字符
		 * @return
		 */
		public static function getBMP(_sourceBMD:BitmapData, _fntObj:Object, _str:String):Bitmap {
			var wid:uint = uint(_fntObj[_str].width);
			var hei:uint = uint(_fntObj[_str].height);
			var offx:int = int(_fntObj[_str].xoffset);
			var offy:int = int(_fntObj[_str].yoffset);
			var px:uint = uint(_fntObj[_str].x);
			var py:uint = uint(_fntObj[_str].y);
			var bmd:BitmapData = new BitmapData(wid+offx,hei+offy, true,0);
			bmd.copyPixels(_sourceBMD, new Rectangle(px,py,wid,hei),new Point(offx, offy));
			return new Bitmap(bmd);
		}
	}
}