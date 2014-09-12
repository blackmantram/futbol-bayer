package com.pixo.futbolbayer.view.match.refereeing
{
	import com.pixo.futbolbayer.view.tweens.ShowRefereeTween;
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class PopUp
	{
		public static const START:String = "Popup.Start";
		public static const PENALTY:String = "PopUp.Penalty";
		public static const END:String = "PopUp.End";
		public static const YELLOW_CARD:String = "PopUp.YellowCard";
		public static const FAULT:String = "PopUp.Fault";
		public static const HAND_BALL:String = "PopUp.HandBall";
		public static const FREE_KICK:String = "PopUp.FreeKick";
		public static const OFF_SIDE:String = "PopUp.OffSide";
		public static const RESTART:String = "PopUp.Restart";
		
		private var popUpArray:Array;
		
		private var refereeTween:ShowRefereeTween = new ShowRefereeTween();
		
		private var callBack:Function;
		
		private var character:Sprite;
		
		private var skin:Sprite;
		
		public function PopUp(skin:Sprite)
		{
			popUpArray = [
				new PopUpState(skin.getChildByName("start") as Sprite, PopUp.START),
				new PopUpState(skin.getChildByName("penalty") as Sprite, PopUp.PENALTY),
				new PopUpState(skin.getChildByName("end") as Sprite, PopUp.END),
				new PopUpState(skin.getChildByName("yellow_card") as Sprite, PopUp.YELLOW_CARD),
				new PopUpState(skin.getChildByName("fault") as Sprite, PopUp.FAULT),
				new PopUpState(skin.getChildByName("hand_ball") as Sprite, PopUp.HAND_BALL),
				new PopUpState(skin.getChildByName("free_kick") as Sprite, PopUp.FREE_KICK),
				new PopUpState(skin.getChildByName("off_side") as Sprite, PopUp.OFF_SIDE),
				new PopUpState(skin.getChildByName("restart") as Sprite, PopUp.RESTART)
			];
			character = skin.getChildByName("character") as Sprite;
			this.skin = skin;
			hide();
		}
		
		public function setCharacter(character:DisplayObject):void
		{
			this.character.addChild(character);
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
			character.visible=false;
			for each(var popupState:PopUpState in popUpArray)
				popupState.sprite.visible = false;
		}
		
		private function play(sprite:Sprite):void
		{
			character.visible=true;
			sprite.visible = true;
			refereeTween.tween(skin);
			refereeTween.addEventListener(TweenEvent.COMPLETED, handleTweenCompleted);
		}
		
		private function handleTweenCompleted(e:TweenEvent):void
		{
			hide();
			callBack();
		}
	}
}