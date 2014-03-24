package com.zhihuasi.object
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;

	public class JFObject
	{
		/**
		 * 画一个有颜色的图形
		 * */
		public static function ColorSprite(_color:int,_wid:uint,_hei:uint,_center:Boolean = false):Sprite
		{
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(_color);
			sp.graphics.drawRect(0,0,_wid,_hei);
			sp.graphics.endFill();
			if(_center){sp.x = -sp.width/2; sp.y = -sp.height/2;}
			return sp;
		}
		/**
		 * 传入bmpData 生成一个居中对齐的sprite
		 * */
		public static function BmpDataSprite(_bmpData:BitmapData,_center:Boolean = true,_smooth:Boolean = false):Sprite
		{
			var sp:Sprite = new Sprite();
			var _bmp:Bitmap;
			if(_smooth){ _bmp = new Bitmap(_bmpData,"auto",true);}
			else{ _bmp = new Bitmap(_bmpData,"auto",false);}
			
			if(_center){ _bmp.x = -_bmp.width/2; _bmp.y=-_bmp.height/2; }	
			
			sp.addChild(_bmp);
			return sp;
		}
	}
}