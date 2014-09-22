package common.utils
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class TimerUtils
	{
		public static function startTimer(delay:int, callBack:Function):Timer
		{
			var timer:Timer = new Timer(delay);
			timer.addEventListener(TimerEvent.TIMER, callBack);
			timer.start();
			return timer;
		}
		
		public static function stopTimer(timer:Timer, callBack:Function):void
		{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, callBack);
		}
	}
}