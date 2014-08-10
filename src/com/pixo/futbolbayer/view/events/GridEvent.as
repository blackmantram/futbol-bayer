package com.pixo.futbolbayer.view.events 
{
	import flash.events.Event;
	import flash.geom.Point;
	
	public class GridEvent extends Event
	{
		public static const SELECTED_POINT:String = "selectedPoint";
		
		private var _point:Point;
		
		public function get point():Point
		{
			return _point;
		}
		
		public function GridEvent(type:String, point:Point=null) 
		{
			_point = point;
			super(type);
		}
		
		override public function clone() : Event 
		{
			return new GridEvent(type, point);
		}
		
	}

}