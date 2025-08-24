package sushiGame.models
{
   import flash.display.MovieClip;
   import sushiGame.screens.MiniGameKart;
   
   public class KartObject
   {
      
      public static const TYPE_CONE:String = "cone";
      
      public static const TYPE_OILSLICK:String = "oilslick";
      
      public static const TYPE_BOOSTPAD:String = "boostpad";
      
      public static const TYPE_COIN:String = "coin";
      
      public static const TYPE_STARTLINE:String = "startline";
      
      public static const TYPE_FINISHLINE:String = "finishline";
      
      public static const TYPE_FINISHBANNER:String = "finishbanner";
       
      
      public var minigame:MiniGameKart;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      public var x:Number;
      
      public var y:Number;
      
      public var speedX:Number = 0;
      
      public var speedY:Number = 0;
      
      public var type:String;
      
      public var id:Number;
      
      public var objectWidth:Number = 18;
      
      public var objectHeight:Number = 6;
      
      public var isTumbling:Boolean = false;
      
      public var jumpSpeed:Number = 0;
      
      public var tumbleStartY:Number = 0;
      
      public var isFlat:Boolean = false;
      
      public var isLine:Boolean = false;
      
      public var kartsPassed:Number = 0;
      
      public var lastSoundPlayed:Number = 0;
      
      public function KartObject(param1:MiniGameKart, param2:MovieClip, param3:String, param4:Number, param5:Number, param6:Number)
      {
         super();
         this.minigame = param1;
         this.container = param2;
         this.x = param5;
         this.y = param6;
         this.type = param3;
         this.id = param4;
         this.setupObject();
      }
      
      public function setupObject() : void
      {
         var _loc1_:KartObject = this;
         if(_loc1_.type == KartObject.TYPE_CONE)
         {
            _loc1_.clip = new minigame_kart_cone();
            _loc1_.isFlat = false;
            _loc1_.objectWidth = 18;
            _loc1_.objectHeight = 6;
         }
         else if(_loc1_.type == KartObject.TYPE_OILSLICK)
         {
            _loc1_.clip = new minigame_kart_oilslick();
            _loc1_.isFlat = true;
            _loc1_.objectWidth = 30;
            _loc1_.objectHeight = 8;
         }
         else if(_loc1_.type == KartObject.TYPE_BOOSTPAD)
         {
            _loc1_.clip = new minigame_kart_boostpad();
            _loc1_.isFlat = true;
            _loc1_.objectWidth = 30;
            _loc1_.objectHeight = 12;
         }
         else if(_loc1_.type == KartObject.TYPE_COIN)
         {
            _loc1_.clip = new minigame_kart_coin();
            _loc1_.isFlat = false;
            _loc1_.objectWidth = 8;
            _loc1_.objectHeight = 4;
         }
         else if(_loc1_.type == KartObject.TYPE_STARTLINE)
         {
            _loc1_.clip = new kart_start_bg();
            _loc1_.isFlat = true;
            _loc1_.objectWidth = 2;
            _loc1_.objectHeight = 2;
            _loc1_.isLine = true;
         }
         else if(_loc1_.type == KartObject.TYPE_FINISHLINE)
         {
            _loc1_.clip = new kart_finish_bg();
            _loc1_.isFlat = true;
            _loc1_.objectWidth = 2;
            _loc1_.objectHeight = 2;
            _loc1_.isLine = true;
         }
         else if(_loc1_.type == KartObject.TYPE_FINISHBANNER)
         {
            _loc1_.clip = new kart_finish_fg();
            _loc1_.isFlat = false;
            _loc1_.objectWidth = 2;
            _loc1_.objectHeight = 2;
            _loc1_.isLine = true;
         }
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.x = _loc1_.minigame.kartStartX + _loc1_.x - _loc1_.minigame.kart.nextX;
         _loc1_.clip.y = _loc1_.y;
      }
      
      public function updateObject() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc1_:KartObject = this;
         _loc1_.x += _loc1_.speedX;
         _loc1_.y += _loc1_.speedY;
         if(_loc1_.type == KartObject.TYPE_CONE)
         {
            _loc1_.speedX *= 0.9;
            _loc1_.speedY *= 0.9;
            if(Math.abs(_loc1_.speedX) < 0.01)
            {
               _loc1_.speedX = 0;
            }
            if(Math.abs(_loc1_.speedY) < 0.01)
            {
               _loc1_.speedY = 0;
            }
         }
         if(_loc1_.minigame.isFinishing)
         {
            _loc2_ = _loc1_.minigame.finishDecaySpeed;
            _loc1_.clip.x += _loc1_.speedX - _loc2_;
         }
         else
         {
            _loc1_.clip.x = _loc1_.minigame.kartStartX + _loc1_.x - _loc1_.minigame.kart.nextX;
         }
         if(!_loc1_.isTumbling)
         {
            _loc1_.clip.y = _loc1_.y;
         }
         if(_loc1_.isLine == false)
         {
            _loc3_ = (_loc1_.y - _loc1_.minigame.kartMinY) / (_loc1_.minigame.kartMaxY - _loc1_.minigame.kartMinY);
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            else if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            _loc1_.clip.scaleX = 0.8 + _loc3_ * 0.2;
            _loc1_.clip.scaleY = _loc1_.clip.scaleX;
            if(_loc1_.isTumbling || _loc1_.y < _loc1_.minigame.kartMinY - 15 || _loc1_.y > _loc1_.minigame.kartMaxY + 15)
            {
               if(!_loc1_.isTumbling)
               {
                  _loc1_.isTumbling = true;
                  _loc1_.jumpSpeed = -16;
                  _loc1_.tumbleStartY = _loc1_.y;
                  _loc1_.speedX = 0;
                  _loc1_.speedY = 0;
               }
               else
               {
                  _loc1_.jumpSpeed += 2;
                  _loc1_.clip.y += _loc1_.jumpSpeed;
                  _loc1_.clip.rotation += 6;
                  if(_loc1_.clip.y > _loc1_.tumbleStartY)
                  {
                     _loc1_.minigame.removeObject(_loc1_.id);
                     return;
                  }
               }
            }
         }
         if(_loc1_.clip.x < -50)
         {
            if(_loc1_.type == KartObject.TYPE_BOOSTPAD || _loc1_.type == KartObject.TYPE_COIN)
            {
               _loc1_.clip.visible = false;
            }
            else
            {
               _loc1_.minigame.removeObject(_loc1_.id);
            }
         }
      }
      
      public function hitObject(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc5_:KartObject;
         if((_loc5_ = this).type == KartObject.TYPE_CONE)
         {
            _loc6_ = param3 - param1;
            _loc7_ = param4 - param2;
            _loc8_ = Math.atan2(_loc7_,_loc6_);
            _loc9_ = _loc6_ / Math.cos(_loc8_);
            _loc10_ = _loc5_.x - param3;
            _loc11_ = _loc5_.y - param4;
            _loc12_ = Math.atan2(_loc11_,_loc10_);
            _loc13_ = _loc9_ * 1.5;
            _loc5_.speedX = Math.cos(_loc12_) * _loc13_;
            _loc5_.speedY = Math.sin(_loc12_) * _loc13_;
         }
         else if(_loc5_.type == KartObject.TYPE_FINISHLINE)
         {
            ++_loc5_.kartsPassed;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:KartObject = this;
         if(Boolean(_loc1_.clip) && Boolean(_loc1_.clip.parent))
         {
            _loc1_.clip.parent.removeChild(_loc1_.clip);
         }
         _loc1_.clip = null;
      }
   }
}
