package com.pixo.futbolbayer.view
{
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchViewMediator extends Mediator
	{
		[Inject]
		public var view:MatchView;
		
		override public function onRegister():void
		{
			
		}
	}
}