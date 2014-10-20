package com.zhihuasi.tool
{
	import flash.filters.ColorMatrixFilter;
	/**
	 * ...
	 * @author runinspring@gmail.com
	 */
	public class JFFliter
	{
		//private static const arrDark:Array = [new ColorMatrixFilter(arrDarkData)];
		private static const arrDarkData:Array = [1, 0, 0, 0, -80, 0, 1, 0, 0, -80, 0, 0, 1, 0, -80, 0, 0, 0, 1, 0];
		private static const cmfDark:ColorMatrixFilter = new ColorMatrixFilter(arrDarkData);
		
		//自定义亮度
		private static var arrBrightData:Array = [1, 0, 0, 0, -80, 0, 1, 0, 0, -80, 0, 0, 1, 0, -80, 0, 0, 0, 1, 0];
		private static var cmfBright:ColorMatrixFilter;// = new ColorMatrixFilter(arrDarkData);
		
		private static const arrNormalData:Array = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
		private static const cmfNormal:ColorMatrixFilter = new ColorMatrixFilter(arrNormalData);
		
		private static const arrLightDarkData:Array = [1, 0, 0, 0, -10, 0, 1, 0, 0, -10, 0, 0, 1, 0, -10, 0, 0, 0, 1, 0];
		private static const cmfLightDark:ColorMatrixFilter = new ColorMatrixFilter(arrLightDarkData);
		
		public function JFFliter() 
		{
			
		}
		public static function get Dark():Array
		{
			return [cmfDark];
		}
		public static function setBright(value:int):Array {
			arrBrightData[4] = arrBrightData[9] = arrBrightData[14] = value;
			cmfBright = new ColorMatrixFilter(arrBrightData);
			return [cmfBright];
		}
		public static function get LightDark():Array
		{//轻的暗色
			return [cmfLightDark];
		}
		public static function get Normal():Array
		{
			return [cmfNormal];
		}
		
	}
}