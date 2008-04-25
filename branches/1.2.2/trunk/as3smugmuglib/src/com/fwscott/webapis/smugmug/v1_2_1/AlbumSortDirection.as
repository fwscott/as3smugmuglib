package com.fwscott.webapis.smugmug.v1_2_1
{
	import com.fwscott.util.Enum;
	
	public class AlbumSortDirection extends Enum
	{
		public static const ASC:AlbumSortDirection = new AlbumSortDirection("1");
		public static const DESC:AlbumSortDirection = new AlbumSortDirection("0");
		
		public function AlbumSortDirection(val:Object) {
			super(val);
		}
	}
}