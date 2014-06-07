package com.zhihuasi.object
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.text.TextField;
	
	public class JFSimpleButton extends JFButton
	{/**
		* 画一个有颜色的按钮
		* */
		private var txt:TextField;
		public function JFSimpleButton(_color:uint=0,_wid:uint=0,_hei:uint=0,_str:String=null)
		{
			var _bitmapData:BitmapData = new BitmapData(_wid,_hei,false,_color);
			super(_bitmapData);
			if(_str!=null){
				txt = new TextField(); txt.text = _str; 
				if(_color == 0x000000){txt.textColor=0xffffff;}
					txt.width = txt.textWidth+4; txt.x = -txt.width/2;  
					txt.height = txt.textHeight+4; txt.y = -txt.height/2; 
					txt.mouseEnabled=false;
					addChild(txt);
			}
		}
		override public function clean():void{
			if(txt){removeChild(txt); txt = null;}
			super.clean();
		}
	}
}