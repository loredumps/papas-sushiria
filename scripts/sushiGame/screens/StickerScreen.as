package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.Rectangle;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.StickerData;
   import sushiGame.data.UserData;
   import sushiGame.managers.ChallengeManager;
   
   public class StickerScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip = null;
      
      public var params:Object = null;
      
      public var inMenu:Boolean = false;
      
      public var clip:MovieClip;
      
      public var isClosing:Boolean = false;
      
      private var badgeIndex:Number = -1;
      
      private var panelScrollDir:Number = 0;
      
      private var panels:Vector.<MovieClip> = null;
      
      private var panelScrollbarStart:Number = 102;
      
      private var panelScrollbarRange:Number = 240;
      
      private var panelScrollAreaStart:Number = 66;
      
      private var panelScrollAreaHeight:Number = 313;
      
      private var panelSortMode:String = "abc";
      
      private var panelStartX:Number = 0;
      
      private var panelStartY:Number = 4;
      
      private var panelSpacingY:Number = 62;
      
      private var lastClickedValue:* = null;
      
      private var stickers:Vector.<MovieClip> = null;
      
      private var stickerScrollAreaStart:Number = 18;
      
      private var stickerScrollAreaHeight:Number = 361;
      
      private var isScrollingToHilite:Boolean = false;
      
      private var hiliteStickerTarget:Number = 0;
      
      private var hilitePanelTarget:Number = 0;
      
      private var isDraggingStickers:Boolean = false;
      
      private var dragStickersStartY:Number = 0;
      
      private var dragStickersLastY:Number = 0;
      
      private var stickerEaseMaxSpeed:Number = 80;
      
      private var stickerEaseSpeed:Number = 0;
      
      private var shouldUpdateStickerDisplay:Boolean = false;
      
      private var didAdjustIcons:Boolean = false;
      
      private var anyNewQuests:Boolean = false;
      
      private var isActive:Boolean = false;
      
      private var lastMinPanel:Number = -1;
      
      private var lastMaxPanel:Number = -1;
      
      public function StickerScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:StickerScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.params = param3;
         if(param3 != null)
         {
            class_6.method_1("Sticker Screen in Menu");
            if(param3.hasOwnProperty("inMenu"))
            {
               _loc4_.inMenu = param3.inMenu;
            }
         }
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:StickerScreen = this;
         _loc1_.clip = new stickerScreenMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         if(_loc1_.inMenu)
         {
            _loc1_.clip.fader.stop();
            _loc1_.clip.fader.visible = false;
         }
         else
         {
            _loc1_.gameObj.var_128.switchMusic("order");
         }
         _loc1_.panels = new Vector.<MovieClip>();
         _loc1_.populateStickers();
         _loc1_.populatePanels(true,true);
         _loc1_.clip.up_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickArrow);
         _loc1_.clip.down_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickArrow);
         _loc1_.clip.drag_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDragger);
         _loc1_.clip.drag_btn.addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverDragger);
         _loc1_.clip.drag_btn.addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutDragger);
         _loc1_.clip.drag_btn.buttonMode = true;
         _loc1_.clip.drag_btn.useHandCursor = true;
         _loc1_.clip.drag_btn.gotoAndStop(1);
         _loc1_.clip.sort_abc.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortMode);
         _loc1_.clip.sort_earned.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortMode);
         _loc1_.clip.sort_need.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortMode);
         _loc1_.clip.sort_abc.gotoAndStop(1);
         _loc1_.clip.sort_earned.gotoAndStop(2);
         _loc1_.clip.sort_need.gotoAndStop(2);
         _loc1_.clip.panelholder.mask = _loc1_.clip.panelmask;
         _loc1_.gameObj.var_130.api.addEventListener("earnedSticker",_loc1_.updateStickerDisplayListener);
         _loc1_.gameObj.var_130.api.addEventListener("gaveCoupon",_loc1_.updateStickerDisplayListener);
      }
      
      public function updateStickerDisplayListener(param1:Event) : void
      {
         var _loc2_:StickerScreen = this;
         class_6.method_1(" >>> Earned a Sticker, Update Screen when you move here!");
         _loc2_.shouldUpdateStickerDisplay = true;
      }
      
      public function updateStickerDisplay() : void
      {
         var _loc1_:StickerScreen = this;
         class_6.method_1("   (Updating Sticker Display)");
         _loc1_.populateStickers(false);
         _loc1_.populateStickers(true);
         _loc1_.populatePanels(true);
      }
      
      public function populateStickers(param1:Boolean = true) : void
      {
         var _loc5_:int = 0;
         var _loc6_:StickerData = null;
         var _loc7_:MovieClip = null;
         var _loc2_:StickerScreen = this;
         var _loc3_:ChallengeManager = _loc2_.gameObj.var_136;
         var _loc4_:UserData = _loc2_.gameObj.var_127;
         if(param1)
         {
            _loc2_.clip.holder.buttonMode = true;
            _loc2_.clip.holder.useHandCursor = true;
            _loc2_.stickers = new Vector.<MovieClip>();
            _loc5_ = 0;
            while(_loc5_ < _loc3_.stickers.length)
            {
               _loc6_ = _loc3_.stickers[_loc5_];
               (_loc7_ = class_14.method_103("stix_" + _loc6_.sku,true,false)).lines.alpha = 0;
               _loc7_.x = _loc6_.x;
               _loc7_.y = _loc6_.y;
               _loc7_.sku = _loc6_.sku;
               if(_loc4_.hasBadge(_loc3_.getChallengeIndexForSticker(_loc6_.sku)))
               {
                  _loc7_.gotoAndStop(1);
               }
               else
               {
                  _loc7_.gotoAndStop(2);
               }
               _loc2_.clip.holder.addChild(_loc7_);
               _loc7_.buttonMode = true;
               _loc7_.useHandCursor = true;
               _loc7_.addEventListener(MouseEvent.MOUSE_UP,_loc2_.clickSticker);
               _loc7_.addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverSticker);
               _loc7_.addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutSticker);
               _loc2_.stickers.push(_loc7_);
               _loc5_++;
            }
            _loc2_.clip.holder.graphics.beginFill(0,0);
            _loc2_.clip.holder.graphics.drawRect(0,0,_loc2_.clip.holder.width,_loc2_.clip.holder.height);
            _loc2_.clip.holder.graphics.endFill();
            _loc2_.clip.holder.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickStickerArea);
         }
         else
         {
            _loc2_.clip.holder.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickStickerArea);
            if(_loc2_.stickers)
            {
               _loc5_ = int(_loc2_.stickers.length - 1);
               while(_loc5_ >= 0)
               {
                  if(_loc2_.stickers[_loc5_])
                  {
                     if(_loc2_.stickers[_loc5_].parent)
                     {
                        _loc2_.stickers[_loc5_].parent.removeChild(_loc2_.stickers[_loc5_]);
                     }
                     _loc2_.stickers[_loc5_].removeEventListener(MouseEvent.MOUSE_UP,_loc2_.clickSticker);
                     _loc2_.stickers[_loc5_].removeEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverSticker);
                     _loc2_.stickers[_loc5_].removeEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutSticker);
                     _loc2_.stickers[_loc5_] = null;
                     _loc2_.stickers.splice(_loc5_,1);
                  }
                  _loc5_--;
               }
            }
            _loc2_.stickers = null;
         }
      }
      
      public function clickSticker(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:StickerScreen = this;
         if(_loc2_.isDraggingStickers)
         {
            if((_loc5_ = Math.abs(_loc2_.dragStickersStartY - _loc2_.clip.holder.y)) > 10)
            {
               return;
            }
         }
         var _loc3_:String = String(MovieClip(param1.currentTarget).sku);
         var _loc4_:Number = _loc2_.gameObj.var_136.getChallengeIndexForSticker(_loc3_);
         class_6.method_1("MOUSEUP STICKER");
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.lastClickedValue != _loc4_)
         {
            _loc2_.hiliteSticker(_loc4_,false,true);
            _loc2_.lastClickedValue = _loc4_;
         }
      }
      
      public function rolloverSticker(param1:MouseEvent) : void
      {
         this;
         var _loc3_:MovieClip = MovieClip(param1.currentTarget);
         if(_loc3_.lines.alpha == 0)
         {
            _loc3_.lines.alpha = 0.5;
         }
      }
      
      public function rolloutSticker(param1:MouseEvent) : void
      {
         this;
         var _loc3_:MovieClip = MovieClip(param1.currentTarget);
         if(_loc3_.lines.alpha != 1)
         {
            _loc3_.lines.alpha = 0;
         }
      }
      
      public function clickStickerArea(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         var _loc3_:Number = _loc2_.stickerScrollAreaStart;
         var _loc4_:Number = _loc2_.stickerScrollAreaStart + _loc2_.stickerScrollAreaHeight - _loc2_.clip.holder.height;
         _loc2_.clip.holder.startDrag(false,new Rectangle(_loc2_.clip.holder.x,_loc4_,0,_loc3_ - _loc4_));
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseStickerArea);
         _loc2_.stickerEaseSpeed = 0;
         _loc2_.isDraggingStickers = true;
         _loc2_.dragStickersStartY = _loc2_.clip.holder.y;
         _loc2_.isScrollingToHilite = false;
      }
      
      public function releaseStickerArea(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         class_6.method_1("RELEASE STICKER AREA");
         _loc2_.isDraggingStickers = false;
         _loc2_.clip.holder.stopDrag();
         var _loc3_:Number = _loc2_.clip.holder.y - _loc2_.dragStickersLastY;
         if(_loc3_ < 0)
         {
            _loc2_.stickerEaseSpeed = Math.max(0 - _loc2_.stickerEaseMaxSpeed,_loc3_);
         }
         else
         {
            _loc2_.stickerEaseSpeed = Math.min(_loc2_.stickerEaseMaxSpeed,_loc3_);
         }
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseStickerArea);
      }
      
      public function hiliteSticker(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc5_:int = 0;
         var _loc4_:StickerScreen = this;
         40;
         26;
         10;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:Number = 0;
         var _loc14_:Number = 0;
         var _loc15_:Number = 0;
         var _loc16_:String = _loc4_.gameObj.var_136.getStickerForChallenge(param1);
         _loc4_.stickerEaseSpeed = 0;
         class_6.method_1("Should be Hiliting Sticker " + _loc16_ + " (Badge Index: " + param1 + ": " + _loc4_.gameObj.var_136.getChallengeTitle(param1));
         _loc5_ = 0;
         while(_loc5_ < _loc4_.stickers.length)
         {
            if(_loc4_.stickers[_loc5_].sku == _loc16_)
            {
               _loc4_.stickers[_loc5_].lines.alpha = 1;
               _loc9_ = _loc4_.stickers[_loc5_].y;
            }
            else
            {
               _loc4_.stickers[_loc5_].lines.alpha = 0;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.panels.length)
         {
            if(_loc4_.panels[_loc5_].badgeIndex == param1)
            {
               _loc4_.panels[_loc5_].hilite.alpha = 1;
               _loc10_ = _loc4_.panels[_loc5_].y;
            }
            else
            {
               _loc4_.panels[_loc5_].hilite.alpha = 0;
            }
            _loc5_++;
         }
         if(param2)
         {
            _loc13_ = _loc4_.stickerScrollAreaStart + 26 - _loc9_ + 40;
            _loc14_ = _loc4_.stickerScrollAreaStart + _loc4_.stickerScrollAreaHeight - _loc9_ - 40;
            _loc15_ = _loc14_ - (_loc14_ - _loc13_) / 2;
            _loc11_ = (_loc12_ = _loc4_.stickerScrollAreaStart) - (_loc4_.clip.holder.height - _loc4_.stickerScrollAreaHeight);
            class_6.method_1("Sticker is at " + _loc9_ + ".  Scoller is at " + _loc4_.clip.holder.y + ".  Min/Max to be onscreen: " + _loc13_ + "/" + _loc14_);
            if(_loc4_.clip.holder.y < _loc13_)
            {
               _loc4_.hiliteStickerTarget = _loc15_;
            }
            else if(_loc4_.clip.holder.y > _loc14_)
            {
               _loc4_.hiliteStickerTarget = _loc15_;
            }
            else
            {
               _loc4_.hiliteStickerTarget = _loc15_;
            }
            class_6.method_1("Panel New Target: " + _loc4_.hiliteStickerTarget);
            if(_loc4_.hiliteStickerTarget < _loc11_)
            {
               _loc4_.hiliteStickerTarget = _loc11_;
               class_6.error("MIN OOB");
            }
            else if(_loc4_.hiliteStickerTarget > _loc12_)
            {
               _loc4_.hiliteStickerTarget = _loc12_;
               class_6.error("MAX OOB");
            }
            _loc4_.isScrollingToHilite = true;
         }
         else
         {
            _loc4_.hiliteStickerTarget = _loc4_.clip.holder.y;
         }
         if(param3)
         {
            _loc13_ = _loc4_.panelScrollAreaStart - _loc10_ + 10;
            _loc14_ = _loc4_.panelScrollAreaStart + _loc4_.panelScrollAreaHeight - _loc10_ - 10 - _loc4_.panelSpacingY;
            _loc15_ = _loc14_ - (_loc14_ - _loc13_) / 2;
            _loc11_ = (_loc12_ = _loc4_.panelScrollAreaStart) - (_loc4_.clip.panelholder.height - _loc4_.panelScrollAreaHeight);
            class_6.method_1("Panel is at " + _loc10_ + ".  Scoller is at " + _loc4_.clip.panelholder.y + ".  Min/Max to be onscreen: " + _loc13_ + "/" + _loc14_);
            if(_loc4_.clip.panelholder.y < _loc13_)
            {
               _loc4_.hilitePanelTarget = _loc15_;
            }
            else if(_loc4_.clip.panelholder.y > _loc14_)
            {
               _loc4_.hilitePanelTarget = _loc15_;
            }
            else
            {
               _loc4_.hilitePanelTarget = _loc15_;
            }
            class_6.method_1("Panel New Target: " + _loc4_.hilitePanelTarget);
            if(_loc4_.hilitePanelTarget < _loc11_)
            {
               _loc4_.hilitePanelTarget = _loc11_;
               class_6.error("OOB MIN");
            }
            else if(_loc4_.hilitePanelTarget > _loc12_)
            {
               _loc4_.hilitePanelTarget = _loc12_;
               class_6.error("OOB MAX");
            }
            _loc4_.isScrollingToHilite = true;
         }
         else
         {
            _loc4_.hilitePanelTarget = _loc4_.clip.panelholder.y;
         }
      }
      
      public function populatePanels(param1:Boolean = false, param2:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:MovieClip = null;
         var _loc14_:String = null;
         var _loc3_:StickerScreen = this;
         var _loc4_:ChallengeManager = _loc3_.gameObj.var_136;
         var _loc5_:UserData = _loc3_.gameObj.var_127;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Boolean = false;
         _loc3_.removePanels();
         _loc3_.lastMaxPanel = -1;
         _loc3_.lastMinPanel = -1;
         var _loc11_:Array = _loc3_.getBadges(_loc3_.panelSortMode);
         _loc6_ = 0;
         while(_loc6_ < _loc11_.length)
         {
            _loc12_ = Number(_loc11_[_loc6_]);
            _loc13_ = new sticker_info_panel();
            _loc14_ = "" + (_loc12_ + 1);
            if(_loc12_ + 1 < 10)
            {
               _loc14_ = "00" + _loc14_;
            }
            else if(_loc12_ + 1 < 100)
            {
               _loc14_ = "0" + _loc14_;
            }
            _loc13_.title_txt.text = _loc14_ + "  " + _loc4_.getChallengeTitle(_loc12_);
            _loc13_.description_txt.text = _loc4_.getChallengeDescription(_loc12_);
            _loc13_.tally_txt.text = _loc4_.getBadgeTallyString(_loc12_);
            _loc13_.hilite.alpha = 0;
            if(_loc5_.hasBadge(_loc12_))
            {
               _loc13_.bg.gotoAndStop(2);
               _loc13_.title_txt.x = 15;
               _loc13_.title_txt.textColor = 16745495;
               _loc13_.checkmark.visible = true;
               _loc13_.tally_txt.visible = false;
               _loc7_++;
               _loc13_.newstar.stop();
               _loc13_.newstar.bg.stop();
               _loc13_.newstar.visible = false;
               _loc13_.isNew = false;
            }
            else
            {
               _loc13_.bg.gotoAndStop(1);
               _loc13_.title_txt.x = 4;
               _loc13_.title_txt.textColor = 1992297;
               _loc13_.checkmark.visible = false;
            }
            _loc8_++;
            if(_loc4_.shouldLockBadge(_loc12_))
            {
               _loc13_.title_txt.text = _loc14_ + "  (Hidden Achievement)";
               _loc13_.title_txt.textColor = 6710886;
               _loc13_.description_txt.text = "You don\'t have everything available to earn this Sticker yet!";
               _loc13_.description_txt.textColor = 10066329;
               _loc13_.tally_txt.text = "";
               _loc13_.newstar.stop();
               _loc13_.newstar.bg.stop();
               _loc13_.newstar.visible = false;
               _loc9_++;
            }
            else if(_loc5_.hasBadge(_loc12_) == false)
            {
               if(_loc5_.hasViewedBadge(_loc12_) == false && _loc4_.getBadgeIsQuest(_loc12_) == true)
               {
                  _loc13_.newstar.visible = true;
                  _loc13_.newstar.gotoAndStop(1);
                  _loc13_.title_txt.x = 15;
                  _loc10_ = true;
                  _loc13_.isNew = true;
               }
               else if(_loc5_.hasViewedBadge(_loc12_) == true && _loc4_.getBadgeIsQuest(_loc12_) == true)
               {
                  _loc13_.newstar.visible = true;
                  _loc13_.newstar.gotoAndStop(2);
                  _loc13_.title_txt.x = 15;
                  _loc13_.isNew = false;
               }
               else
               {
                  _loc13_.newstar.stop();
                  _loc13_.newstar.bg.stop();
                  _loc13_.newstar.visible = false;
                  _loc13_.isNew = false;
               }
            }
            _loc13_.buttonMode = true;
            _loc13_.useHandCursor = true;
            _loc13_.mouseEnabled = true;
            _loc13_.badgeIndex = _loc12_;
            _loc13_.addEventListener(MouseEvent.MOUSE_DOWN,_loc3_.clickPanel);
            _loc13_.addEventListener(MouseEvent.ROLL_OVER,_loc3_.rolloverPanel);
            _loc13_.addEventListener(MouseEvent.ROLL_OUT,_loc3_.rolloutPanel);
            _loc13_.x = _loc3_.panelStartX;
            _loc13_.y = _loc3_.panelStartY + _loc3_.panelSpacingY * _loc6_;
            _loc3_.clip.panelholder.addChild(_loc13_);
            _loc3_.panels.push(_loc13_);
            _loc6_++;
         }
         _loc3_.clip.tally_txt.text = _loc7_ + "/" + _loc8_;
         _loc3_.clip.percent_txt.text = Math.floor(_loc7_ / _loc8_ * 100) + "%";
         if(param1)
         {
            _loc3_.clip.panelholder.y = _loc3_.panelScrollAreaStart;
            _loc3_.clip.drag_btn.y = _loc3_.panelScrollbarStart;
         }
         if(_loc10_)
         {
            _loc3_.anyNewQuests = true;
         }
      }
      
      public function removePanels() : void
      {
         var _loc2_:int = 0;
         var _loc1_:StickerScreen = this;
         if(_loc1_.panels != null && _loc1_.panels.length > 0)
         {
            _loc2_ = int(_loc1_.panels.length - 1);
            while(_loc2_ >= 0)
            {
               if(_loc1_.panels[_loc2_].parent)
               {
                  _loc1_.panels[_loc2_].parent.removeChild(_loc1_.panels[_loc2_]);
                  _loc1_.panels[_loc2_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickPanel);
                  _loc1_.panels[_loc2_].removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverPanel);
                  _loc1_.panels[_loc2_].removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutPanel);
                  _loc1_.panels[_loc2_] = null;
                  _loc1_.panels.splice(_loc2_,1);
               }
               _loc2_--;
            }
         }
      }
      
      public function clickPanel(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         var _loc3_:Number = Number(MovieClip(param1.currentTarget).badgeIndex);
         class_6.method_1("Click panel for " + _loc3_);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.lastClickedValue != _loc3_)
         {
            _loc2_.hiliteSticker(_loc3_,true,false);
            _loc2_.lastClickedValue = _loc3_;
         }
      }
      
      public function rolloverPanel(param1:MouseEvent) : void
      {
         this;
         var _loc3_:MovieClip = MovieClip(param1.currentTarget);
         if(_loc3_.hilite.alpha == 0)
         {
            _loc3_.hilite.alpha = 0.5;
         }
      }
      
      public function rolloutPanel(param1:MouseEvent) : void
      {
         this;
         var _loc3_:MovieClip = MovieClip(param1.currentTarget);
         if(_loc3_.hilite.alpha != 1)
         {
            _loc3_.hilite.alpha = 0;
         }
      }
      
      public function getBadges(param1:String) : Array
      {
         var _loc5_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Object = null;
         var _loc2_:StickerScreen = this;
         var _loc3_:ChallengeManager = _loc2_.gameObj.var_136;
         var _loc4_:UserData = _loc2_.gameObj.var_127;
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_.badges.length)
         {
            _loc8_ = 0;
            if(_loc4_.hasBadge(_loc5_))
            {
               _loc8_ = 0;
            }
            else if(_loc3_.getBadgeIsQuest(_loc5_) && _loc3_.shouldLockBadge(_loc5_) == false)
            {
               if(_loc4_.hasViewedBadge(_loc5_) == false)
               {
                  _loc8_ = 3;
               }
               else
               {
                  _loc8_ = 2;
               }
            }
            else
            {
               _loc8_ = 1;
            }
            _loc9_ = {
               "idx":_loc5_,
               "percent":_loc3_.getBadgePercentCompletion(_loc5_),
               "quest":_loc8_
            };
            _loc7_.push(_loc9_);
            _loc5_++;
         }
         if(param1 != "abc")
         {
            if(param1 == "earned")
            {
               _loc7_ = _loc7_.sortOn("percent",Array.NUMERIC | Array.DESCENDING);
            }
            else if(param1 == "need")
            {
               _loc7_ = _loc7_.sortOn("quest",Array.NUMERIC | Array.DESCENDING);
            }
         }
         _loc5_ = 0;
         while(_loc5_ < _loc7_.length)
         {
            _loc6_.push(_loc7_[_loc5_].idx);
            _loc5_++;
         }
         return _loc6_;
      }
      
      public function addToContainer() : void
      {
         var screen:StickerScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && !screen.container.contains(screen.clip))
            {
               screen.container.addChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
         if(screen.shouldUpdateStickerDisplay)
         {
            screen.updateStickerDisplay();
            screen.shouldUpdateStickerDisplay = false;
         }
         screen.adjustIcons(true);
         screen.isActive = true;
      }
      
      public function removeFromContainer() : void
      {
         var screen:StickerScreen = this;
         try
         {
            if(Boolean(screen.container) && Boolean(screen.clip) && screen.container.contains(screen.clip))
            {
               screen.container.removeChild(screen.clip);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error adding subscreen to container: " + err.message);
         }
         screen.isActive = false;
      }
      
      public function clickSortMode(param1:MouseEvent, param2:String = null) : void
      {
         var _loc3_:StickerScreen = this;
         _loc3_.gameObj.var_128.playSound("buttonclick.wav");
         if(param2 != null)
         {
            _loc3_.panelSortMode = param2;
         }
         else if(param1.currentTarget == _loc3_.clip.sort_abc)
         {
            _loc3_.panelSortMode = "abc";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_earned)
         {
            _loc3_.panelSortMode = "earned";
         }
         else if(param1.currentTarget == _loc3_.clip.sort_need)
         {
            _loc3_.panelSortMode = "need";
         }
         _loc3_.clip.sort_abc.gotoAndStop(2);
         _loc3_.clip.sort_earned.gotoAndStop(2);
         _loc3_.clip.sort_need.gotoAndStop(2);
         _loc3_.clip["sort_" + _loc3_.panelSortMode].gotoAndStop(1);
         _loc3_.populatePanels(true);
      }
      
      public function clickArrow(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         var _loc3_:String = String(param1.currentTarget.name);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc3_ == "up_btn")
         {
            _loc2_.panelScrollDir = -1;
         }
         else if(_loc3_ == "down_btn")
         {
            _loc2_.panelScrollDir = 1;
         }
         _loc2_.clip.panelholder.addEventListener(Event.ENTER_FRAME,_loc2_.holdArrow);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseArrow);
         _loc2_.isScrollingToHilite = false;
      }
      
      public function releaseArrow(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.panelScrollDir = 0;
         _loc2_.clip.panelholder.removeEventListener(Event.ENTER_FRAME,_loc2_.holdArrow);
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseArrow);
      }
      
      public function holdArrow(param1:Event) : void
      {
         var _loc2_:StickerScreen = this;
         var _loc3_:Number = _loc2_.panelScrollAreaStart;
         var _loc4_:Number = _loc3_ - (_loc2_.clip.panelholder.height - _loc2_.panelScrollAreaHeight);
         if(_loc2_.panelScrollDir == 1)
         {
            _loc2_.clip.panelholder.y -= 8;
         }
         else if(_loc2_.panelScrollDir == -1)
         {
            _loc2_.clip.panelholder.y += 8;
         }
         if(_loc2_.clip.panelholder.y < _loc4_)
         {
            _loc2_.clip.panelholder.y = _loc4_;
            _loc2_.panelScrollDir = 0;
         }
         else if(_loc2_.clip.panelholder.y > _loc3_)
         {
            _loc2_.clip.panelholder.y = _loc3_;
            _loc2_.panelScrollDir = 0;
         }
         var _loc5_:Number = Math.abs((_loc2_.clip.panelholder.y - _loc3_) / (_loc4_ - _loc3_));
         _loc2_.clip.drag_btn.y = _loc2_.panelScrollbarStart + _loc5_ * _loc2_.panelScrollbarRange;
      }
      
      public function rolloverDragger(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.clip.drag_btn.gotoAndStop(2);
      }
      
      public function rolloutDragger(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.clip.drag_btn.gotoAndStop(1);
      }
      
      public function clickDragger(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.drag_btn.startDrag(false,new Rectangle(_loc2_.clip.drag_btn.x,_loc2_.panelScrollbarStart,0,_loc2_.panelScrollbarRange));
         _loc2_.clip.drag_btn.addEventListener(Event.ENTER_FRAME,_loc2_.dragDragger);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseDragger);
         _loc2_.isScrollingToHilite = false;
      }
      
      public function dragDragger(param1:Event) : void
      {
         var _loc2_:StickerScreen = this;
         var _loc3_:Number = (_loc2_.clip.drag_btn.y - _loc2_.panelScrollbarStart) / _loc2_.panelScrollbarRange;
         _loc2_.clip.panelholder.y = Math.round(_loc2_.panelScrollAreaStart - (_loc2_.clip.panelholder.height - _loc2_.panelScrollAreaHeight) * _loc3_);
      }
      
      public function releaseDragger(param1:MouseEvent) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseDragger);
         _loc2_.clip.drag_btn.removeEventListener(Event.ENTER_FRAME,_loc2_.dragDragger);
         _loc2_.clip.drag_btn.stopDrag();
      }
      
      public function destroy() : void
      {
         var _loc1_:StickerScreen = this;
         class_6.method_1("(Destroy Sticker Menu)");
         _loc1_.gameObj.var_130.api.removeEventListener("earnedSticker",_loc1_.updateStickerDisplayListener);
         _loc1_.gameObj.var_130.api.removeEventListener("gaveCoupon",_loc1_.updateStickerDisplayListener);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.removePanels();
         _loc1_.panels = null;
         _loc1_.populateStickers(false);
         _loc1_.clip.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickArrow);
         _loc1_.clip.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickArrow);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickDragger);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverDragger);
         _loc1_.clip.drag_btn.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutDragger);
         _loc1_.clip.sort_abc.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortMode);
         _loc1_.clip.sort_earned.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortMode);
         _loc1_.clip.sort_need.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortMode);
         _loc1_.container.removeEventListener("clickContinue",_loc1_.clickContinue);
         if(_loc1_.clip)
         {
            if(_loc1_.clip.parent)
            {
               _loc1_.clip.parent.removeChild(_loc1_.clip);
            }
         }
         _loc1_.container = null;
         _loc1_.clip = null;
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc2_:StickerScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.fader.gotoAndPlay("quickfadeout");
         _loc2_.isClosing = true;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc2_:StickerScreen = this;
         if(_loc2_.isScrollingToHilite)
         {
            _loc2_.stickerEaseSpeed = 0;
            _loc3_ = _loc2_.hiliteStickerTarget - _loc2_.clip.holder.y;
            _loc2_.clip.holder.y += _loc3_ / 3;
            _loc4_ = _loc2_.hilitePanelTarget - _loc2_.clip.panelholder.y;
            _loc2_.clip.panelholder.y += _loc4_ / 3;
            _loc6_ = (_loc5_ = _loc2_.panelScrollAreaStart) - (_loc2_.clip.panelholder.height - _loc2_.panelScrollAreaHeight);
            _loc7_ = Math.abs((_loc2_.clip.panelholder.y - _loc5_) / (_loc6_ - _loc5_));
            _loc2_.clip.drag_btn.y = _loc2_.panelScrollbarStart + _loc7_ * _loc2_.panelScrollbarRange;
            if(Math.abs(_loc3_) <= 1 && Math.abs(_loc4_) <= 1)
            {
               _loc2_.clip.holder.y = _loc2_.hiliteStickerTarget;
               _loc2_.clip.panelholder.y = _loc2_.hilitePanelTarget;
               _loc2_.isScrollingToHilite = false;
            }
         }
         else if(_loc2_.isActive)
         {
            _loc8_ = _loc2_.clip.panelmask.y - _loc2_.clip.panelholder.y - _loc2_.panelStartY;
            _loc9_ = _loc2_.clip.panelmask.y + _loc2_.clip.panelmask.height - _loc2_.clip.panelholder.y - _loc2_.panelStartY;
            _loc10_ = Math.floor((_loc9_ - _loc2_.panelSpacingY + 2) / _loc2_.panelSpacingY);
            _loc11_ = Math.ceil(_loc8_ / _loc2_.panelSpacingY);
            if(_loc10_ != _loc2_.lastMaxPanel || _loc11_ != _loc2_.lastMinPanel)
            {
               _loc12_ = _loc11_;
               while(_loc12_ <= _loc10_)
               {
                  if(_loc12_ >= 0 && _loc12_ < _loc2_.panels.length && _loc2_.panels[_loc12_] != null && _loc2_.panels[_loc12_].isNew === true)
                  {
                     _loc2_.gameObj.var_127.setViewedBadge(_loc2_.panels[_loc12_].badgeIndex);
                     _loc2_.panels[_loc12_].isNew = false;
                     class_6.method_1("You have viewed " + _loc2_.panels[_loc12_].badgeIndex);
                  }
                  _loc12_++;
               }
            }
            _loc2_.lastMinPanel = _loc11_;
            _loc2_.lastMaxPanel = _loc10_;
         }
         if(_loc2_.stickerEaseSpeed != 0)
         {
            _loc2_.clip.holder.y += _loc2_.stickerEaseSpeed;
            _loc2_.stickerEaseSpeed *= 0.9;
            if(Math.abs(_loc2_.stickerEaseSpeed) <= 1)
            {
               _loc2_.stickerEaseSpeed = 0;
            }
            _loc13_ = _loc2_.stickerScrollAreaStart + _loc2_.stickerScrollAreaHeight - _loc2_.clip.holder.height;
            _loc14_ = _loc2_.stickerScrollAreaStart;
            if(_loc2_.clip.holder.y > _loc14_)
            {
               _loc2_.clip.holder.y = _loc14_;
               _loc2_.stickerEaseSpeed = 0;
            }
            else if(_loc2_.clip.holder.y < _loc13_)
            {
               _loc2_.clip.holder.y = _loc13_;
               _loc2_.stickerEaseSpeed = 0;
            }
         }
         else if(_loc2_.isDraggingStickers)
         {
            _loc2_.dragStickersLastY = _loc2_.clip.holder.y;
         }
         if(_loc2_.isClosing)
         {
            if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
            {
               _loc2_.gameObj.method_118();
               _loc2_.gameObj.method_229();
            }
         }
         else if(!_loc2_.didAdjustIcons)
         {
            _loc2_.adjustIcons();
            _loc2_.didAdjustIcons = true;
         }
      }
      
      public function adjustIcons(param1:Boolean = false) : void
      {
         var _loc2_:StickerScreen = this;
         if(_loc2_.anyNewQuests && !param1)
         {
            _loc2_.gameObj.var_130.api.setButtonIcon("all","(Stickers)","menuicon_newquest");
            _loc2_.gameObj.var_130.api.setButtonIcon("all","STICKERS","menuicon_newquest");
         }
         else
         {
            _loc2_.gameObj.var_130.api.setButtonIcon("all","(Stickers)","menuicon_badges");
            _loc2_.gameObj.var_130.api.setButtonIcon("all","STICKERS","menuicon_badges");
         }
      }
   }
}
