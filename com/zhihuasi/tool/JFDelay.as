package com.zhihuasi.tool
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class JFDelay
	{
		private var callBack:Function;
		private var timer:Timer;
		public function JFDelay()
		{
		}		
		public function startDelay(_numDelay:uint,_callBack:Function):void
		{
			callBack = _callBack;
			timer = new Timer(_numDelay,1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,onCallBack);
			timer.start();
		}
		public function stopDelay():void
		{
			if(timer){
				timer.stop();
				timer = null;
				//callBack = null;
			}
		}
			
		private function onCallBack(e:TimerEvent):void
		{
			if(timer){
				timer.stop();
				timer = null;
				callBack();
			}
		}		
	}
}