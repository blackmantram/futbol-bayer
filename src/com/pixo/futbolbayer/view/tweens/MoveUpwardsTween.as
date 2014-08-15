package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.*;
	import com.greensock.easing.*;	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class MoveUpwardsTween extends BaseTween
	{
		
		
			
			private var _object:DisplayObject;
			private var timer:Timer; //temporary timer
			private var posy:int=192;

			override public function tween(object:DisplayObject):void
			{ 
				//TODO: here lies the show referee tween 
				/*timer = new Timer(1500);
				timer.start();
				timer.addEventListener(TimerEvent.TIMER, onComplete);
				*/object.y = 400;
				object.alpha=0;
				
				
				TweenLite.to(object, 1, {delay:.25, y:posy, alpha:1, ease:Back.easeOut});
				_object = object;
			}
			
			 public function tween1(object:DisplayObject):void
			{ 
				//TODO: here lies the show referee tween 
				/*timer = new Timer(1500);
				timer.start();
				timer.addEventListener(TimerEvent.TIMER, onComplete);
				*/object.y = 400;
				object.alpha=0;
				
				
				TweenLite.to(object, 1, {delay:1.25, y:posy, alpha:1, ease:Back.easeOut});
				_object = object;
			}
			 public function tween2(object:DisplayObject):void
			{ 
				//TODO: here lies the show referee tween 
				/*timer = new Timer(1500);
				timer.start();
				timer.addEventListener(TimerEvent.TIMER, onComplete);
				*/object.y = 400;
				object.alpha=0;
				
				
				TweenLite.to(object, 1, {delay:2.25, y:posy, alpha:1, ease:Back.easeOut});
				_object = object;
			}
			 public function tween3(object:DisplayObject):void
			 { 
				 //TODO: here lies the show referee tween 
				 /*timer = new Timer(1500);
				 timer.start();
				 timer.addEventListener(TimerEvent.TIMER, onComplete);
				 */object.y = 400;
				 object.alpha=0;
				 
				 
				 TweenLite.to(object, 1, {delay:2.25, y:224, alpha:1, ease:Back.easeOut});
				 _object = object;
			 }


		
	}
}