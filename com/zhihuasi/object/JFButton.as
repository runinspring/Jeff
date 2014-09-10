package com.zhihuasi.object
{
	import com.zhihuasi.tool.JFFliter;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class JFButton extends Sprite
	{
		private var container:Sprite;
		private var containerAdd:Sprite;//添加的内容
		private var _allowTouch:Boolean = true;
		public var _allowDown:Boolean = true;//可以有点击效果
		public var id:uint;
		private var dark:Boolean;//颜色轻重
		public function JFButton(_data:BitmapData,_dark:Boolean=true)
		{
			dark = _dark;
			container = new Sprite(); addChild(container); 
			var bmp:Bitmap = new Bitmap(_data); 
			bmp.smoothing = true;
			container.addChild(bmp);
			bmp.x = -uint(bmp.width / 2); bmp.y = -uint(bmp.height / 2);
			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onUp);
			this.addEventListener(MouseEvent.MOUSE_OUT, onOut);
		}
		public function addBMP(item:Bitmap):void{//往按钮里添加图片
			if(!containerAdd) containerAdd = new Sprite(); container.addChild(containerAdd);
			item.smoothing = true;
			containerAdd.addChild(item);
		}
		public function addItem(item:DisplayObject):void{//往按钮里添加内容
			if(!containerAdd) containerAdd = new Sprite(); container.addChild(containerAdd);
			containerAdd.addChild(item);
		}
		public function cleanItem():void{
			if(containerAdd) containerAdd.removeChildren();
		}
		private function onOut(e:MouseEvent):void 
		{
			if (_allowTouch) {
				this.filters = JFFliter.Normal;
				container.scaleX = container.scaleY = 1;
			}
		}		
		private function onDown(e:MouseEvent = null):void 
		{
			if (_allowTouch && _allowDown) {
				if(dark){this.filters = JFFliter.Dark;}
				else {this.filters = JFFliter.LightDark;}				
				container.scaleX = container.scaleY = 0.96;
			}
		}		
		private function onUp(e:MouseEvent):void 
		{
			if (_allowTouch) {
				this.filters = JFFliter.Normal;
				container.scaleX = container.scaleY = 1;
			}
		}
		public function set allowTouch(_boo:Boolean):void 
		{ 
			_allowTouch = _boo; 
			switch(_allowTouch)
			{
				case true:
					this.filters = JFFliter.Normal;
					break;
				case false:
					this.filters = JFFliter.Dark;
					break;
			}
		}
		public function get allowTouch():Boolean { return _allowTouch; }
		public function set allowDown(_val:Boolean):void{
			_allowDown = _val;
			if(_allowDown){ onDown(); }
		}
		public function clean():void
		{
			if(container){
				this.removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
				this.removeEventListener(MouseEvent.MOUSE_UP, onUp);
				this.removeEventListener(MouseEvent.MOUSE_OUT, onOut);
				removeChild(container); container = null;
				this.filters = null;
			}
		}
	}
}