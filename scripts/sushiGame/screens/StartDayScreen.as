package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.*;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.CustomerData;
   import sushiGame.data.GameData;
   import sushiGame.data.UserData;
   import sushiGame.managers.CustomerManager;
   import sushiGame.models.Worker;
   
   public class StartDayScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var worker:Worker;
      
      public var isWaitingForTalkerResponse:Number = 0;
      
      public var backdropBitmap:Bitmap = null;
      
      public var spaceIsDown:Boolean = false;
      
      public var usedModels:Array;
      
      public var usedAnimations:Array;
      
      public var avoidIDs:Array;
      
      public var gondola:MovieClip = null;
      
      public var useWhichPrize:Number = 1;
      
      public var didUseGondola:Boolean = false;
      
      public var specialLogo:BitmapData = null;
      
      public var specialLogoBitmap:Bitmap = null;
      
      public var waterTileWidth:Number = 46;
      
      public var waterFrames:Number = 28;
      
      public var waterTileHeight:Number = 100;
      
      public var waterTilesNeeded:Number = 11;
      
      public var waterSheet:BitmapData;
      
      public var waterTiles:Vector.<Bitmap>;
      
      public var waterTilesBMP:Vector.<BitmapData>;
      
      public var waterTileFrames:Vector.<int>;
      
      public var forceMode:Number = -1;
      
      public var whichMode:Number = 1;
      
      public var maxModes:Number = 7;
      
      public function StartDayScreen(param1:class_5, param2:Number = -1)
      {
         this.usedModels = [];
         this.usedAnimations = [];
         this.avoidIDs = [];
         super();
         var _loc3_:StartDayScreen = this;
         _loc3_.gameObj = param1;
         _loc3_.forceMode = param2;
         _loc3_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:StartDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new startDayMC();
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.clip.dayMC.nopapaclip.day_text.text = String(_loc2_.getDay());
         _loc1_.clip.dayMC.nopapaclip.day_shadow.text = String(_loc2_.getDay());
         _loc1_.useWhichPrize = Math.ceil(Math.random() * 7);
         _loc1_.clip.play();
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,this.updateScreen);
         _loc1_.gameObj.var_128.switchMusic("none");
         _loc1_.gameObj.var_128.playMusicClip("startofday.wav");
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.workerholder,_loc1_.gameObj.workerData,0,0,0.22);
         _loc1_.worker.playAnimation("startday");
         _loc1_.setupWater();
         _loc1_.initBackdrop();
         _loc1_.setupCustomers();
         _loc1_.gameObj.stage.frameRate = 30;
         _loc1_.gameObj.stage.focus = _loc1_.gameObj.stage;
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:StartDayScreen = this;
         _loc2_.clip.gotoAndPlay(_loc2_.clip.totalFrames - 2);
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:StartDayScreen = this;
         _loc2_.worker.animateModel();
         _loc2_.updateWater();
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.clip.removeEventListener(Event.ENTER_FRAME,this.updateScreen);
            if(_loc2_.spaceIsDown)
            {
               if((_loc4_ = _loc2_.whichMode + 1) > _loc2_.maxModes)
               {
                  _loc4_ = 1;
               }
               _loc2_.gameObj.method_154(_loc4_);
            }
            else
            {
               _loc2_.gameObj.method_222();
               _loc2_.gameObj.method_273();
            }
         }
         else if(_loc2_.clip.currentFrame == 66)
         {
            _loc2_.clip.customerfirst.gotoAndPlay("stand");
         }
         else if(_loc2_.clip.currentFrame == 72)
         {
            _loc7_ = Math.ceil(Math.random() * 4);
            _loc2_.clip.customerfirst.gotoAndPlay("overjoyed" + _loc7_);
         }
      }
      
      public function keyListener(param1:KeyboardEvent) : void
      {
         var _loc2_:StartDayScreen = this;
         if(param1.keyCode == 32)
         {
            _loc2_.spaceIsDown = true;
         }
         else
         {
            _loc2_.spaceIsDown = false;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:StartDayScreen = this;
         _loc1_.clip.stop();
         _loc1_.setupWater(false);
         if(_loc1_.specialLogoBitmap)
         {
            if(_loc1_.specialLogoBitmap.parent)
            {
               _loc1_.specialLogoBitmap.parent.removeChild(_loc1_.specialLogoBitmap);
            }
            _loc1_.specialLogoBitmap.bitmapData = null;
            _loc1_.specialLogoBitmap = null;
         }
         if(_loc1_.specialLogo)
         {
            _loc1_.specialLogo.dispose();
            _loc1_.specialLogo = null;
         }
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.usedModels.length)
         {
            _loc1_.destroyCustomerModel(_loc1_.clip[_loc1_.usedModels[_loc2_]]);
            _loc2_++;
         }
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            _loc1_.backdropBitmap.bitmapData = null;
            if(_loc1_.backdropBitmap.parent)
            {
               _loc1_.backdropBitmap.parent.removeChild(_loc1_.backdropBitmap);
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function setupCustomers() : void
      {
         var _loc8_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc1_:StartDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:CustomerData = _loc1_.gameObj.var_131;
         var _loc4_:CustomerManager = _loc1_.gameObj.var_133;
         [];
         if(_loc1_.forceMode > -1)
         {
            _loc1_.whichMode = _loc1_.forceMode;
         }
         else
         {
            _loc1_.whichMode = Math.ceil(Math.random() * _loc1_.maxModes);
         }
         var _loc6_:Array = ["Emmlette","Koilee","Wylan B","Elle","Vincent","Papa Louie"];
         var _loc7_:Array = ["Santa"];
         _loc8_ = 0;
         while(_loc8_ < _loc6_.length)
         {
            if(!((_loc11_ = _loc3_.getCustomerIndex(_loc6_[_loc8_])) < _loc2_.customersUnlocked.length && _loc2_.customersUnlocked[_loc11_] == 1))
            {
               _loc1_.avoidIDs.push(_loc11_);
            }
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc12_ = _loc3_.getCustomerIndex(_loc7_[_loc8_]);
            _loc1_.avoidIDs.push(_loc12_);
            _loc8_++;
         }
         var _loc9_:Number = Number(_loc4_.customerLineup[0]);
         var _loc10_:String = _loc3_.getCustomerClipName(_loc9_);
         _loc1_.buildCustomerModel(_loc1_.clip.customerfirst,_loc10_);
         _loc1_.avoidIDs.push(_loc9_);
         _loc1_.usedModels.push("customerfirst");
         _loc1_.usedAnimations.push("walk");
         _loc1_.clip.customerfirst.gotoAndPlay("walk");
         if(_loc1_.whichMode == 1)
         {
            _loc1_.setupCustomerModel("walkbridge",true,"walk");
            _loc1_.setupCustomerModel("standbridge",false);
            _loc1_.setupCustomerModel("walkfront2",false);
            _loc1_.setupCustomerModel("walkfront",true,"walk");
            _loc1_.setupCustomerModel("walkmiddle3",true,"walk3");
            _loc1_.setupCustomerModel("walkmiddle",true,"walk");
            _loc1_.setupCustomerModel("walkmiddle2",true,"walk2");
            _loc1_.setupCustomerModel("standmiddle1",false);
            _loc1_.setupCustomerModel("standmiddle2",false);
            _loc1_.setupCustomerModel("standdojo1",true,"stand1_1");
            _loc1_.setupCustomerModel("standdojo2",true,"drinkcoffee4");
            _loc1_.setupCustomerModel("talkdojo1",true,"takeorder");
            _loc1_.setupCustomerModel("talkdojo2",true,"chewgum2");
            _loc1_.setupCustomerModel("standmochi",true,"lookpopcorn");
            _loc1_.setupCustomerModel("standfront1",true,"happy5");
            _loc1_.setupCustomerModel("standfront2",true,"takeorder");
            _loc1_.setupCustomerModel("standfront3",false);
         }
         else if(_loc1_.whichMode == 2)
         {
            _loc1_.setupCustomerModel("walkbridge",false);
            _loc1_.setupCustomerModel("standbridge",true,"look");
            _loc1_.setupCustomerModel("walkfront2",true,"walk2");
            _loc1_.setupCustomerModel("walkfront",false);
            _loc1_.setupCustomerModel("walkmiddle3",true,"walk");
            _loc1_.setupCustomerModel("walkmiddle",false);
            _loc1_.setupCustomerModel("walkmiddle2",true,"walk3");
            _loc1_.setupCustomerModel("standmiddle1",false);
            _loc1_.setupCustomerModel("standmiddle2",false);
            _loc1_.setupCustomerModel("standdojo1",false);
            _loc1_.setupCustomerModel("standdojo2",true,"happy3");
            _loc1_.setupCustomerModel("talkdojo1",true,"decent2");
            _loc1_.setupCustomerModel("talkdojo2",true,"takeorder");
            _loc1_.setupCustomerModel("standmochi",true,"readpaper1");
            _loc1_.setupCustomerModel("standfront1",false);
            _loc1_.setupCustomerModel("standfront2",false);
            _loc1_.setupCustomerModel("standfront3",false);
         }
         else if(_loc1_.whichMode == 3)
         {
            _loc1_.setupCustomerModel("walkbridge",true,"walk");
            _loc1_.setupCustomerModel("standbridge",false);
            _loc1_.setupCustomerModel("walkfront2",false);
            _loc1_.setupCustomerModel("walkfront",true,"walk2");
            _loc1_.setupCustomerModel("walkmiddle3",true,"walk3");
            _loc1_.setupCustomerModel("walkmiddle",true,"walktalking");
            _loc1_.setupCustomerModel("walkmiddle2",false);
            _loc1_.setupCustomerModel("standmiddle1",false);
            _loc1_.setupCustomerModel("standmiddle2",false);
            _loc1_.setupCustomerModel("standdojo1",true,"overjoyed2");
            _loc1_.setupCustomerModel("standdojo2",false);
            _loc1_.setupCustomerModel("talkdojo1",false);
            _loc1_.setupCustomerModel("talkdojo2",true,"dance1_1");
            _loc1_.setupCustomerModel("standmochi",true,"dance2_1");
            _loc1_.setupCustomerModel("standfront1",false);
            _loc1_.setupCustomerModel("standfront2",true,"drinkcoffee3");
            _loc1_.setupCustomerModel("standfront3",false);
         }
         else if(_loc1_.whichMode == 4)
         {
            _loc1_.setupCustomerModel("walkbridge",false);
            _loc1_.setupCustomerModel("standbridge",true,"happy5");
            _loc1_.setupCustomerModel("walkfront2",false);
            _loc1_.setupCustomerModel("walkfront",true,"walk");
            _loc1_.setupCustomerModel("walkmiddle3",true,"walk2");
            _loc1_.setupCustomerModel("walkmiddle",true,"walk3");
            _loc1_.setupCustomerModel("walkmiddle2",true,"walk");
            _loc1_.setupCustomerModel("standmiddle1",false);
            _loc1_.setupCustomerModel("standmiddle2",false);
            _loc1_.setupCustomerModel("standdojo1",true,"look");
            _loc1_.setupCustomerModel("standdojo2",true,"standphone2_1");
            _loc1_.setupCustomerModel("talkdojo1",true,"happy4");
            _loc1_.setupCustomerModel("talkdojo2",true,"takeorder");
            _loc1_.setupCustomerModel("standmochi",true,"overjoyed4");
            _loc1_.setupCustomerModel("standfront1",false);
            _loc1_.setupCustomerModel("standfront2",false);
            _loc1_.setupCustomerModel("standfront3",false);
         }
         else if(_loc1_.whichMode == 5)
         {
            _loc1_.setupCustomerModel("walkbridge",false);
            _loc1_.setupCustomerModel("standbridge",true,"stand2_1");
            _loc1_.setupCustomerModel("walkfront2",false);
            _loc1_.setupCustomerModel("walkfront",true,"walk");
            _loc1_.setupCustomerModel("walkmiddle3",true,"walk3");
            _loc1_.setupCustomerModel("walkmiddle",true,"walk2");
            _loc1_.setupCustomerModel("walkmiddle2",true,"walk");
            _loc1_.setupCustomerModel("standmiddle1",false);
            _loc1_.setupCustomerModel("standmiddle2",false);
            _loc1_.setupCustomerModel("standdojo1",true,"lookpopcorn");
            _loc1_.setupCustomerModel("standdojo2",false);
            _loc1_.setupCustomerModel("talkdojo1",true,"overjoyed4");
            _loc1_.setupCustomerModel("talkdojo2",false);
            _loc1_.setupCustomerModel("standmochi",false);
            _loc1_.setupCustomerModel("standfront1",true,"stand2_1");
            _loc1_.setupCustomerModel("standfront2",true,"decent1");
            _loc1_.setupCustomerModel("standfront3",true,"takeorder");
         }
         else if(_loc1_.whichMode == 6)
         {
            _loc1_.setupCustomerModel("walkbridge",false);
            _loc1_.setupCustomerModel("standbridge",true,"decent2");
            _loc1_.setupCustomerModel("walkfront2",false);
            _loc1_.setupCustomerModel("walkfront",false);
            _loc1_.setupCustomerModel("walkmiddle3",false);
            _loc1_.setupCustomerModel("walkmiddle",true,"walk2");
            _loc1_.setupCustomerModel("walkmiddle2",true,"walk3");
            _loc1_.setupCustomerModel("standmiddle1",true,"takeorder");
            _loc1_.setupCustomerModel("standmiddle2",true,"drinkcoffee2");
            _loc1_.setupCustomerModel("standdojo1",false);
            _loc1_.setupCustomerModel("standdojo2",true,"upset1");
            _loc1_.setupCustomerModel("talkdojo1",true,"dance3_1");
            _loc1_.setupCustomerModel("talkdojo2",false);
            _loc1_.setupCustomerModel("standmochi",false);
            _loc1_.setupCustomerModel("standfront1",false);
            _loc1_.setupCustomerModel("standfront2",false);
            _loc1_.setupCustomerModel("standfront3",true,"drinkcoffee1");
         }
         else if(_loc1_.whichMode == 7)
         {
            _loc1_.setupCustomerModel("walkbridge",true,"walk");
            _loc1_.setupCustomerModel("standbridge",false);
            _loc1_.setupCustomerModel("walkfront2",false);
            _loc1_.setupCustomerModel("walkfront",true,"walk2");
            _loc1_.setupCustomerModel("walkmiddle3",false);
            _loc1_.setupCustomerModel("walkmiddle",true,"walk3");
            _loc1_.setupCustomerModel("walkmiddle2",false);
            _loc1_.setupCustomerModel("standmiddle1",false);
            _loc1_.setupCustomerModel("standmiddle2",true,"readpaper3");
            _loc1_.setupCustomerModel("standdojo1",true,"look");
            _loc1_.setupCustomerModel("standdojo2",true,"stand2_1");
            _loc1_.setupCustomerModel("talkdojo1",true,"dance1_2");
            _loc1_.setupCustomerModel("talkdojo2",true,"dance1_1");
            _loc1_.setupCustomerModel("standmochi",true,"dance1_1");
            _loc1_.setupCustomerModel("standfront1",false);
            _loc1_.setupCustomerModel("standfront2",true,"chewgum3");
            _loc1_.setupCustomerModel("standfront3",false);
         }
         class_6.method_1("---- Which Animation Mode: " + this.whichMode);
      }
      
      public function setupCustomerModel(param1:String, param2:Boolean, param3:String = "stand1_1", param4:String = null) : void
      {
         var id:Number = NaN;
         var clipname:String = null;
         var balloonMC:MovieClip = null;
         var holdwhich:Number = NaN;
         var shoppingbag:MovieClip = null;
         var bagwhich:Number = NaN;
         var modelname:String = param1;
         var shouldUse:Boolean = param2;
         var startingAnimation:String = param3;
         var useHandExtra:String = param4;
         var ob:StartDayScreen = this;
         if(shouldUse)
         {
            if(ob.gameObj.var_127.getHolidayMonth() == GameData.MONTH_OCTOBER && modelname != "customerfirst")
            {
               if(startingAnimation == "walk" || startingAnimation == "walk2" || startingAnimation == "walk3" || startingAnimation.indexOf("chewgum") == 0 || startingAnimation == "walktalking" || startingAnimation.indexOf("stand1") == 0 || startingAnimation.indexOf("stand2") == 0 || startingAnimation.indexOf("stand3") == 0)
               {
                  useHandExtra = "handextra_candypail";
                  if(startingAnimation == "walk")
                  {
                     startingAnimation = "walkbag";
                  }
                  else if(startingAnimation == "walk2")
                  {
                     startingAnimation = "walkbag2";
                  }
                  else if(startingAnimation == "walk3")
                  {
                     startingAnimation = "walkbag3";
                  }
               }
            }
            id = -1;
            while(id == -1 || ob.avoidIDs.indexOf(id) > -1)
            {
               id = Math.ceil(Math.random() * (ob.gameObj.var_131.getCustomerTotal() - 1));
            }
            clipname = ob.gameObj.var_131.getCustomerClipName(id);
            ob.buildCustomerModel(ob.clip[modelname],clipname);
            try
            {
               if(startingAnimation == "walkholding" || startingAnimation == "walkprize")
               {
                  balloonMC = new handextra_balloon();
                  holdwhich = Math.ceil(Math.random() * balloonMC.totalFrames);
                  if(startingAnimation == "walkprize")
                  {
                     holdwhich = 7 + Math.ceil(Math.random() * (balloonMC.totalFrames - 7));
                  }
                  balloonMC.gotoAndStop(holdwhich);
                  if(holdwhich >= 8)
                  {
                     ob.clip[modelname].handextra.addChild(balloonMC);
                     balloonMC.prize.gotoAndStop(ob.useWhichPrize);
                  }
                  else
                  {
                     ob.clip[modelname].handextratop.addChild(balloonMC);
                  }
               }
            }
            catch(err:Error)
            {
               class_6.error("Error adding stuff to handextratop: " + err.message);
            }
            try
            {
               if(useHandExtra != null)
               {
                  shoppingbag = class_14.method_103(useHandExtra,false,false);
                  bagwhich = Math.ceil(Math.random() * shoppingbag.totalFrames);
                  shoppingbag.gotoAndStop(bagwhich);
                  ob.clip[modelname].handextra.addChild(shoppingbag);
                  ob.clip[modelname].frontHandClosed = true;
               }
            }
            catch(err:Error)
            {
            }
            ob.clip[modelname].gotoAndPlay(startingAnimation);
            try
            {
               if(startingAnimation.indexOf("paper") > -1)
               {
                  ob.clip[modelname].book.gotoAndStop(1);
               }
               else if(startingAnimation.indexOf("coffee") > -1)
               {
                  ob.clip[modelname].mug.gotoAndStop(Math.ceil(Math.random() * 6) + 2);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error setting paper/mug for model.");
            }
            ob.usedModels.push(modelname);
            ob.usedAnimations.push(startingAnimation);
            ob.avoidIDs.push(id);
         }
         else
         {
            ob.clip[modelname].visible = false;
            ob.clip[modelname].stop();
            ob.clip.removeChild(ob.clip[modelname]);
         }
      }
      
      public function buildCustomerModel(param1:MovieClip, param2:String) : void
      {
         var _loc3_:StartDayScreen = this;
         _loc3_.gameObj.var_131.buildCustomer(param2,param1);
      }
      
      public function destroyCustomerModel(param1:MovieClip) : void
      {
         var whichClip:MovieClip = param1;
         whichClip.stop();
         try
         {
            whichClip.body.removeChildAt(0);
            whichClip.head.removeChildAt(0);
            whichClip.eyes.removeChildAt(0);
            whichClip.mouth.removeChildAt(0);
            whichClip.neck.removeChildAt(0);
            whichClip.front_shoe.removeChildAt(0);
            whichClip.back_shoe.removeChildAt(0);
            whichClip.fronthand.removeChildAt(0);
            whichClip.backhand.removeChildAt(0);
            whichClip.front_upperarm.removeChildAt(0);
            whichClip.back_upperarm.removeChildAt(0);
            whichClip.front_forearm.removeChildAt(0);
            whichClip.back_forearm.removeChildAt(0);
         }
         catch(err:Error)
         {
            class_6.error("Error removing parts of customer");
         }
         try
         {
            whichClip.hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            whichClip.back_hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            whichClip.handextra.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            whichClip.handextratop.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:StartDayScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new startdayBackdropMC();
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.wallparts["wall" + _loc4_].gotoAndStop(_loc2_.lobbyWallpaper);
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 9)
         {
            _loc5_.holder.floorparts["floor" + _loc4_].gotoAndStop(_loc2_.lobbyFlooring);
            _loc4_++;
         }
         _loc5_.holder.trim.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(150,172,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,150,172));
         _loc3_ = new Bitmap(_loc6_);
         _loc5_ = null;
         return _loc3_;
      }
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function updateWater() : void
      {
         this;
      }
      
      public function setupWater(param1:Boolean = true) : void
      {
         var _loc2_:StartDayScreen = this;
         if(param1)
         {
            if(_loc2_.gameObj.var_127.getMonth() == GameData.MONTH_OCTOBER)
            {
               _loc2_.clip.river.alpha = 0.63;
            }
         }
      }
      
      public function initBackdrop() : void
      {
         var _loc1_:StartDayScreen = this;
         var _loc2_:Number = _loc1_.gameObj.var_127.getMonth();
         var _loc3_:Number = _loc1_.gameObj.var_127.getMonth() * 2 - 1;
         if(_loc1_.gameObj.var_127.getMonth() == GameData.STARTER_MONTH && _loc1_.gameObj.var_127.isNewYear() == false)
         {
            _loc3_ = 25;
         }
         var _loc4_:Array = ["bg3","bg2","bg1","mg","fg"];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc1_.clip[_loc4_[_loc5_]].gotoAndStop(_loc3_);
            _loc1_.clip[_loc4_[_loc5_]].cacheAsBitmap = true;
            _loc1_.clip[_loc4_[_loc5_]].mouseEnabled = false;
            _loc1_.clip[_loc4_[_loc5_]].mouseChildren = false;
            _loc5_++;
         }
         _loc1_.clip.bg3.opaqueBackground = 16777215;
         if(_loc1_.gameObj.var_127.hasBonus("specialsign") && _loc1_.gameObj.var_127.showSpecialSign === 1 && _loc1_.gameObj.var_127.currentSpecial != -1)
         {
            _loc1_.clip.specialsign.visible = true;
            _loc1_.specialLogo = _loc1_.gameObj.var_132.getSpecialLogo(_loc1_.gameObj.var_127.currentSpecial);
            _loc1_.specialLogoBitmap = new Bitmap(_loc1_.specialLogo,"auto",true);
            _loc1_.clip.specialsign.holder.addChild(_loc1_.specialLogoBitmap);
         }
         else
         {
            _loc1_.clip.specialsign.visible = false;
         }
         if(_loc2_ != GameData.MONTH_SEPTEMBER)
         {
            _loc1_.clip.chicken_fg.stop();
            _loc1_.clip.chicken_mg.stop();
            _loc1_.clip.chicken_bg.stop();
            _loc1_.clip.removeChild(_loc1_.clip.chicken_fg);
            _loc1_.clip.removeChild(_loc1_.clip.chicken_mg);
            _loc1_.clip.removeChild(_loc1_.clip.chicken_bg);
         }
         else
         {
            _loc1_.clip.chicken_fg.gotoAndPlay(1);
            _loc1_.clip.chicken_mg.gotoAndPlay(28);
            _loc1_.clip.chicken_bg.gotoAndPlay(66);
         }
         if(_loc1_.gameObj.var_127.getRank() < 65)
         {
            _loc1_.clip.luckycat.stop();
            _loc1_.clip.removeChild(_loc1_.clip.luckycat);
         }
      }
   }
}
