package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   import sushiGame.screens.*;
   
   public class HotshotEnemy
   {
      
      private static const _2PI:Number = Math.PI * 2;
      
      public static const ACTION_POPUP:String = "popup";
      
      public static const ACTION_WALK:String = "walk";
      
      public static const ACTION_FLY:String = "fly";
      
      public static const ACTION_JUMP:String = "jump";
      
      public static const TYPE_PEPPER:String = "habandito";
      
      public static const TYPE_GUAC:String = "guacamonster";
      
      public static const TYPE_PINTO:String = "pinto";
      
      public static const TYPE_FLYER:String = "chilifeather";
       
      
      public var popupdepth_habandito:Number = 120;
      
      public var popupdepth_guacamonster:Number = 200;
      
      public var popupdepth_pinto:Number = 130;
      
      public var popupdepth_chilifeather:Number = 120;
      
      public var minigame:MiniGameHotshot;
      
      public var clip:MovieClip;
      
      public var action:String;
      
      public var type:String;
      
      public var bg:Boolean = false;
      
      public var startTime:Number = 0;
      
      public var duration:Number = 30;
      
      public var startX:Number = 0;
      
      public var startY:Number = 0;
      
      public var endX:Number = 0;
      
      public var endY:Number = 0;
      
      public var useRotation:Number = 0;
      
      public var jumpHeight:Number = 100;
      
      public var jumpPeriod:Number = 20;
      
      public var jumpTimer:Number = 0;
      
      public var popupDuration:Number = 15;
      
      public var walkBounceRange:Number = 6;
      
      public var flyBounceRange:Number = 8;
      
      public var durationTimer:Number = 0;
      
      public var isActive:Boolean = false;
      
      public var canHit:Boolean = false;
      
      public var didHit:Boolean = false;
      
      public var hitAtTime:Number = 0;
      
      public var hitAtY:Number = 0;
      
      public function HotshotEnemy(param1:Number, param2:Number, param3:MiniGameHotshot, param4:String, param5:String, param6:Boolean, param7:Number, param8:Number, param9:Number = -1, param10:Number = -1, param11:Number = 0, param12:Number = 0, param13:Number = 0)
      {
         super();
         this.minigame = param3;
         this.type = param4;
         this.action = param5;
         this.duration = param2;
         this.startTime = param1;
         this.startX = param7;
         this.startY = param8;
         this.endX = param9;
         this.endY = param10;
         this.useRotation = param11;
         this.bg = param6;
         this.jumpHeight = param12;
         this.jumpPeriod = param13;
         if(this.action == HotshotEnemy.ACTION_POPUP && param9 == -1 && param10 == -1)
         {
            this.endX = this.startX;
            this.endY = this.startY;
            this.startY = this.endY + this["popupdepth_" + this.type];
         }
      }
      
      public function clone(param1:MiniGameHotshot) : HotshotEnemy
      {
         var _loc2_:HotshotEnemy = this;
         return new HotshotEnemy(_loc2_.startTime,_loc2_.duration,param1,_loc2_.type,_loc2_.action,_loc2_.bg,_loc2_.startX,_loc2_.startY,_loc2_.endX,_loc2_.endY,_loc2_.useRotation,_loc2_.jumpHeight,_loc2_.jumpPeriod);
      }
      
      public function initEnemy() : void
      {
         var _loc1_:HotshotEnemy = this;
         var _loc2_:Class = getDefinitionByName("minigame_hotshot_" + _loc1_.type) as Class;
         _loc1_.clip = new _loc2_() as MovieClip;
         _loc1_.clip.x = _loc1_.startX;
         _loc1_.clip.y = _loc1_.startY;
         _loc1_.clip.rotation = _loc1_.useRotation;
         _loc1_.clip.mouseChildren = false;
         _loc1_.clip.splat.visible = false;
         if(_loc1_.action == HotshotEnemy.ACTION_POPUP)
         {
            if(Math.random() < 0.5)
            {
               _loc1_.clip.scaleX = -1;
            }
         }
         else if(_loc1_.action == HotshotEnemy.ACTION_FLY || _loc1_.action == HotshotEnemy.ACTION_WALK || _loc1_.action == HotshotEnemy.ACTION_JUMP)
         {
            if(_loc1_.startX < _loc1_.endX)
            {
               _loc1_.clip.scaleX = -1;
            }
         }
         _loc1_.canHit = true;
         _loc1_.isActive = true;
         if(_loc1_.bg)
         {
            _loc1_.minigame.clip.bgenemyholder.addChild(_loc1_.clip);
         }
         else
         {
            _loc1_.minigame.clip.enemyholder.addChild(_loc1_.clip);
         }
         if(_loc1_.clip.totalFrames > 1)
         {
            _loc1_.clip.gotoAndStop(Math.ceil(Math.random() * _loc1_.clip.totalFrames));
         }
      }
      
      public function updateEnemy() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:HotshotEnemy = this;
         if(_loc1_.isActive && !_loc1_.didHit)
         {
            ++_loc1_.durationTimer;
            if(_loc1_.action == HotshotEnemy.ACTION_POPUP && _loc1_.durationTimer <= _loc1_.popupDuration)
            {
               _loc2_ = _loc1_.durationTimer;
               _loc1_.clip.x = _loc1_.easeOut(_loc2_,_loc1_.startX,_loc1_.endX - _loc1_.startX,_loc1_.popupDuration);
               _loc1_.clip.y = _loc1_.easeOut(_loc2_,_loc1_.startY,_loc1_.endY - _loc1_.startY,_loc1_.popupDuration);
            }
            else if(_loc1_.action == HotshotEnemy.ACTION_POPUP && _loc1_.durationTimer <= _loc1_.duration + _loc1_.popupDuration)
            {
               _loc2_ = _loc1_.durationTimer - _loc1_.duration;
               _loc1_.clip.x = _loc1_.easeIn(_loc2_,_loc1_.endX,_loc1_.startX - _loc1_.endX,_loc1_.popupDuration);
               _loc1_.clip.y = _loc1_.easeIn(_loc2_,_loc1_.endY,_loc1_.startY - _loc1_.endY,_loc1_.popupDuration);
            }
            else if(_loc1_.action == HotshotEnemy.ACTION_POPUP && _loc1_.durationTimer == _loc1_.duration + _loc1_.popupDuration + 1)
            {
               _loc1_.minigame.removeEnemy(_loc1_);
            }
            if(_loc1_.action == HotshotEnemy.ACTION_WALK)
            {
               _loc2_ = _loc1_.durationTimer;
               _loc1_.clip.x = _loc1_.tween(_loc2_,_loc1_.startX,_loc1_.endX - _loc1_.startX,_loc1_.duration);
               _loc1_.clip.y = _loc1_.tween(_loc2_,_loc1_.startY,_loc1_.endY - _loc1_.startY,_loc1_.duration);
               _loc1_.clip.y += _loc1_.walkBounceRange * Math.sin(_loc1_.clip.x / 20 + _loc1_.startTime);
               if(_loc1_.durationTimer >= _loc1_.duration)
               {
                  _loc1_.minigame.removeEnemy(_loc1_);
               }
            }
            else if(_loc1_.action == HotshotEnemy.ACTION_FLY)
            {
               _loc2_ = _loc1_.durationTimer;
               _loc1_.clip.x = _loc1_.tween(_loc2_,_loc1_.startX,_loc1_.endX - _loc1_.startX,_loc1_.duration);
               _loc1_.clip.y = _loc1_.tween(_loc2_,_loc1_.startY,_loc1_.endY - _loc1_.startY,_loc1_.duration);
               _loc1_.clip.y += _loc1_.flyBounceRange * Math.sin(_loc1_.clip.x / 100 + _loc1_.startTime);
               _loc1_.clip.rotation = 5 * Math.sin(_loc1_.durationTimer / 8 + _loc1_.startTime);
               if(_loc1_.durationTimer >= _loc1_.duration)
               {
                  _loc1_.minigame.removeEnemy(_loc1_);
               }
            }
            else if(_loc1_.action == HotshotEnemy.ACTION_JUMP)
            {
               _loc2_ = _loc1_.durationTimer;
               _loc1_.clip.x = _loc1_.tween(_loc2_,_loc1_.startX,_loc1_.endX - _loc1_.startX,_loc1_.duration);
               _loc1_.clip.y = _loc1_.tween(_loc2_,_loc1_.startY,_loc1_.endY - _loc1_.startY,_loc1_.duration);
               ++_loc1_.jumpTimer;
               if(_loc1_.jumpTimer > _loc1_.jumpPeriod)
               {
                  _loc1_.jumpTimer = 0;
               }
               if(_loc1_.jumpTimer <= _loc1_.jumpPeriod / 2)
               {
                  _loc1_.clip.y -= _loc1_.quadEaseOut(_loc1_.jumpTimer,0,_loc1_.jumpHeight,_loc1_.jumpPeriod / 2);
               }
               else
               {
                  _loc1_.clip.y -= _loc1_.quadEaseIn(_loc1_.jumpTimer - _loc1_.jumpPeriod / 2,_loc1_.jumpHeight,0 - _loc1_.jumpHeight,_loc1_.jumpPeriod / 2);
               }
               if(_loc1_.durationTimer >= _loc1_.duration)
               {
                  _loc1_.minigame.removeEnemy(_loc1_);
               }
            }
         }
         else if(_loc1_.didHit)
         {
            if(_loc1_.clip.rotation < 0)
            {
               _loc1_.clip.rotation += 0.2;
               if(_loc1_.clip.rotation > 0)
               {
                  _loc1_.clip.rotation = 0;
               }
            }
            else if(_loc1_.clip.rotation > 0)
            {
               _loc1_.clip.rotation -= 0.2;
               if(_loc1_.clip.rotation < 0)
               {
                  _loc1_.clip.rotation = 0;
               }
            }
            _loc3_ = 10;
            _loc4_ = 20;
            ++_loc1_.durationTimer;
            _loc2_ = _loc1_.durationTimer - _loc1_.hitAtTime;
            if(_loc2_ <= _loc3_)
            {
               _loc1_.clip.rotationY = _loc1_.quadEaseOut(_loc2_,0,360,_loc3_);
            }
            else
            {
               _loc1_.clip.rotationY = 0;
            }
            if(_loc2_ < _loc3_ / 2)
            {
               _loc1_.clip.y = _loc1_.quadEaseOut(_loc2_,_loc1_.hitAtY,-40,_loc3_ / 2);
            }
            else if(_loc2_ <= _loc3_)
            {
               _loc1_.clip.y = _loc1_.quadEaseIn(_loc2_ - _loc3_ / 2,_loc1_.hitAtY - 40,40,_loc3_ / 2);
            }
            else
            {
               _loc1_.clip.y = _loc1_.tween(_loc2_ - _loc3_,_loc1_.hitAtY,700 - _loc1_.hitAtY,_loc4_);
            }
            if(_loc1_.durationTimer >= _loc1_.hitAtTime + _loc4_ + _loc3_)
            {
               _loc1_.minigame.removeEnemy(_loc1_);
            }
         }
         else if(_loc1_.minigame.gameTimer >= _loc1_.startTime && !_loc1_.isActive)
         {
            _loc1_.initEnemy();
         }
      }
      
      public function checkHittingEnemy(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:HotshotEnemy = this;
         var _loc4_:Boolean = false;
         if(_loc3_.isActive && !_loc3_.didHit)
         {
            if(_loc3_.clip.hitTestPoint(param1,param2,true))
            {
               _loc3_.didHit = true;
               _loc3_.hitAtTime = _loc3_.durationTimer;
               _loc3_.hitAtY = _loc3_.clip.y;
               _loc4_ = true;
               _loc3_.clip.splat.visible = true;
            }
         }
         return _loc4_;
      }
      
      public function destroy() : void
      {
         var _loc1_:HotshotEnemy = this;
         if(_loc1_.clip != null)
         {
            try
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
            catch(err:Error)
            {
            }
         }
         _loc1_.clip = null;
      }
      
      public function easeIn(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 15, param6:Number = 10) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / param4) == 1)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * 0.3;
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / _2PI * Math.asin(param3 / param5);
         }
         return -(param5 * Math.pow(2,10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * _2PI / param6)) + param2;
      }
      
      public function easeOut(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 15, param6:Number = 10) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / param4) == 1)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * 0.3;
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / _2PI * Math.asin(param3 / param5);
         }
         return param5 * Math.pow(2,-10 * param1) * Math.sin((param1 * param4 - _loc7_) * _2PI / param6) + param3 + param2;
      }
      
      public function easeInOut(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 15, param6:Number = 10) : Number
      {
         var _loc7_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         if((param1 = param1 / (param4 * 0.5)) == 2)
         {
            return param2 + param3;
         }
         if(!param6)
         {
            param6 = param4 * (0.3 * 1.5);
         }
         if(!param5 || param3 > 0 && param5 < param3 || param3 < 0 && param5 < -param3)
         {
            param5 = param3;
            _loc7_ = param6 / 4;
         }
         else
         {
            _loc7_ = param6 / _2PI * Math.asin(param3 / param5);
         }
         if(param1 < 1)
         {
            return -0.5 * (param5 * Math.pow(2,10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * _2PI / param6)) + param2;
         }
         return param5 * Math.pow(2,-10 * (param1 = param1 - 1)) * Math.sin((param1 * param4 - _loc7_) * _2PI / param6) * 0.5 + param3 + param2;
      }
      
      public function quadEaseIn(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param3 * (param1 = param1 / param4) * param1 + param2;
      }
      
      public function quadEaseOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return -param3 * (param1 = param1 / param4) * (param1 - 2) + param2;
      }
      
      public function tween(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param3 * param1 / param4 + param2;
      }
   }
}
