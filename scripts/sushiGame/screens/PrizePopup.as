package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.ClothingItem;
   import sushiGame.data.FurniData;
   
   public class PrizePopup
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var prizeSKU:String = null;
      
      public var targetX:Number = 320;
      
      public var targetY:Number = 180;
      
      public var startY:Number = -140;
      
      public var returnSpeed:Number = 0;
      
      public var returnSpeedAccel:Number = 2;
      
      public var isReturning:Boolean = false;
      
      public var isDown:Boolean = false;
      
      public var waitTimer:Number = 0;
      
      public var waitTimerMax:Number = 60;
      
      public function PrizePopup(param1:class_5, param2:MovieClip, param3:String)
      {
         super();
         this.gameObj = param1;
         this.prizeSKU = param3;
         this.setupScreen(param2);
      }
      
      public function setupScreen(param1:MovieClip) : void
      {
         var _loc5_:ClothingItem = null;
         var _loc2_:PrizePopup = this;
         _loc2_.clip = new prize_popup();
         _loc2_.clip.x = _loc2_.targetX;
         _loc2_.clip.y = _loc2_.startY;
         param1.addChild(_loc2_.clip);
         var _loc3_:FurniData = _loc2_.gameObj.var_132.getFurniFromTag(this.prizeSKU);
         var _loc4_:TextFormat;
         (_loc4_ = new TextFormat()).kerning = true;
         if(_loc3_ != null)
         {
            _loc2_.clip.thumb.addChild(_loc2_.createFurniThumbnail(_loc3_));
            _loc2_.clip.title_txt.text = _loc3_.title;
            _loc2_.gameObj.var_127.earnMinigameFurniture(this.prizeSKU,-1,true);
         }
         else
         {
            this.prizeSKU = _loc2_.gameObj.var_127.adjustClothingIfAlreadyOwned(this.prizeSKU);
            _loc2_.clip.thumb.addChild(_loc2_.gameObj.var_134.generateClothingThumb(this.prizeSKU,_loc2_.gameObj.workerData.gender,50,50,100,100));
            _loc5_ = _loc2_.gameObj.var_134.getItemFromSKU(this.prizeSKU);
            _loc2_.clip.title_txt.text = _loc5_.title;
            _loc2_.gameObj.var_127.earnMinigameClothing(this.prizeSKU,-1,true);
            _loc5_ = null;
         }
         _loc2_.clip.title_txt.setTextFormat(_loc4_);
         _loc3_ = null;
         _loc2_.clip.addEventListener(Event.ENTER_FRAME,_loc2_.updateScreen);
         _loc2_.clip.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickScreen);
         _loc2_.gameObj.var_128.playSound("getstar.wav");
      }
      
      public function createFurniThumbnail(param1:FurniData) : MovieClip
      {
         var _loc6_:Number = NaN;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:Number = NaN;
         var _loc10_:MovieClip = null;
         var _loc11_:MovieClip = null;
         var _loc12_:MovieClip = null;
         var _loc13_:MovieClip = null;
         var _loc14_:Class = null;
         var _loc15_:MovieClip = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Rectangle = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         this;
         var _loc3_:MovieClip = null;
         100;
         100;
         if(param1.type == FurniData.TYPE_FLOORING)
         {
            _loc6_ = Number(String(param1.tag).split("floor")[1]);
            _loc3_ = new MovieClip();
            (_loc7_ = new flooring_chunk()).gotoAndStop(_loc6_);
            (_loc8_ = new flooring_chunk()).gotoAndStop(_loc6_);
            _loc8_.x = _loc7_.width;
            _loc3_.addChild(_loc7_);
            _loc3_.addChild(_loc8_);
            _loc3_.scaleX = 0.47;
            _loc3_.scaleY = 0.47;
         }
         else if(param1.type == FurniData.TYPE_WALLPAPER)
         {
            _loc9_ = Number(String(param1.tag).split("wall")[1]);
            _loc3_ = new MovieClip();
            (_loc10_ = new wallpaper_holder()).gotoAndStop(_loc9_);
            (_loc11_ = new wallpaper_holder()).gotoAndStop(_loc9_);
            _loc11_.x = _loc10_.width;
            _loc3_.addChild(_loc10_);
            _loc3_.addChild(_loc11_);
            (_loc12_ = new MovieClip()).graphics.beginFill(0,1);
            _loc12_.graphics.drawRect(0,0,_loc10_.width,245);
            _loc12_.graphics.endFill();
            _loc3_.addChild(_loc12_);
            (_loc13_ = new MovieClip()).graphics.beginFill(0,1);
            _loc13_.graphics.drawRect(0,0,_loc11_.width,245);
            _loc13_.graphics.endFill();
            _loc13_.x = _loc11_.x;
            _loc3_.addChild(_loc13_);
            _loc10_.mask = _loc12_;
            _loc11_.mask = _loc13_;
            _loc3_.scaleX = 0.43;
            _loc3_.scaleY = 0.43;
         }
         else
         {
            if((_loc15_ = new (_loc14_ = getDefinitionByName(param1.tag) as Class)()).totalFrames > 1)
            {
               _loc15_.gotoAndStop(2);
            }
            _loc16_ = _loc15_.height;
            _loc17_ = _loc15_.height / _loc15_.width;
            _loc18_ = _loc15_.width / _loc15_.height;
            if(_loc15_.height > 100 || _loc15_.width > 100)
            {
               if(_loc15_.height > _loc15_.width)
               {
                  _loc15_.height = 100;
                  _loc15_.width = _loc15_.height * _loc18_;
               }
               else
               {
                  _loc15_.width = 100;
                  _loc15_.height = _loc15_.width * _loc17_;
               }
            }
            _loc19_ = (100 - _loc15_.width) / 2;
            _loc20_ = (100 - _loc15_.height) / 2;
            _loc23_ = (_loc22_ = (_loc21_ = _loc15_.getBounds(_loc15_)).y + _loc21_.height) * (_loc15_.height / _loc16_);
            if(param1.type == FurniData.TYPE_FURNI)
            {
               _loc15_.x = _loc19_;
               _loc15_.y = 100 - _loc20_;
               _loc15_.y -= _loc23_;
            }
            else if(param1.type == FurniData.TYPE_POSTER)
            {
               _loc15_.x = _loc19_;
               _loc15_.y = _loc20_;
            }
            _loc3_ = _loc15_;
         }
         return _loc3_;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:PrizePopup = this;
         if(!_loc2_.isDown)
         {
            _loc3_ = _loc2_.targetY - _loc2_.clip.y;
            _loc2_.clip.y += _loc3_ / 4;
            if(Math.abs(_loc3_) <= 1)
            {
               _loc2_.clip.y = _loc2_.targetY;
               _loc2_.isDown = true;
            }
         }
         else if(_loc2_.isReturning)
         {
            _loc2_.returnSpeed += _loc2_.returnSpeedAccel;
            _loc2_.clip.y -= _loc2_.returnSpeed;
            if(_loc2_.clip.y <= _loc2_.startY)
            {
               _loc2_.gameObj.method_223();
               return;
            }
         }
         else
         {
            ++_loc2_.waitTimer;
            if(_loc2_.waitTimer >= _loc2_.waitTimerMax)
            {
               _loc2_.isReturning = true;
            }
         }
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:PrizePopup = this;
         if(!_loc2_.isReturning)
         {
            _loc2_.waitTimer = _loc2_.waitTimerMax;
            _loc2_.isReturning = true;
            _loc2_.clip.mouseEnabled = false;
            _loc2_.clip.mouseChildren = false;
         }
      }
      
      public function destroy() : void
      {
         var screen:PrizePopup = this;
         screen.clip.removeEventListener(Event.ENTER_FRAME,screen.updateScreen);
         screen.clip.removeEventListener(MouseEvent.MOUSE_DOWN,screen.clickScreen);
         try
         {
            if(screen.clip.thumb.numChildren > 0)
            {
               screen.clip.thumb.removeChildAt(0);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error removing thumb.");
         }
         if(screen.clip)
         {
            if(screen.clip.parent)
            {
               screen.clip.parent.removeChild(screen.clip);
            }
         }
      }
   }
}
