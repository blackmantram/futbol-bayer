package com.pixo.futbolbayer.view.match.grid
{
	import flash.display.BitmapData;
	import flash.display.CapsStyle;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;

	/**
	 * A single BitmapData variant containing a Hexagon at the requested size/color.
	 * 
	 * @author J.C. Wichman
	 */
	public class TileBitmapData extends BitmapData
	{
		private static var _canvas:Sprite = new Sprite();
		
		public function TileBitmapData(pRadius:int, pColor:int, alpha:int) 
		{
			super (pRadius << 1, pRadius << 1, true, 0x0);
			_draw(pRadius, pColor, alpha);
		}
		
		private function _draw(pRadius:int, pColor:int, alpha:int):void 
		{
			_canvas.graphics.clear();
			
			var lRadians:Number = Math.PI / 3;

			_canvas.graphics.moveTo (pRadius * Math.cos (0), pRadius * Math.sin (0));
			_canvas.graphics.lineStyle (1, 0xffffff, 1, true, LineScaleMode.NONE, CapsStyle.SQUARE);
			_canvas.graphics.beginFill (pColor, alpha);
			
			for (var i:int = 0; i < 6; i++) {
				_canvas.graphics.lineTo (pRadius * Math.cos (lRadians * (i + 1)), pRadius * Math.sin (lRadians * (i + 1)));
			}
			
			_canvas.x = pRadius;
			_canvas.y = pRadius;
			
			draw (_canvas, _canvas.transform.matrix);
		}
		
	}

}