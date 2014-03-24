package com.zhihuasi.object
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class JFSimpleButton extends JFButton
	{/**
		* 画一个有颜色的按钮
		* */
		public function JFSimpleButton(_color:uint,_wid:uint,_hei:uint)
		{
			var _bitmapData:BitmapData = new BitmapData(_wid,_hei,false,_color);
			super(_bitmapData);
		}
	}
}