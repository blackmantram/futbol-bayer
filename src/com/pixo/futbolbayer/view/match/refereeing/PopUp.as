package com.pixo.futbolbayer.view.match.refereeing
{
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	import com.pixo.futbolbayer.view.tweens.ShowRefereeTween;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class PopUp
	{
		public static const START:String = "Popup.Start";
		public static const PENALTY:String = "PopUp.Penalty";
		public static const END:String = "PopUp.End";
		
		private var popUpArray:Array;
		
		private var refereeTween:ShowRefereeTween = new ShowRefereeTween();
		
		private var callBack:Function;
		
		public function PopUp(skin:Sprite)
		{
			popUpArray = [
				new PopUpState(skin.getChildByName("start") as Sprite, PopUp.START),
				new PopUpState(skin.getChildByName("penalty") as Sprite, PopUp.PENALTY),
				new PopUpState(skin.getChildByName("end") as Sprite, PopUp.END)
			];
			hide();
		}
		
		public function showAndStay(type:String):void
		{
			for each(var popupState:PopUpState in popUpArray)
				if (popupState.type == type)
					popupState.sprite.visible = true;
		}
		
		public function show(type:String, callBack:Function):void
		{
			this.callBack = callBack;
			for each(var popupState:PopUpState in popUpArray)
				if (popupState.type == type)
					play(popupState.sprite);
		}
		
		private function hide():void
		{
			for each(var popupState:PopUpState in popUpArray)
				popupState.sprite.visible = false;
		}
		
		private function play(sprite:Sprite):void
		{
			refereeTween.tween(sprite);
			refereeTween.addEventListener(TweenEvent.COMPLETED, handleTweenCompleted);
		}
		
		private function handleTweenCompleted(e:TweenEvent):void
		{
			hide();
			callBack();
		}
	}
}