package framslots.tools.fonts 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author runinspring@gmail.com
	 */
	public class FontBasic extends Sprite 
	{
		private var bmd:BitmapData, fnt:Object, double0:Boolean, smooth:Boolean, point:Boolean, align:String;
		protected var numOld:Number = -999, oldStr:String = "", type:String = "";
		protected var numNow:Number;//当前显示的数字
		private var container:Sprite;
		private var arrLines:Array;//存放每一行文字的数组
		private var rowPitch:uint;//增加的行距
		public function FontBasic(_bmd:BitmapData,_fnt:Object,_double0:Boolean = false,_smooth:Boolean = false,_point:Boolean = false,_align:String="left",_rowPitch:uint=0)
		{
			bmd = _bmd; fnt = _fnt; double0 = _double0; smooth = _smooth; point = _point; align = _align; rowPitch = _rowPitch;
			container = new Sprite(); addChild(container); arrLines = new Array();
		}
		public function clean():void {
			bmd = null; fnt = null;
			container.removeChildren();
			removeChild(container);
			container = null;
		}
		public function set number(_num:Number):void {
			if (numOld != _num) {
				numNow = numOld;
				numOld = _num;
				type = "number";
				renderStart(numToString(numOld));
			}
		}
		protected function numToString(_value:Number):String {
			var str:String = _value.toString();
			if (_value > 0) {
				if (double0) { str += "00"; }//加2个0	
			}
			
			
			if (point) {//加逗号
				if (str.length > 3) {//大于3位才有逗号
					var arr:Array = str.split("");
					var len:uint = arr.length;
					str = "";
					for (var i:uint = 0; i < len; i++) {
						if (i % 3 == 0 && i != len && i > 0) {
							str = ","+str;
						}
						str = arr.pop()+str;
					}
				}
			}
			return str;
		}
		public function get number():Number { return numOld; }
		public function set string(_str:String):void {
			var str:String = _str.toString();
			if (str != oldStr) {
				oldStr = str;
				type = "string";
				render(oldStr);
			}
		}
		public function get string():String { return oldStr; }
		protected function renderStart(_str:String):void {//提供给数字滚动使用
			render(_str);
		}
		protected function renderStop():void {}
		
		protected function render(_str:String):void {
			container.removeChildren(); arrLines = new Array();
			if(_str=="") return;
			var arr:Array = _str.split("");
			var len:uint = arr.length;
			var bmp:Bitmap; var char:String;
			var posx:uint = 0;
			var line:Sprite = new Sprite(); container.addChild(line); arrLines.push(line)//一行文字
			for (var i:uint = 0; i < len; i++) {
				char = arr[i]
				if(char==" "){
					posx += uint(fnt[char].xadvance);
					continue;
				}
				if (char == "/" && arr[i + 1] == "r") {//换行符
					line = new Sprite(); container.addChild(line); arrLines.push(line)//一行文字
					posx = 0;
					i++;
				}else {
					bmp = FNTBmp.getBMP(bmd, fnt, char);
					if (smooth) bmp.smoothing = true;
					line.addChild(bmp); bmp.x = posx;
					posx += uint(fnt[char].xadvance);	
				}
			}
			len = arrLines.length;
			var py:uint = 0;
			for (i = 0; i < len; i++) {
				var l:Sprite = arrLines[i];
				l.y = py;
				switch (align) {
					case "center":
						l.x = -uint(l.width / 2);
						break;
					case "left":
						l.x = 0;
						break;
					case "right":
						l.x = -uint(l.width);
						break;
				}
				py += (l.height+rowPitch);//增加行距
			}
		}
	}
}