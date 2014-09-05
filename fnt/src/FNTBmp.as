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
			var bmd:BitmapData = new BitmapData(_fntObj[_str].width+_fntObj[_str].xoffset, _fntObj[_str].height+_fntObj[_str].yoffset, true,0);
			bmd.copyPixels(_sourceBMD, new Rectangle(_fntObj[_str].x, _fntObj[_str].y, _fntObj[_str].width, _fntObj[_str].height), new Point(_fntObj[_str].xoffset, _fntObj[_str].yoffset));
			return new Bitmap(bmd);
		}
	}
}