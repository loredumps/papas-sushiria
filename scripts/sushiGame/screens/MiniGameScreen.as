package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import package_2.*;
   import package_4.class_5;
   import sushiGame.data.*;
   
   public class MiniGameScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var miniGame:MiniGame;
      
      public var forceGame:String = "";
      
      public var whichGame:String = "none";
      
      public var possibleGames:Array;
      
      public var prizeSets:Array;
      
      public var maxDifficulty:Number = 14;
      
      public var wonPrizeSKU:String = null;
      
      public var wonPrizeAmount:Number = 0;
      
      public var wonPrizeIsClothing:Boolean = false;
      
      public var wonPrizeClothingMode:String = "";
      
      public var clickedPlay:Boolean = false;
      
      public var didPlayApplause:Boolean = false;
      
      public var minigameMusic:SoundChannel;
      
      public var minigameFiller:SoundChannel;
      
      public var musicVolume:Number = 0;
      
      public var musicVolumeSpeed:Number = 0.05;
      
      public var shouldPlayMusic:Boolean = false;
      
      public var mannequinColor:uint = 14540253;
      
      public var kernFormat:TextFormat;
      
      public function MiniGameScreen(param1:class_5, param2:String = "")
      {
         this.possibleGames = [MiniGame.TYPE_HALLWAY,MiniGame.TYPE_MESS,MiniGame.TYPE_HOMERUN,MiniGame.TYPE_CHILI,MiniGame.TYPE_GOKART,MiniGame.TYPE_PUTT,MiniGame.TYPE_SHOT];
         this.prizeSets = [0,1,2,3,4,5,6];
         super();
         var _loc3_:MiniGameScreen = this;
         _loc3_.gameObj = param1;
         _loc3_.forceGame = param2;
         _loc3_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:MiniGameScreen = this;
         _loc1_.clip = new miniGameScreenMC();
         _loc1_.clip.x = 320;
         _loc1_.clip.y = 240;
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.kernFormat = new TextFormat();
         _loc1_.kernFormat.kerning = true;
         if(_loc1_.forceGame != "")
         {
            _loc1_.whichGame = _loc1_.forceGame;
         }
         else
         {
            _loc2_ = _loc1_.gameObj.var_127.getDay() % 7;
            _loc1_.whichGame = _loc1_.possibleGames[_loc2_];
         }
         _loc1_.clip.logo.gotoAndStop(_loc1_.whichGame);
         _loc1_.clip.hud.count.tickets_txt.text = String(_loc1_.gameObj.var_127.getTicketsTotal());
         _loc1_.clip.hud.count.tickets_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.skip_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSkip);
         _loc1_.clip.play_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickPlay);
         _loc1_.clip.hud.gotoAndPlay(2);
         _loc1_.clip.hud.title_txt.visible = false;
         _loc1_.updateStars();
         _loc1_.clip.gotoAndPlay("intro");
         _loc1_.clip.foodini.gotoAndPlay("intro");
         if(_loc1_.gameObj.var_127.getTicketsTotal() <= 0)
         {
            _loc1_.clip.logo.gotoAndStop("notickets");
            _loc1_.clip.gotoAndPlay("notickets");
            _loc1_.clip.foodini.gotoAndPlay("lose");
            _loc1_.clip.play_btn.visible = false;
         }
         _loc1_.gameObj.var_128.switchMusic("none");
         _loc1_.gameObj.var_128.playMusicClip("minigame_theme");
         _loc1_.minigameMusic = _loc1_.gameObj.var_128.playMusicClip("minigame_music",true,0);
         _loc1_.minigameFiller = _loc1_.gameObj.var_128.playMusicClip("minigame_fill",true);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         if(_loc1_.gameObj.var_127.hasTrained("minigame") == false)
         {
            _loc1_.clip.trainingclip.visible = true;
            _loc1_.gameObj.var_127.setTrained("minigame");
         }
         else
         {
            _loc1_.clip.trainingclip.visible = false;
         }
      }
      
      public function clickPlay(param1:MouseEvent) : void
      {
         var _loc2_:MiniGameScreen = this;
         if(_loc2_.clip.currentLabel == "waiting")
         {
            _loc2_.clickedPlay = true;
            _loc2_.clip.gotoAndPlay("hidetitle");
            _loc2_.clip.trainingclip.visible = false;
            _loc2_.gameObj.var_130.method_117("minigame-start");
         }
      }
      
      public function clickSkip(param1:MouseEvent) : void
      {
         var _loc2_:MiniGameScreen = this;
         if(_loc2_.clip.currentLabel == "waiting")
         {
            _loc2_.clickedPlay = false;
            _loc2_.clip.gotoAndPlay("hidetitle");
            _loc2_.clip.trainingclip.visible = false;
            _loc2_.gameObj.var_130.method_117("minigame-skip");
         }
      }
      
      public function startMiniGame() : void
      {
         var _loc1_:MiniGameScreen = this;
         _loc1_.wonPrizeSKU = null;
         _loc1_.wonPrizeAmount = 0;
         _loc1_.gameObj.var_127.useTicket(1);
         _loc1_.clip.hud.count.tickets_txt.text = String(_loc1_.gameObj.var_127.getTicketsTotal());
         _loc1_.clip.hud.count.tickets_txt.setTextFormat(_loc1_.kernFormat);
         var _loc2_:Number = _loc1_.possibleGames.indexOf(_loc1_.whichGame);
         _loc1_.gameObj.var_127.recordMinigamePlayed(_loc2_);
         if(_loc1_.whichGame == MiniGame.TYPE_GOKART)
         {
            _loc1_.miniGame = new MiniGameKart(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else if(_loc1_.whichGame == MiniGame.TYPE_HOMERUN)
         {
            _loc1_.miniGame = new MiniGameHomeRun(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else if(_loc1_.whichGame == MiniGame.TYPE_SHOT)
         {
            _loc1_.miniGame = new MiniGameHotshot(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else if(_loc1_.whichGame == MiniGame.TYPE_HALLWAY)
         {
            _loc1_.miniGame = new MiniGameHallway(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else if(_loc1_.whichGame == MiniGame.TYPE_PUTT)
         {
            _loc1_.miniGame = new MiniGamePutt(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else if(_loc1_.whichGame == MiniGame.TYPE_CHILI)
         {
            _loc1_.miniGame = new MiniGameChiliWorks(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else if(_loc1_.whichGame == MiniGame.TYPE_MESS)
         {
            _loc1_.miniGame = new MiniGameMess(_loc1_,_loc1_.clip.holder,_loc1_.whichGame);
         }
         else
         {
            _loc1_.miniGame = new MiniGameMess(_loc1_,_loc1_.clip.holder,MiniGame.TYPE_MESS);
         }
         _loc1_.shouldPlayMusic = true;
      }
      
      public function removeMiniGame() : void
      {
         var _loc1_:MiniGameScreen = this;
         if(_loc1_.miniGame != null)
         {
            _loc1_.miniGame.destroy();
            _loc1_.miniGame = null;
         }
         _loc1_.clip.hud.title_txt.visible = false;
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
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
      
      public function startShowingPrize() : void
      {
         var minigameIndex:Number = NaN;
         var useTips:Number = NaN;
         var dollars:Number = NaN;
         var cents:Number = NaN;
         var textCents:String = null;
         var textDollars:String = null;
         var clothing:ClothingItem = null;
         var furniData:FurniData = null;
         var ob:MiniGameScreen = this;
         var user:UserData = ob.gameObj.var_127;
         if(ob.wonPrizeSKU == "tips")
         {
            user.earnMinigameTips(ob.wonPrizeAmount);
         }
         else if(ob.wonPrizeSKU == "tickets")
         {
            user.earnMinigameTickets(ob.wonPrizeAmount);
         }
         else
         {
            minigameIndex = ob.possibleGames.indexOf(ob.whichGame);
            if(!ob.wonPrizeIsClothing)
            {
               user.earnMinigameFurniture(ob.wonPrizeSKU,minigameIndex);
            }
            else
            {
               if(ob.wonPrizeClothingMode == "gender")
               {
                  ob.wonPrizeSKU += "_" + ob.gameObj.workerData.gender;
               }
               ob.wonPrizeSKU = user.adjustClothingIfAlreadyOwned(ob.wonPrizeSKU);
               user.earnMinigameClothing(ob.wonPrizeSKU,minigameIndex);
            }
         }
         if(ob.gameObj.var_132.isRarePrize(ob.wonPrizeSKU))
         {
            ob.clip.prizepanel.rarelabel.visible = true;
         }
         else
         {
            ob.clip.prizepanel.rarelabel.visible = false;
         }
         if(ob.wonPrizeSKU == "tips")
         {
            ob.clip.prizepanel.furnipanel.visible = false;
            ob.clip.prizepanel.ticketpanel.visible = false;
            ob.clip.prizepanel.tipspanel.visible = true;
            useTips = ob.wonPrizeAmount;
            dollars = Math.floor(useTips / 100);
            cents = useTips - dollars * 100;
            textCents = String(cents);
            if(textCents.length < 2)
            {
               textCents = "0" + textCents;
            }
            textDollars = class_12.method_114(dollars);
            ob.clip.prizepanel.tipspanel.tips_txt.text = "$" + textDollars + "." + textCents;
            ob.clip.prizepanel.tipspanel.tips_txt.setTextFormat(ob.kernFormat);
         }
         else if(ob.wonPrizeSKU == "tickets")
         {
            ob.clip.prizepanel.furnipanel.visible = false;
            ob.clip.prizepanel.ticketpanel.visible = true;
            ob.clip.prizepanel.tipspanel.visible = false;
            ob.clip.prizepanel.ticketpanel.tickets_txt.text = String(ob.wonPrizeAmount);
            ob.clip.prizepanel.ticketpanel.tickets_txt.setTextFormat(ob.kernFormat);
         }
         else if(ob.wonPrizeIsClothing)
         {
            ob.clip.prizepanel.furnipanel.visible = true;
            ob.clip.prizepanel.ticketpanel.visible = false;
            ob.clip.prizepanel.tipspanel.visible = false;
            clothing = ob.gameObj.var_134.getItemFromSKU(ob.wonPrizeSKU);
            ob.clip.prizepanel.furnipanel.title_txt.text = clothing.title;
            ob.clip.prizepanel.furnipanel.info_txt.text = "";
            ob.clip.prizepanel.furnipanel.effect_txt.text = "";
            ob.clip.prizepanel.furnipanel.title_txt.setTextFormat(ob.kernFormat);
            ob.clip.prizepanel.furnipanel.own_txt.visible = false;
            ob.clip.prizepanel.furnipanel.own_label.visible = false;
            try
            {
               if(ob.clip.prizepanel.furnipanel.thumb.numChildren > 0)
               {
                  ob.clip.prizepanel.furnipanel.thumb.removeChildAt(0);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error removing thumb.");
            }
            ob.clip.prizepanel.furnipanel.thumb.addChild(ob.gameObj.var_134.generateClothingThumb(ob.wonPrizeSKU,ob.gameObj.workerData.gender,50,50,100,100));
         }
         else
         {
            ob.clip.prizepanel.furnipanel.visible = true;
            ob.clip.prizepanel.ticketpanel.visible = false;
            ob.clip.prizepanel.tipspanel.visible = false;
            furniData = ob.gameObj.var_132.getFurniFromTag(ob.wonPrizeSKU);
            ob.clip.prizepanel.furnipanel.title_txt.text = furniData.title;
            ob.clip.prizepanel.furnipanel.info_txt.text = "";
            ob.clip.prizepanel.furnipanel.effect_txt.text = "";
            ob.clip.prizepanel.furnipanel.own_txt.text = String(user.getFurniAmount(furniData.tag,true));
            ob.clip.prizepanel.furnipanel.own_txt.visible = true;
            ob.clip.prizepanel.furnipanel.own_label.visible = true;
            ob.clip.prizepanel.furnipanel.title_txt.setTextFormat(ob.kernFormat);
            ob.clip.prizepanel.furnipanel.own_txt.setTextFormat(ob.kernFormat);
            if(ob.gameObj.var_132.isRarePrize(ob.wonPrizeSKU))
            {
               ob.clip.prizepanel.furnipanel.own_txt.visible = false;
               ob.clip.prizepanel.furnipanel.own_label.visible = false;
            }
            try
            {
               if(ob.clip.prizepanel.furnipanel.thumb.numChildren > 0)
               {
                  ob.clip.prizepanel.furnipanel.thumb.removeChildAt(0);
               }
            }
            catch(err:Error)
            {
               class_6.error("Error removing thumb.");
            }
            ob.clip.prizepanel.furnipanel.thumb.addChild(ob.createFurniThumbnail(furniData));
         }
         ob.updateStars();
      }
      
      public function destroy() : void
      {
         var _loc1_:MiniGameScreen = this;
         if(_loc1_.miniGame)
         {
            _loc1_.miniGame.destroy();
            _loc1_.miniGame = null;
         }
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.skip_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSkip);
         _loc1_.clip.play_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickPlay);
         if(_loc1_.minigameMusic)
         {
            _loc1_.minigameMusic.stop();
            _loc1_.minigameMusic = null;
         }
         if(_loc1_.minigameFiller)
         {
            _loc1_.minigameFiller.stop();
            _loc1_.minigameFiller = null;
         }
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function updateScreen(param1:Event = null) : void
      {
         var _loc3_:SoundTransform = null;
         var _loc4_:SoundTransform = null;
         var _loc5_:SoundTransform = null;
         var _loc6_:SoundTransform = null;
         var _loc7_:SoundTransform = null;
         var _loc2_:MiniGameScreen = this;
         if(_loc2_.miniGame != null)
         {
            try
            {
               _loc2_.miniGame.updateScreen();
            }
            catch(err:Error)
            {
            }
         }
         if(_loc2_.gameObj.var_128.isMusicMute)
         {
            _loc3_ = new SoundTransform(0);
            if(_loc2_.minigameMusic)
            {
               _loc2_.minigameMusic.soundTransform = _loc3_;
            }
            if(_loc2_.minigameFiller)
            {
               _loc2_.minigameFiller.soundTransform = _loc3_;
            }
         }
         else if(_loc2_.shouldPlayMusic)
         {
            if(_loc2_.musicVolume < 1)
            {
               _loc2_.musicVolume += _loc2_.musicVolumeSpeed;
               _loc4_ = new SoundTransform(_loc2_.musicVolume);
               if(_loc2_.minigameMusic)
               {
                  _loc2_.minigameMusic.soundTransform = _loc4_;
               }
               _loc5_ = new SoundTransform(1 - _loc2_.musicVolume);
               if(_loc2_.minigameFiller)
               {
                  _loc2_.minigameFiller.soundTransform = _loc5_;
               }
            }
         }
         else if(_loc2_.musicVolume > 0)
         {
            _loc2_.musicVolume -= _loc2_.musicVolumeSpeed;
            _loc6_ = new SoundTransform(_loc2_.musicVolume);
            if(_loc2_.minigameMusic)
            {
               _loc2_.minigameMusic.soundTransform = _loc6_;
            }
            _loc7_ = new SoundTransform(1 - _loc2_.musicVolume);
            if(_loc2_.minigameFiller)
            {
               _loc2_.minigameFiller.soundTransform = _loc7_;
            }
         }
         if(_loc2_.clip.currentLabel == "waiting" && !_loc2_.didPlayApplause)
         {
            _loc2_.gameObj.var_128.playSound("applause.wav");
            _loc2_.didPlayApplause = true;
         }
         if(_loc2_.clip.currentLabel == "decideplay")
         {
            if(_loc2_.clickedPlay)
            {
               _loc2_.clip.gotoAndPlay("showgame");
               _loc2_.startMiniGame();
            }
            else
            {
               _loc2_.clip.gotoAndPlay("fadeout");
            }
         }
         else if(_loc2_.clip.currentLabel == "decideprize")
         {
            _loc2_.removeMiniGame();
            _loc2_.clip.hud.count.tickets_txt.text = String(_loc2_.gameObj.var_127.getTicketsTotal());
            _loc2_.clip.hud.count.tickets_txt.setTextFormat(_loc2_.kernFormat);
            if(_loc2_.wonPrizeSKU != null)
            {
               _loc2_.clip.gotoAndPlay("showprize");
               _loc2_.startShowingPrize();
            }
            else
            {
               if(_loc2_.gameObj.var_127.getTicketsTotal() > 0)
               {
                  _loc2_.clip.gotoAndPlay("showtitle");
                  _loc2_.clip.foodini.gotoAndPlay("intro");
               }
               else
               {
                  _loc2_.clip.gotoAndPlay("fadeout");
               }
               _loc2_.gameObj.var_127.saveData();
            }
         }
         else if(_loc2_.clip.currentLabel == "deciderepeat")
         {
            if(_loc2_.gameObj.var_127.getTicketsTotal() > 0)
            {
               _loc2_.clip.gotoAndPlay("showtitle");
               _loc2_.clip.foodini.gotoAndPlay("intro");
            }
            else
            {
               _loc2_.clip.gotoAndPlay("fadeout");
            }
         }
         else if(_loc2_.clip.currentLabel == "end")
         {
            _loc2_.gameObj.method_144();
         }
      }
      
      public function setTitle(param1:String) : void
      {
         var _loc2_:MiniGameScreen = this;
         _loc2_.clip.hud.title_txt.visible = true;
         _loc2_.clip.hud.title_txt.text = param1;
         _loc2_.clip.hud.title_txt.setTextFormat(_loc2_.kernFormat);
      }
      
      public function updateStars() : void
      {
         var _loc1_:MiniGameScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Number = _loc1_.possibleGames.indexOf(_loc1_.whichGame);
         var _loc4_:Number;
         if((_loc4_ = Number(_loc2_.minigamePrizes[_loc3_])) > 42)
         {
            _loc4_ = 42;
         }
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         14;
         if(_loc4_ == 0)
         {
            _loc6_ = 0;
            _loc5_ = 0;
         }
         else
         {
            _loc6_ = Math.floor((_loc4_ - 1) / 14);
            class_6.method_1("Num Prizes: " + _loc4_ + ", Set = " + _loc6_);
            _loc5_ = _loc4_ - _loc6_ * 14;
            class_6.method_1("Stars to show: " + _loc5_);
         }
         if(_loc6_ > 2)
         {
            _loc6_ = 2;
            _loc5_ = 14;
         }
         if(_loc5_ > 14)
         {
            _loc5_ = 14;
         }
         _loc1_.clip.hud.stars.visible = true;
         var _loc8_:String = "bronze";
         if(_loc6_ == 1)
         {
            _loc8_ = "silver";
         }
         else if(_loc6_ == 2)
         {
            _loc8_ = "gold";
         }
         class_6.method_1("Earned " + _loc2_.minigamePrizes[_loc3_] + " prizes.  Show " + _loc5_ + " " + _loc8_ + " Stars.");
         var _loc9_:int = 0;
         while(_loc9_ < 14)
         {
            if(_loc9_ < _loc5_)
            {
               _loc1_.clip.hud.stars["star" + _loc9_].gotoAndStop(_loc8_);
            }
            else
            {
               _loc1_.clip.hud.stars["star" + _loc9_].gotoAndStop("unearned");
            }
            _loc9_++;
         }
         if(_loc6_ == 0 && _loc5_ == 14 || _loc6_ > 0)
         {
            _loc1_.clip.hud.stars.bonus0.gotoAndStop("bronze");
         }
         else
         {
            _loc1_.clip.hud.stars.bonus0.gotoAndStop("unearned");
         }
         if(_loc6_ == 1 && _loc5_ == 14 || _loc6_ > 1)
         {
            _loc1_.clip.hud.stars.bonus1.gotoAndStop("silver");
         }
         else
         {
            _loc1_.clip.hud.stars.bonus1.gotoAndStop("unearned");
         }
         if(_loc6_ == 2 && _loc5_ == 14 || _loc6_ > 2)
         {
            _loc1_.clip.hud.stars.bonus2.gotoAndStop("gold");
         }
         else
         {
            _loc1_.clip.hud.stars.bonus2.gotoAndStop("unearned");
         }
      }
      
      public function finishMiniGame(param1:String = null, param2:Number = 1, param3:Boolean = false, param4:String = "") : void
      {
         var _loc5_:MiniGameScreen;
         (_loc5_ = this).wonPrizeSKU = param1;
         _loc5_.wonPrizeAmount = param2;
         _loc5_.wonPrizeIsClothing = param3;
         _loc5_.wonPrizeClothingMode = param4;
         _loc5_.gameObj.var_128.playSound("applause.wav");
         _loc5_.clip.gotoAndPlay("finishgame");
         _loc5_.shouldPlayMusic = false;
         if(_loc5_.gameObj.var_132.isRarePrize(param1))
         {
            _loc5_.gameObj.var_136.recordTagged("rareprize");
         }
      }
   }
}
