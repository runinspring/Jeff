package com.zhihuasi.tool
{
	import flash.filters.ColorMatrixFilter;
	import flash.utils.ByteArray;
	public class JFMeth
	{
		private static const arrDarkData:Array = [1, 0, 0, 0, -80, 0, 1, 0, 0, -80, 0, 0, 1, 0, -80, 0, 0, 0, 1, 0];
		private static const cmfDark:ColorMatrixFilter = new ColorMatrixFilter(arrDarkData);
		
		private static const arrNormalData:Array = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
		private static const cmfNormal:ColorMatrixFilter = new ColorMatrixFilter(arrNormalData);
		
		/**
		 * 深度复制数组; _arr:目标数组; 返回复制好的数组
		 * */
		public static function ArrClon(_arr:Array):Array
		{
			var byteArr:ByteArray = new ByteArray();
			byteArr.writeObject(_arr);
			byteArr.position = 0;
			return byteArr.readObject();
		}	
		/**
		 * 数组中随机取值; _arr:目标数组; 返回数组中的随机正整数
		 * */
		public static function ArrRandom(_arr:Array):uint
		{
			return _arr[Random(_arr.length)];
		}
		/**
		 * 随机正整数值; _value:最大范围; 返回范围内的随机正整数
		 * */
		public static function Random(_value:uint):uint
		{	
			return uint(Math.random() * _value);
		}
		/**
		 * 随机排序数组
		 * */
		public static function Shuffle(_arr:Array):Array
		{
			return _arr.sort(function():int{return Math.random()>.5?1:-1});
		}
	}
}