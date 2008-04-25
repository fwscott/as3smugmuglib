package com.fwscott.webapis.smugmug.v1_2_2
{
	import com.fwscott.util.Enum;
	
	public class PinnedType extends Enum
	{
		public static const LEFT:PinnedType = new PinnedType("Left");
		public static const RIGHT:PinnedType = new PinnedType("Right");	
		public static const CENTER:PinnedType = new PinnedType("Center");	
		public static const TOP:PinnedType = new PinnedType("Top");
		public static const BOTTOM:PinnedType = new PinnedType("Bottom");
		public static const TOPLEFT:PinnedType = new PinnedType("TopLeft");
		public static const TOPRIGHT:PinnedType = new PinnedType("TopRight");
		public static const BOTTOMLEFT:PinnedType = new PinnedType("BottomLeft");
		public static const BOTTOMRIGHT:PinnedType = new PinnedType("BottomRight");
		public static const TILE:PinnedType = new PinnedType("Tile");
		
		public function PinnedType(val:Object) {
			super(val);
		}
	}
}