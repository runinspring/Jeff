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
		/**
		 * 判断对象是否在数组中
		 * @param _target 传递进来的目标
		 * */
		public static function InArray(_target:Object,_arr:Array):Boolean
		{
			var _boo:Boolean = false;
			if(_arr.length ==0){ _boo = false;}
			else{
				for(var i:int = _arr.length-1; i>=0; i--){
					if(_target == _arr[i]){ _boo = true; break;}					
				}
			}
			return _boo;
		}
		/**
		 * 数字转换成加上逗号的字符串
		 * @param _value 要转换的数字
		 **/
		public static function addDot(_value:Number):String{
			var _arr:Array = _value.toString().split("");
			var _len:uint = _arr.length;
			var j:uint=0;
			var _arr2:Array = new Array();
			for(var i:uint=_len;i>0;i--){
				if(j%3==0 && j!=_len && j>0){
					_arr2.unshift(",");
				}
				_arr2.unshift(_arr.pop());
				j++;
			}
			return _arr2.join("");
		}
		/**
		 * 计算数组中有几个传入的对象
		 * @param _target 判断的对象 
		 * @param _arr 数组
		 * @return 几个同样的对象
		 * 
		 */		
		public static function indexOfTotal(_target:Object,_arr:Array):uint{
			var _num:uint;
			var _len:uint = _arr.length;
			for(var i:uint=0;i<_len;i++){
				if(_arr[i] == _target){
					_num+=1;
				}
			}
			return _num;
		}
	}
}