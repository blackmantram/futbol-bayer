package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class MoveDownwardsTween extends BaseTween
	{
		
		
			
			private var _object:DisplayObject;
			private var timer:Timer; //temporary timer
			private var posy:int=423.25;
			private var posy2:int=500.90;

			override public function tween(object:DisplayObject):void
			{ 
				//TODO: here lies the show referee tween 
				/*timer = new Timer(1500);
				timer.start();
				timer.addEventListener(TimerEvent.TIMER, onComplete);
				*/object.y = 0;
				
				TweenLite.to(object, 0.5, {y:posy, ease:Back.easeOut});
				_object = object;
			}
			public function tween1(object:DisplayObject):void
			{ 
				//TODO: here lies the show referee tween 
				/*timer = new Timer(1500);
				timer.start();
				timer.addEventListener(TimerEvent.TIMER, onComplete);
				*/object.y = 0;
				
				TweenLite.to(object, 0.5, {delay:0.5, y:posy2, ease:Back.easeOut});
				_object = object;
			}
			

		
	}
}