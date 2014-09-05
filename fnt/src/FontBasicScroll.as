package  
{
	import flash.display.BitmapData;
	import flash.events.Event;
	
	/**
	 * 滚动的数字
	 * @author runinspring@gmail.com
	 */
	public class FontBasicScroll extends FontBasic 
	{
		private var scroll:Boolean;
		public var scrollTime:uint = 500;//滚动的时间.默认0.5秒
		private var numAdd:Number;
		public function FontBasicScroll(_bmd:BitmapData, _fnt:Object, _double0:Boolean = false, _smooth:Boolean = false, _point:Boolean = false, _align:String = "left", _scroll:Boolean = false) 
		{
			super(_bmd, _fnt, _double0, _smooth, _point, _align);
			scroll = _scroll;
		}
		override protected function renderStart(_str:String):void 
		{
			if (!scroll) {
				render(_str);
			}else {
				//numAdd = oldn
				//trace("renderStart");
				//trace(numOld, numNow)
				
				if (numNow < 0) { numAdd = numOld / 60/(scrollTime/1000); }
				else { numAdd = (numOld - numNow) / 60 / (scrollTime / 1000); }
				this.addEventListener(Event.ENTER_FRAME, onEFHandler);
			}
		}
		override protected function renderStop():void 
		{
			//trace("renderStop");
			this.removeEventListener(Event.ENTER_FRAME, onEFHandler);
		}
		private function onEFHandler(e:Event):void 
		{
			numNow += numAdd;
			if (numNow <= 0) { numNow = 0; }
			else {
				if (numNow > numOld) {
					numNow = numOld;
					renderStop();
				}
			}
			render(numToString(Math.floor(numNow)));
		}
		
	}

}