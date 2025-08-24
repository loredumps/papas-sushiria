package sushiGame.screens
{
   import flash.display.*;
   import flash.events.Event;
   import flash.geom.*;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.Worker;
   
   public class UnlockOutfitScreen
   {
       
      
      public var gameObj:class_5;
      
      public var customerIndex:Number = -1;
      
      public var clip:MovieClip;
      
      public var worker:Worker = null;
      
      public var customerClip:MovieClip = null;
      
      public var mailpersonClip:MovieClip = null;
      
      public var mailpersonName:String = "Vincent";
      
      public var backdropBitmap:Bitmap = null;
      
      public var callbackFunction:Function = null;
      
      public var randomSeed:Number = 123;
      
      public var lastMusic:String = "none";
      
      public function UnlockOutfitScreen(param1:class_5, param2:Number, param3:Function = null)
      {
         super();
         this.gameObj = param1;
         this.customerIndex = param2;
         this.callbackFunction = param3;
         this.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:UnlockOutfitScreen = this;
         _loc1_.clip = new unlockOutfitScreenMC();
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.customerClip = new customerMC();
         _loc1_.gameObj.var_131.buildCustomer(_loc1_.gameObj.var_131.getCustomerClipName(_loc1_.customerIndex),_loc1_.customerClip);
         _loc1_.customerClip.x = 357.5;
         _loc1_.customerClip.y = 102.1;
         _loc1_.clip.holder.addChild(_loc1_.customerClip);
         _loc1_.customerClip.gotoAndPlay("getgift");
         var _loc2_:Boolean = false;
         if(_loc1_.gameObj && _loc1_.gameObj.var_133 && _loc1_.gameObj.var_133.isInRestaurantRightNow(_loc1_.customerIndex))
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         if(_loc2_ == false && _loc1_.gameObj.var_131.getCustomerClipName(_loc1_.customerIndex) == _loc1_.gameObj.var_131.getCustomerClipName(_loc1_.gameObj.var_131.getCustomerIndex(_loc1_.mailpersonName)))
         {
            _loc2_ = true;
         }
         if(_loc2_ == false)
         {
            _loc1_.mailpersonClip = new customerMC();
            _loc1_.gameObj.var_131.buildCustomer(_loc1_.gameObj.var_131.getCustomerClipName(_loc1_.gameObj.var_131.getCustomerIndex(_loc1_.mailpersonName)),_loc1_.mailpersonClip);
            _loc1_.mailpersonClip.scaleX = -1;
            _loc1_.mailpersonClip.x = _loc1_.customerClip.x - 69.2;
            _loc1_.mailpersonClip.y = _loc1_.customerClip.y;
            _loc1_.clip.holder.addChild(_loc1_.mailpersonClip);
            _loc1_.mailpersonClip.gotoAndPlay("givegift");
         }
         else if(_loc2_)
         {
            _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.holder,_loc1_.gameObj.workerData,283.5,102.1,1,false,true);
            _loc1_.worker.playAnimation("givegift");
         }
         _loc1_.lastMusic = _loc1_.gameObj.var_128.playingWhichTrack;
         if(_loc1_.gameObj.var_128.fadingWhichTrack != "none")
         {
            _loc1_.lastMusic = _loc1_.gameObj.var_128.fadingWhichTrack;
         }
         _loc1_.gameObj.var_128.switchMusic("none");
         _loc1_.gameObj.var_128.playMusicClip("giveorder_drumroll.wav");
         _loc1_.initBackdrop();
      }
      
      public function updateScreen(param1:Event) : void
      {
         var customerHoliday:Number = NaN;
         var reactnum:Number = NaN;
         var e:Event = param1;
         var screen:UnlockOutfitScreen = this;
         if(screen.clip.currentFrame == 56)
         {
            screen.clip.holder.setChildIndex(screen.customerClip,screen.clip.holder.numChildren - 1);
         }
         else if(screen.clip.currentFrame == 65)
         {
            if(screen.worker)
            {
               screen.worker.playAnimation("score_happy");
            }
         }
         else if(screen.clip.currentFrame == 117)
         {
            screen.gameObj.var_127.unlockAlternateOutfit(screen.customerIndex);
            customerHoliday = screen.gameObj.var_131.getCustomerHolidayOutfitMonth(screen.customerIndex);
            if(customerHoliday > 0 && customerHoliday == screen.gameObj.var_127.getHolidayMonth())
            {
               screen.gameObj.var_127.setWearingOutfit(screen.customerIndex,4);
            }
            else
            {
               screen.gameObj.var_127.setWearingOutfit(screen.customerIndex,2);
            }
            screen.cleanupCustomer();
            screen.customerClip = new customerMC();
            screen.gameObj.var_131.buildCustomer(screen.gameObj.var_131.getCustomerClipName(screen.customerIndex),screen.customerClip);
            screen.customerClip.x = 230.5;
            screen.customerClip.y = 102.1;
            screen.clip.holder.addChild(screen.customerClip);
            reactnum = Math.ceil(Math.random() * 4);
            screen.customerClip.gotoAndPlay("lookoverjoyed" + reactnum);
            if(screen.worker)
            {
               screen.worker.clip.visible = false;
            }
            if(screen.mailpersonClip)
            {
               screen.mailpersonClip.visible = false;
            }
         }
         else if(screen.clip.currentFrame == 130)
         {
            screen.gameObj.var_128.playMusicClip("music_newseason");
         }
         else if(screen.clip.currentFrame == screen.clip.totalFrames)
         {
            screen.gameObj.var_128.switchMusic(screen.lastMusic);
            if(screen.callbackFunction != null)
            {
               try
               {
                  screen.callbackFunction();
               }
               catch(err:Error)
               {
                  class_6.error("Error with callback: " + err.message);
               }
            }
            screen.gameObj.method_253();
         }
      }
      
      public function cleanupCustomer() : void
      {
         var screen:UnlockOutfitScreen = this;
         if(screen.customerClip)
         {
            try
            {
               screen.customerClip.stop();
               screen.customerClip.body.removeChildAt(0);
               screen.customerClip.head.removeChildAt(0);
               screen.customerClip.eyes.removeChildAt(0);
               screen.customerClip.mouth.removeChildAt(0);
               screen.customerClip.neck.removeChildAt(0);
               screen.customerClip.front_shoe.removeChildAt(0);
               screen.customerClip.back_shoe.removeChildAt(0);
               screen.customerClip.fronthand.removeChildAt(0);
               screen.customerClip.backhand.removeChildAt(0);
               screen.customerClip.front_upperarm.removeChildAt(0);
               screen.customerClip.back_upperarm.removeChildAt(0);
               screen.customerClip.front_forearm.removeChildAt(0);
               screen.customerClip.back_forearm.removeChildAt(0);
            }
            catch(err:Error)
            {
               class_6.error("Error removing parts of customer");
            }
            try
            {
               screen.customerClip.hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            try
            {
               screen.customerClip.back_hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            if(screen.customerClip.parent)
            {
               screen.customerClip.parent.removeChild(screen.customerClip);
            }
            screen.customerClip = null;
         }
         if(screen.mailpersonClip)
         {
            try
            {
               screen.mailpersonClip.stop();
               screen.mailpersonClip.body.removeChildAt(0);
               screen.mailpersonClip.head.removeChildAt(0);
               screen.mailpersonClip.eyes.removeChildAt(0);
               screen.mailpersonClip.mouth.removeChildAt(0);
               screen.mailpersonClip.neck.removeChildAt(0);
               screen.mailpersonClip.front_shoe.removeChildAt(0);
               screen.mailpersonClip.back_shoe.removeChildAt(0);
               screen.mailpersonClip.fronthand.removeChildAt(0);
               screen.mailpersonClip.backhand.removeChildAt(0);
               screen.mailpersonClip.front_upperarm.removeChildAt(0);
               screen.mailpersonClip.back_upperarm.removeChildAt(0);
               screen.mailpersonClip.front_forearm.removeChildAt(0);
               screen.mailpersonClip.back_forearm.removeChildAt(0);
            }
            catch(err:Error)
            {
               class_6.error("Error removing parts of mailperson");
            }
            try
            {
               screen.mailpersonClip.hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            try
            {
               screen.mailpersonClip.back_hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            if(screen.mailpersonClip.parent)
            {
               screen.mailpersonClip.parent.removeChild(screen.mailpersonClip);
            }
            screen.mailpersonClip = null;
         }
      }
      
      public function initBackdrop() : void
      {
         var _loc1_:UnlockOutfitScreen = this;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.bgholder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         if(_loc1_.gameObj && _loc1_.gameObj && _loc1_.gameObj.var_133 && _loc1_.gameObj.var_133.isInRestaurantRightNow(_loc1_.customerIndex))
         {
            _loc1_.backdropBitmap = _loc1_.createLobbyBackdropBitmap();
         }
         else if(_loc1_.gameObj.var_131.getCustomerInApartment(_loc1_.customerIndex) == true)
         {
            _loc1_.backdropBitmap = _loc1_.createApartmentBackdropBitmap();
         }
         else
         {
            _loc1_.backdropBitmap = _loc1_.createOutsideBackdropBitmap();
         }
         _loc1_.clip.bgholder.addChild(_loc1_.backdropBitmap);
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:UnlockOutfitScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new nowindowBackdropMC();
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.wallparts["wall" + _loc4_].gotoAndStop(_loc2_.lobbyWallpaper);
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 7)
         {
            _loc5_.holder.floorparts["floor" + _loc4_].gotoAndStop(_loc2_.lobbyFlooring);
            _loc4_++;
         }
         _loc5_.holder.trim.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(706,552,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,706,552));
         _loc3_ = new Bitmap(_loc6_);
         _loc5_ = null;
         return _loc3_;
      }
      
      private function createOutsideBackdropBitmap() : Bitmap
      {
         var _loc1_:UnlockOutfitScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new delivery_house_backdrop();
         var _loc6_:Number = _loc2_.getMonth() * 2 - 1;
         if(_loc1_.gameObj.var_131.getCustomerName(_loc1_.customerIndex) == "Santa")
         {
            _loc6_ = 1;
         }
         _loc5_.bush1.gotoAndStop(_loc6_);
         _loc5_.bush2.gotoAndStop(_loc6_);
         _loc5_.bush3.gotoAndStop(_loc6_);
         _loc5_.bush4.gotoAndStop(_loc6_);
         _loc5_.bush5.gotoAndStop(_loc6_);
         _loc5_.hedge1.gotoAndStop(_loc6_);
         _loc5_.hedge2.gotoAndStop(_loc6_);
         _loc5_.grass.gotoAndStop(_loc6_);
         var _loc7_:Number = _loc1_.gameObj.var_131.getCustomerColorValue(_loc1_.customerIndex);
         _loc5_.house.transform.colorTransform = _loc1_.createColorTransform(_loc7_);
         var _loc8_:BitmapData;
         (_loc8_ = new BitmapData(706,552,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,706,552));
         _loc3_ = new Bitmap(_loc8_);
         _loc5_ = null;
         return _loc3_;
      }
      
      private function createApartmentBackdropBitmap() : Bitmap
      {
         var _loc1_:UnlockOutfitScreen = this;
         var _loc2_:Bitmap = null;
         var _loc3_:MovieClip = new delivery_apartment_backdrop();
         var _loc4_:Number = _loc1_.gameObj.var_131.getCustomerColorValue(_loc1_.customerIndex);
         _loc3_.wall.transform.colorTransform = _loc1_.createColorTransform(_loc4_);
         var _loc5_:String = _loc1_.gameObj.var_131.getCustomerName(_loc1_.customerIndex);
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc6_ += _loc5_.charCodeAt(_loc7_);
            _loc7_++;
         }
         _loc1_.setRandomSeed(_loc6_);
         var _loc8_:Number = _loc1_.randomize();
         var _loc9_:uint = 16777215;
         if(_loc8_ < 0.3)
         {
            _loc9_ = 16777215;
         }
         else if(_loc8_ < 0.6)
         {
            _loc9_ = 8997167;
         }
         else
         {
            _loc9_ = 10381359;
         }
         _loc3_.trim.transform.colorTransform = _loc1_.createColorTransform(_loc9_);
         var _loc10_:Number = _loc1_.randomize();
         var _loc11_:Number = Math.floor(_loc10_ * _loc1_.gameObj.var_131.colorValues.length);
         var _loc12_:Number = Number(_loc1_.gameObj.var_131.colorValues[_loc11_]);
         _loc3_.floor.transform.colorTransform = _loc1_.createColorTransform(_loc12_);
         var _loc13_:BitmapData;
         (_loc13_ = new BitmapData(706,552,true,0)).draw(_loc3_,null,null,null,new Rectangle(0,0,706,552));
         _loc2_ = new Bitmap(_loc13_);
         _loc3_ = null;
         return _loc2_;
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function destroy() : void
      {
         var _loc1_:UnlockOutfitScreen = this;
         _loc1_.cleanupCustomer();
         if(_loc1_.worker)
         {
            _loc1_.worker.destroy();
            _loc1_.worker = null;
         }
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.bgholder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         if(Boolean(_loc1_.clip) && Boolean(_loc1_.clip.parent))
         {
            _loc1_.clip.parent.removeChild(_loc1_.clip);
         }
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip = null;
         _loc1_.gameObj = null;
      }
      
      private function randomize(param1:Boolean = true) : Number
      {
         var _loc2_:UnlockOutfitScreen = this;
         if(param1)
         {
            return (_loc2_.randomSeed = _loc2_.randomSeed * 16807 % 2147483647) / 2147483647 + 2.33e-10;
         }
         return Math.random();
      }
      
      private function setRandomSeed(param1:Number) : void
      {
         var _loc2_:UnlockOutfitScreen = this;
         _loc2_.randomSeed = param1;
         _loc2_.randomize();
      }
   }
}
