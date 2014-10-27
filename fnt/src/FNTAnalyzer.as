package  
{
	/**
	 * 解析fnt格式的工具
	 * @author runinspring@gmail.com
	 */
	public class FNTAnalyzer 
	{
		
		public static function analyze(_str:String):Object {
			var obj:Object = new Object();
			var arr:Array = _str.split("char ");
			var len:uint = arr.length;
			var str2:String;
			var num1:int, num2:int;
			var letter:String;
			for (var i:uint = 1; i < len; i++) {
				str2 = arr[i];
				num1 = str2.lastIndexOf("letter=");
				num2 = str2.lastIndexOf('"');
				letter = str2.slice(num1 + 8, num2);
				//trace("letter=" + letter + ";");
				obj[letter] = new Object();
				num1 = str2.indexOf("id=");
				num2 = str2.indexOf("x=");
				obj[letter].id = str2.slice(num1 + 3, num2 - 1);
				//trace("id=" + obj[letter].id + ";");
				num1 = num2;
				num2 = str2.indexOf("y=");
				obj[letter].x = str2.slice(num1 + 2, num2 - 1);
				//trace("x=" + obj[letter].x + ";");
				num1 = num2;
				num2 = str2.indexOf("width=");
				obj[letter].y = str2.slice(num1 + 2, num2 - 1);
				//trace("y=" + obj[letter].y + ";");
				num1 = num2;
				num2 = str2.indexOf("height=");
				obj[letter].width = str2.slice(num1 + 6, num2 - 1);
				//trace("width=" + obj[letter].width + ";");
				num1 = num2;
				num2 = str2.indexOf("xoffset=");
				obj[letter].height = str2.slice(num1 + 7, num2 - 1);
				//trace("height=" + obj[letter].height + ";");
				num1 = num2;
				num2 = str2.indexOf("yoffset=");
				obj[letter].xoffset = str2.slice(num1 + 8, num2 - 1);
				//trace("xoffset=" + obj[letter].xoffset + ";");
				num1 = num2;
				num2 = str2.indexOf("xadvance=");
				obj[letter].yoffset = str2.slice(num1 + 8, num2 - 1);
				//trace("yoffset=" + obj[letter].yoffset + ";");
				num1 = num2;
				num2 = str2.indexOf("page=");
				obj[letter].xadvance = str2.slice(num1 + 9, num2 - 1);
				//trace("xadvance=" + obj[letter].xadvance + ";");
				
				//trace("------")
			}
			//trace(obj[8].width, obj[8].height);
			return obj;
		}
	}
}