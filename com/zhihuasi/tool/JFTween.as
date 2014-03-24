package com.zhihuasi.tool
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class JFTween
	{
		private static var _obj:Object; 
		public function JFTween()
		{
		}
		private static function get obj():Object{
			if(!_obj) _obj = new Object();
			return _obj;
		}
		public static function to(_target:Object,_value:uint,_x:uint=0,_y:uint=0,_rotation:uint=0):void
		{
			var timer:Timer = new Timer(200,5);
			obj[timer] = new Object();
			obj[timer].obj = _target;
			obj[timer].value = _value;
			timer.addEventListener(TimerEvent.TIMER,onTimerHander);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,onCompleteHander);
			timer.start();
		}
		private static function onTimerHander(e:TimerEvent):void
		{
			
		}
		private static function onCompleteHander(e:TimerEvent):void
		{
			trace(e.target,e.currentTarget);
			trace(obj[e.currentTarget].obj,obj[e.currentTarget].value);
		}
	}
}