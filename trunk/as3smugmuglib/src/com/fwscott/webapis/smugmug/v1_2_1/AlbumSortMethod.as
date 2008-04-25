package com.fwscott.webapis.smugmug.v1_2_1
{
	import com.fwscott.util.Enum;
	
	public class AlbumSortMethod extends Enum
	{
		public static const POSITION:AlbumSortMethod = new AlbumSortMethod("Position");
		public static const CAPTION:AlbumSortMethod = new AlbumSortMethod("Caption");
		public static const FILENAME:AlbumSortMethod = new AlbumSortMethod("FileName");
		public static const DATE:AlbumSortMethod = new AlbumSortMethod("Date");
		public static const DATETIME:AlbumSortMethod = new AlbumSortMethod("DateTime");
		public static const DATETIMEORIGINAL:AlbumSortMethod = new AlbumSortMethod("DateTimeOriginal");
		
		public function AlbumSortMethod(val:Object) {
			super(val);
		}
	}
}