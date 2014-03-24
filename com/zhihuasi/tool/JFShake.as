package com.zhihuasi.tool
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class JFShake extends Sprite
	{
		private static var target:Object;
		public static function startShake(_target:Object):void
		{
			target = _target;
			_target.addEventListener(Event.ENTER_FRAME,onEF);
		}
		public static function stopShake(_target:Object):void
		{
			_target.removeEventListener(Event.ENTER_FRAME,onEF);
			_target.x=0;
			_target.y=0;
		}
		private static function onEF(e:Event):void
		{
			target.x = 2 - JFMeth.Random(4);
			target.y = 2 - JFMeth.Random(4);
		}
	}
}