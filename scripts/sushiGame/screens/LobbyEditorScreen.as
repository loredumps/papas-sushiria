package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.media.SoundTransform;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.*;
   import sushiGame.managers.*;
   import sushiGame.models.FurnitureItem;
   
   public class LobbyEditorScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var wallGrid:Array;
      
      public var wallGridWidth:Number = 16;
      
      public var wallGridHeight:Number = 7;
      
      public var floorGrid:Array;
      
      public var floorGridWidth:Number = 16;
      
      public var floorGridHeight:Number = 3;
      
      public var furniItems:Vector.<FurnitureItem>;
      
      public var activeFurni:FurnitureItem = null;
      
      public var inventoryIsOpen:Boolean = false;
      
      public var isInvOpening:Boolean = false;
      
      public var isInvClosing:Boolean = false;
      
      public var invOpenSpeed:Number = 4;
      
      public var whichSet:Number = 1;
      
      public var panelsPerSet:Number = 12;
      
      public var workingArray:Array;
      
      public var shouldShowNext:Boolean = false;
      
      public var shouldShowPrev:Boolean = false;
      
      public var existingFurniIsSet:Boolean = false;
      
      public var mode:String = "furni";
      
      public var trainingClip:MovieClip;
      
      public var whichContextTraining:String = "none";
      
      public var backdropBitmap:Bitmap;
      
      public var shouldShowPutAway:Boolean = false;
      
      public var putAwayClosedX:Number = -91;
      
      public var putAwayOpenX:Number = 0;
      
      public var putAwayTweenSpeed:Number = 2;
      
      public var showTrimPopup:Boolean = false;
      
      public var showTopPopup:Boolean = false;
      
      public var colorBMP:BitmapData;
      
      public var selectedTrimX:Number = 0;
      
      public var selectedTrimY:Number = 0;
      
      public var selectedTopX:Number = 0;
      
      public var selectedTopY:Number = 0;
      
      public var barRange:Number = 103;
      
      public var pointbarStartX:Number = -8;
      
      public var freshbarStartX:Number = 333;
      
      public var miniFreshBarRange:Number = 76;
      
      public var miniFreshStartX:Number = -107;
      
      public var shouldShowFurniHUD:Boolean = false;
      
      public var hideFurniHUDTimer:Number = 0;
      
      public var hideFurniHUDTimerMax:Number = 15;
      
      public var whichHUDFurni:FurnitureItem = null;
      
      public var furniHUDTargetX:Number = -1000;
      
      public var furniHUDTargetY:Number = 0;
      
      public var matchStarStatic:Boolean = false;
      
      public var firstVisit:Boolean = false;
      
      public var removePanelExpanded:Boolean = false;
      
      public var kernFormat:TextFormat;
      
      public function LobbyEditorScreen(param1:class_5)
      {
         this.wallGrid = [];
         this.floorGrid = [];
         this.furniItems = new Vector.<FurnitureItem>();
         this.workingArray = [];
         super();
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.kernFormat = new TextFormat();
         _loc2_.kernFormat.kerning = true;
         if(_loc2_.gameObj.var_127.hasVisitedLobbyEditor == false)
         {
            _loc2_.gameObj.var_127.hasVisitedLobbyEditor = true;
            _loc2_.firstVisit = true;
         }
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         _loc1_.clip = new lobbyEditorMC();
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.createGrids();
         _loc1_.setupInventory();
         _loc1_.updateLobbyBitmap();
         _loc1_.clip.fader.mouseEnabled = false;
         _loc1_.clip.backtogame_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickBackToGame);
         _loc1_.clip.inventory_open_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickOpenInventory);
         _loc1_.clip.inventory_close_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickOpenInventory);
         _loc1_.clip.putaway_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPutAway);
         _loc1_.clip.help_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickHelp);
         _loc1_.clip.removepanel.removeall_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickRemoveAll);
         _loc1_.clip.removepanel.removefurni_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickRemoveAllFurni);
         _loc1_.clip.removepanel.removeposters_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickRemoveAllPosters);
         _loc1_.clip.removepanel.y = 436;
         _loc1_.shouldShowPutAway = false;
         _loc1_.clip.putaway_btn.x = _loc1_.putAwayClosedX;
         _loc1_.clip.putaway_tray.x = _loc1_.clip.putaway_btn.x;
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.addEventListener(MouseEvent.MOUSE_UP,_loc1_.clickScreen);
         _loc1_.clip.trim_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickTrimButton);
         _loc1_.clip.top_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickTopButton);
         _loc1_.clip.colorpanel.addEventListener(MouseEvent.CLICK,_loc1_.clickColorPanel);
         _loc1_.clip.colorpanel.buttonMode = true;
         _loc1_.clip.colorpanel.useHandCursor = true;
         _loc1_.clip.colorpanel.visible = false;
         _loc1_.colorBMP = new colorswatches(0,0);
         _loc1_.setupSelectedSwatches();
         _loc1_.clip.mute_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMute);
         _loc1_.clip.unmute_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickUnmute);
         _loc1_.clip.mute_music_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMuteMusic);
         _loc1_.clip.unmute_music_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickUnmuteMusic);
         _loc1_.updateMuteButton();
         _loc1_.clip.pointbar.mask = _loc1_.clip.pointmask;
         _loc1_.clip.freshbar.mask = _loc1_.clip.freshmask;
         _loc1_.clip.points_txt.text = "";
         _loc1_.clip.points_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.furnihud.mouseEnabled = false;
         _loc1_.clip.furnihud.mouseChildren = false;
         _loc1_.clip.furnihud.freshbar.bar.mask = _loc1_.clip.furnihud.freshbar.masker;
         _loc1_.clip.furnihud.alpha = 0;
         _loc1_.clip.matchstar.mouseEnabled = false;
         _loc1_.clip.matchstar.mouseChildren = false;
         _loc1_.clip.trainingtips.visible = false;
         _loc1_.clip.trainingtips.close_btn.addEventListener(MouseEvent.CLICK,_loc1_.hideTrainingTips);
         _loc1_.clip.trainingtips.next_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickTrainingNext);
         _loc1_.clip.trainingtips.prev_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickTrainingPrevious);
         _loc1_.gameObj.var_128.switchMusic("order");
         if(!_loc1_.gameObj.var_127.hasTrained("inventory"))
         {
            _loc1_.showContextTraining("inventory");
            _loc1_.gameObj.var_127.setTrained("inventory");
         }
         else if(!_loc1_.firstVisit && !_loc1_.gameObj.var_127.hasTrained("toptrim"))
         {
            _loc1_.showContextTraining("toptrim");
         }
         _loc1_.gameObj.var_128.addEventListener("musicIsMuted",_loc1_.onMusicIsMuted);
         _loc1_.gameObj.var_128.addEventListener("musicIsNotMuted",_loc1_.onMusicIsNotMuted);
      }
      
      public function onMusicIsMuted(param1:Event) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:SoundTransform = new SoundTransform(0);
         if(_loc2_.gameObj.var_128.track_jukebox)
         {
            _loc2_.gameObj.var_128.track_jukebox.soundTransform = _loc3_;
         }
         if(_loc2_.gameObj.var_128.track_boombox)
         {
            _loc2_.gameObj.var_128.track_boombox.soundTransform = _loc3_;
         }
         if(_loc2_.gameObj.var_128.track_phonograph)
         {
            _loc2_.gameObj.var_128.track_phonograph.soundTransform = _loc3_;
         }
      }
      
      public function onMusicIsNotMuted(param1:Event) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:SoundManager = _loc2_.gameObj.var_128;
         if(_loc3_.isFurniInLobby(_loc2_.gameObj.var_132.jukeboxTag))
         {
            if(_loc4_.track_jukebox)
            {
               _loc4_.track_jukebox.soundTransform = new SoundTransform(1);
            }
         }
         if(_loc3_.isFurniInLobby(_loc2_.gameObj.var_132.phonographTag))
         {
            if(_loc4_.track_phonograph)
            {
               _loc4_.track_phonograph.soundTransform = new SoundTransform(1);
            }
         }
         if(_loc3_.isFurniInLobby(_loc2_.gameObj.var_132.boomboxTag))
         {
            if(_loc4_.track_boombox)
            {
               _loc4_.track_boombox.soundTransform = new SoundTransform(1);
            }
         }
      }
      
      public function clickHelp(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_127.setTrained("lobbypoints");
         _loc2_.removeContextTraining();
         _loc2_.showTrainingTips();
      }
      
      public function clickBackToGame(param1:Event) : void
      {
         var _loc3_:SoundTransform = null;
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.hideTrainingTips();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         try
         {
            _loc3_ = new SoundTransform(0);
            _loc2_.gameObj.var_128.track_boombox.soundTransform = _loc3_;
            _loc2_.gameObj.var_128.track_jukebox.soundTransform = _loc3_;
            _loc2_.gameObj.var_128.track_phonograph.soundTransform = _loc3_;
         }
         catch(err:Error)
         {
         }
         _loc2_.checkForBadges();
         _loc2_.gameObj.var_127.saveData();
         _loc2_.gameObj.method_118();
         _loc2_.gameObj.method_277();
      }
      
      public function checkForBadges() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Number = Math.round(_loc2_.getLobbyPercent() * _loc2_.getLobbyMaxPoints());
         if(_loc3_ >= 750)
         {
            _loc1_.gameObj.var_136.recordTagged("lobbypoints");
         }
         var _loc4_:Array = _loc2_.getLobbyItemsPerTheme();
         class_6.info("Items in each theme: " + _loc4_.toString());
         var _loc5_:Boolean = true;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(_loc4_[_loc6_] < 10)
            {
               _loc5_ = false;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            _loc1_.gameObj.var_136.recordTagged("allmatching");
         }
      }
      
      public function setupInventory() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         _loc1_.clip.inventory.furni_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.poster_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.wallpaper_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.flooring_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.next_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickNext);
         _loc1_.clip.inventory.prev_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPrevious);
         _loc1_.clip.inventory.sortpanel.holiday_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortHoliday);
         _loc1_.clip.inventory.sortpanel.newest_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortNewest);
         if(_loc1_.gameObj.var_127.furniSorting == "newest")
         {
            _loc1_.clip.inventory.sortpanel.holiday_btn.visible = true;
            _loc1_.clip.inventory.sortpanel.holiday_selected.visible = false;
            _loc1_.clip.inventory.sortpanel.newest_btn.visible = false;
            _loc1_.clip.inventory.sortpanel.newest_selected.visible = true;
         }
         else
         {
            _loc1_.clip.inventory.sortpanel.holiday_btn.visible = false;
            _loc1_.clip.inventory.sortpanel.holiday_selected.visible = true;
            _loc1_.clip.inventory.sortpanel.newest_btn.visible = true;
            _loc1_.clip.inventory.sortpanel.newest_selected.visible = false;
         }
         var _loc2_:int = 1;
         while(_loc2_ <= _loc1_.panelsPerSet)
         {
            _loc1_.clip.inventory.panels["panel" + _loc2_].mouseEnabled = true;
            _loc1_.clip.inventory.panels["panel" + _loc2_].mouseChildren = false;
            _loc1_.clip.inventory.panels["panel" + _loc2_].buttonMode = true;
            _loc1_.clip.inventory.panels["panel" + _loc2_].useHandCursor = true;
            _loc1_.clip.inventory.panels["panel" + _loc2_].freshbar.bar.mask = _loc1_.clip.inventory.panels["panel" + _loc2_].freshbar.masker;
            _loc1_.clip.inventory.panels["panel" + _loc2_].addEventListener(MouseEvent.CLICK,_loc1_.grabFurniFromInventory);
            _loc1_.clip.inventory.panels["panel" + _loc2_].addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverInvPanel);
            _loc1_.clip.inventory.panels["panel" + _loc2_].addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutInvPanel);
            _loc2_++;
         }
         _loc1_.clip.inventory.next_btn.visible = false;
         _loc1_.clip.inventory.prev_btn.visible = false;
         _loc1_.clip.inventory.effect_txt.text = "";
         _loc1_.clip.inventory.effect_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.selectMode("furni");
         if(_loc1_.workingArray.length == 0)
         {
            _loc1_.selectMode("poster");
            if(_loc1_.workingArray.length == 0)
            {
               _loc1_.selectMode("wallpaper");
               if(_loc1_.workingArray.length == 1)
               {
                  _loc1_.selectMode("flooring");
                  if(_loc1_.workingArray.length == 1)
                  {
                     _loc1_.selectMode("furni");
                  }
               }
            }
         }
         _loc1_.populatePanels();
         _loc1_.clip.inventory.y = 480;
      }
      
      public function clickNext(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         ++_loc2_.whichSet;
         _loc2_.clip.inventory.panels.gotoAndPlay("nextset");
         _loc2_.clip.inventory.next_btn.visible = false;
         _loc2_.clip.inventory.prev_btn.visible = false;
      }
      
      public function clickPrevious(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         --_loc2_.whichSet;
         _loc2_.clip.inventory.panels.gotoAndPlay("prevset");
         _loc2_.clip.inventory.next_btn.visible = false;
         _loc2_.clip.inventory.prev_btn.visible = false;
      }
      
      public function clickSortNewest(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_127.furniSorting = "newest";
         _loc2_.refreshInventory();
         _loc2_.populatePanels();
         if(_loc2_.gameObj.var_127.furniSorting == "newest")
         {
            _loc2_.clip.inventory.sortpanel.holiday_btn.visible = true;
            _loc2_.clip.inventory.sortpanel.holiday_selected.visible = false;
            _loc2_.clip.inventory.sortpanel.newest_btn.visible = false;
            _loc2_.clip.inventory.sortpanel.newest_selected.visible = true;
         }
         else
         {
            _loc2_.clip.inventory.sortpanel.holiday_btn.visible = false;
            _loc2_.clip.inventory.sortpanel.holiday_selected.visible = true;
            _loc2_.clip.inventory.sortpanel.newest_btn.visible = true;
            _loc2_.clip.inventory.sortpanel.newest_selected.visible = false;
         }
      }
      
      public function clickSortHoliday(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_127.furniSorting = "holiday";
         _loc2_.refreshInventory();
         _loc2_.populatePanels();
         if(_loc2_.gameObj.var_127.furniSorting == "newest")
         {
            _loc2_.clip.inventory.sortpanel.holiday_btn.visible = true;
            _loc2_.clip.inventory.sortpanel.holiday_selected.visible = false;
            _loc2_.clip.inventory.sortpanel.newest_btn.visible = false;
            _loc2_.clip.inventory.sortpanel.newest_selected.visible = true;
         }
         else
         {
            _loc2_.clip.inventory.sortpanel.holiday_btn.visible = false;
            _loc2_.clip.inventory.sortpanel.holiday_selected.visible = true;
            _loc2_.clip.inventory.sortpanel.newest_btn.visible = true;
            _loc2_.clip.inventory.sortpanel.newest_selected.visible = false;
         }
      }
      
      public function rolloverInvPanel(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:FurniData = null;
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 1;
         while(_loc4_ <= _loc2_.panelsPerSet)
         {
            if(param1.currentTarget == _loc2_.clip.inventory.panels["panel" + _loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1)
         {
            _loc2_.clip.inventory.panels["panel" + _loc4_].hilite.visible = true;
            _loc5_ = _loc2_.panelsPerSet * (_loc2_.whichSet - 1);
            _loc6_ = _loc3_ - 1 + _loc5_;
            _loc7_ = String(_loc2_.workingArray[_loc6_]);
            _loc8_ = _loc2_.gameObj.var_132.getFurniFromTag(_loc7_);
            _loc2_.clip.inventory.effect_txt.text = _loc8_.effect + " Bonus";
            _loc2_.clip.inventory.effect_txt.setTextFormat(_loc2_.kernFormat);
         }
      }
      
      public function rolloutInvPanel(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 1;
         while(_loc4_ <= _loc2_.panelsPerSet)
         {
            if(param1.currentTarget == _loc2_.clip.inventory.panels["panel" + _loc4_])
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         if(_loc3_ > -1)
         {
            _loc2_.clip.inventory.panels["panel" + _loc4_].hilite.visible = false;
         }
         _loc2_.clip.inventory.effect_txt.text = "";
      }
      
      public function grabFurniFromInventory(param1:MouseEvent) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:FurniData = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.inventoryIsOpen || _loc2_.isInvOpening)
         {
            _loc3_ = -1;
            _loc4_ = 1;
            while(_loc4_ <= _loc2_.panelsPerSet)
            {
               if(param1.currentTarget == _loc2_.clip.inventory.panels["panel" + _loc4_])
               {
                  _loc3_ = _loc4_;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_ != -1)
            {
               _loc2_.gameObj.var_128.playSound("buttonclick.wav");
               _loc5_ = _loc2_.panelsPerSet * (_loc2_.whichSet - 1);
               _loc6_ = _loc3_ - 1 + _loc5_;
               _loc7_ = String(_loc2_.workingArray[_loc6_]);
               if((_loc8_ = _loc2_.gameObj.var_132.getFurniFromTag(_loc7_)).type == FurniData.TYPE_WALLPAPER || _loc8_.type == FurniData.TYPE_FLOORING)
               {
                  if(_loc8_.type == FurniData.TYPE_WALLPAPER)
                  {
                     _loc9_ = Number(_loc7_.split("wall")[1]);
                     _loc2_.gameObj.var_127.placeWallpaperInLobby(_loc7_,_loc9_);
                     _loc2_.gradeLayout(_loc8_);
                  }
                  else if(_loc8_.type == FurniData.TYPE_FLOORING)
                  {
                     _loc10_ = Number(_loc7_.split("floor")[1]);
                     _loc2_.gameObj.var_127.placeFlooringInLobby(_loc7_,_loc10_);
                     _loc2_.gradeLayout(_loc8_);
                  }
                  _loc2_.updateLobbyBitmap();
                  _loc2_.shouldShowPutAway = false;
                  _loc2_.closeInventory();
               }
               else
               {
                  _loc2_.addFurni(_loc8_,true);
                  _loc2_.shouldShowPutAway = true;
                  _loc2_.closeInventory();
                  if(_loc8_.type == FurniData.TYPE_POSTER && _loc2_.gameObj.var_127.hasTrained("poster") == false)
                  {
                     _loc2_.showContextTraining("poster");
                     _loc2_.gameObj.var_127.setTrained("poster");
                  }
                  else if(_loc8_.type == FurniData.TYPE_FURNI && _loc2_.gameObj.var_127.hasTrained("furni") == false)
                  {
                     _loc2_.showContextTraining("furni");
                     _loc2_.gameObj.var_127.setTrained("furni");
                  }
               }
            }
         }
      }
      
      public function refreshInventory() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         _loc1_.workingArray = _loc1_.gameObj.var_127.getFurniAvailable(_loc1_.mode);
         var _loc2_:Number = Math.ceil(_loc1_.workingArray.length / _loc1_.panelsPerSet);
         if(_loc2_ >= 1 && _loc1_.whichSet > _loc2_)
         {
            _loc1_.whichSet = _loc2_;
         }
      }
      
      public function createGrids() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc1_:LobbyEditorScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc4_ = 0;
         while(_loc4_ < _loc1_.wallGridHeight)
         {
            _loc5_ = [];
            _loc3_ = 0;
            while(_loc3_ < _loc1_.wallGridWidth)
            {
               _loc5_.push(0);
               _loc3_++;
            }
            _loc1_.wallGrid.push(_loc5_);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc1_.floorGridHeight)
         {
            _loc6_ = [];
            _loc3_ = 0;
            while(_loc3_ < _loc1_.floorGridWidth)
            {
               _loc6_.push(0);
               _loc3_++;
            }
            _loc1_.floorGrid.push(_loc6_);
            _loc4_++;
         }
      }
      
      public function createExistingFurni() : void
      {
         var _loc4_:FurniData = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:LobbyEditorScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.lobbyPlacement.length)
         {
            _loc4_ = _loc1_.gameObj.var_132.getFurniFromTag(_loc2_.lobbyPlacement[_loc3_][0]);
            _loc5_ = Number(_loc2_.lobbyPlacement[_loc3_][1]);
            _loc6_ = Number(_loc2_.lobbyPlacement[_loc3_][2]);
            _loc1_.addFurni(_loc4_,false,_loc5_,_loc6_);
            _loc7_ = _loc6_;
            while(_loc7_ < _loc6_ + _loc4_.depth)
            {
               _loc8_ = _loc5_;
               while(_loc8_ < _loc5_ + _loc4_.width)
               {
                  if(_loc4_.type == FurniData.TYPE_POSTER)
                  {
                     _loc1_.wallGrid[_loc7_][_loc8_] = 1;
                  }
                  else if(_loc4_.type == FurniData.TYPE_FURNI)
                  {
                     _loc1_.floorGrid[_loc7_][_loc8_] = 1;
                  }
                  _loc8_++;
               }
               _loc7_++;
            }
            _loc3_++;
         }
         _loc1_.existingFurniIsSet = true;
         _loc1_.gradeLayout();
      }
      
      public function isWallGridFree(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc5_:LobbyEditorScreen = this;
         var _loc6_:Boolean = true;
         _loc8_ = param2;
         loop0:
         while(_loc8_ < param2 + param4)
         {
            _loc7_ = param1;
            while(_loc7_ < param1 + param3)
            {
               if(_loc8_ < 0 || _loc8_ >= _loc5_.wallGrid.length || _loc7_ < 0 || _loc7_ >= _loc5_.wallGrid[0].length || _loc5_.wallGrid[_loc8_][_loc7_] != 0)
               {
                  _loc6_ = false;
                  break loop0;
               }
               _loc7_++;
            }
            _loc8_++;
         }
         return _loc6_;
      }
      
      public function isFloorGridFree(param1:Number, param2:Number, param3:Number, param4:Number = 1) : Boolean
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc5_:LobbyEditorScreen = this;
         var _loc6_:Boolean = true;
         _loc8_ = param2;
         loop0:
         while(_loc8_ < param2 + param4)
         {
            _loc7_ = param1;
            while(_loc7_ < param1 + param3)
            {
               if(_loc8_ < 0 || _loc8_ >= _loc5_.floorGrid.length || _loc7_ < 0 || _loc7_ >= _loc5_.floorGrid[0].length || _loc5_.floorGrid[_loc8_][_loc7_] != 0)
               {
                  _loc6_ = false;
                  break loop0;
               }
               _loc7_++;
            }
            _loc8_++;
         }
         return _loc6_;
      }
      
      public function placeFurni(param1:FurniData, param2:Number, param3:Number) : void
      {
         var _loc7_:int = 0;
         var _loc4_:LobbyEditorScreen;
         var _loc5_:UserData = (_loc4_ = this).gameObj.var_127;
         var _loc6_:int = param3;
         while(_loc6_ < param3 + param1.depth)
         {
            _loc7_ = param2;
            while(_loc7_ < param2 + param1.width)
            {
               if(param1.type == FurniData.TYPE_POSTER)
               {
                  _loc4_.wallGrid[_loc6_][_loc7_] = 1;
               }
               else if(param1.type == FurniData.TYPE_FURNI)
               {
                  _loc4_.floorGrid[_loc6_][_loc7_] = 1;
               }
               _loc7_++;
            }
            _loc6_++;
         }
         _loc5_.placeFurniInLobby(param1.tag,param2,param3);
         if(param1.type == FurniData.TYPE_FURNI)
         {
            _loc4_.adjustFloorLayering(param3);
         }
         if(Boolean(_loc4_.trainingClip) && (_loc4_.whichContextTraining == "poster" || _loc4_.whichContextTraining == "furni"))
         {
            _loc4_.removeContextTraining();
         }
         if(_loc4_.whichContextTraining == "none" && !_loc4_.firstVisit && !_loc5_.hasTrained("lobbypoints"))
         {
            _loc4_.showContextTraining("lobbypoints");
         }
         _loc4_.refreshInventory();
      }
      
      public function pickupFurni(param1:FurniData, param2:Number, param3:Number) : void
      {
         var _loc7_:int = 0;
         var _loc4_:LobbyEditorScreen;
         var _loc5_:UserData = (_loc4_ = this).gameObj.var_127;
         var _loc6_:int = param3;
         while(_loc6_ < param3 + param1.depth)
         {
            _loc7_ = param2;
            while(_loc7_ < param2 + param1.width)
            {
               if(param1.type == FurniData.TYPE_POSTER)
               {
                  _loc4_.wallGrid[_loc6_][_loc7_] = 0;
               }
               else if(param1.type == FurniData.TYPE_FURNI)
               {
                  _loc4_.floorGrid[_loc6_][_loc7_] = 0;
               }
               _loc7_++;
            }
            _loc6_++;
         }
         _loc5_.removeFurniFromLobby(param1.tag,param2,param3);
         _loc4_.refreshInventory();
      }
      
      public function adjustFloorLayering(param1:Number) : void
      {
      }
      
      public function putAwayFurni(param1:FurnitureItem) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:SoundManager = _loc2_.gameObj.var_128;
         var _loc4_:UserData = _loc2_.gameObj.var_127;
         if(param1.data.tag == _loc2_.gameObj.var_132.jukeboxTag && !_loc4_.isFurniInLobby(_loc2_.gameObj.var_132.jukeboxTag))
         {
            if(_loc3_.track_jukebox)
            {
               _loc3_.track_jukebox.soundTransform = new SoundTransform(0);
            }
         }
         else if(param1.data.tag == _loc2_.gameObj.var_132.phonographTag && !_loc4_.isFurniInLobby(_loc2_.gameObj.var_132.phonographTag))
         {
            if(_loc3_.track_phonograph)
            {
               _loc3_.track_phonograph.soundTransform = new SoundTransform(0);
            }
         }
         else if(param1.data.tag == _loc2_.gameObj.var_132.boomboxTag && !_loc4_.isFurniInLobby(_loc2_.gameObj.var_132.boomboxTag))
         {
            if(_loc3_.track_boombox)
            {
               _loc3_.track_boombox.soundTransform = new SoundTransform(0);
            }
         }
         if(_loc2_.activeFurni == param1)
         {
            _loc2_.activeFurni = null;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.furniItems.length)
         {
            if(_loc2_.furniItems[_loc5_] == param1)
            {
               _loc2_.furniItems[_loc5_].destroy();
               _loc2_.furniItems.splice(_loc5_,1);
               break;
            }
            _loc5_++;
         }
         if(Boolean(_loc2_.trainingClip) && (_loc2_.whichContextTraining == "poster" || _loc2_.whichContextTraining == "furni"))
         {
            _loc2_.removeContextTraining();
         }
         _loc2_.gradeLayout();
      }
      
      public function addFurni(param1:FurniData, param2:Boolean, param3:Number = 0, param4:Number = 0) : void
      {
         var _loc5_:LobbyEditorScreen;
         var _loc6_:SoundManager = (_loc5_ = this).gameObj.var_128;
         var _loc7_:MovieClip = _loc5_.clip.moving_layer;
         if(param2 == false && param1.type == FurniData.TYPE_POSTER)
         {
            _loc7_ = _loc5_.clip.wall_layer;
         }
         else if(param2 == false && param1.type == FurniData.TYPE_FURNI)
         {
            if(param4 == 0)
            {
               _loc7_ = _loc5_.clip.floor0_layer;
            }
            else if(param4 == 1)
            {
               _loc7_ = _loc5_.clip.floor1_layer;
            }
            else
            {
               _loc7_ = _loc5_.clip.floor2_layer;
            }
         }
         var _loc8_:FurnitureItem = new FurnitureItem(_loc5_.gameObj,_loc7_,param1,param3,param4,param2);
         _loc5_.furniItems.push(_loc8_);
         if(param2)
         {
            _loc5_.setActiveFurni(_loc8_);
         }
         if(param1.tag == _loc5_.gameObj.var_132.jukeboxTag)
         {
            if(Boolean(_loc6_.track_jukebox) && _loc6_.isMusicMute == false)
            {
               _loc6_.track_jukebox.soundTransform = new SoundTransform(1);
            }
         }
         else if(param1.tag == _loc5_.gameObj.var_132.phonographTag)
         {
            if(Boolean(_loc6_.track_phonograph) && _loc6_.isMusicMute == false)
            {
               _loc6_.track_phonograph.soundTransform = new SoundTransform(1);
            }
         }
         else if(param1.tag == _loc5_.gameObj.var_132.boomboxTag)
         {
            if(Boolean(_loc6_.track_boombox) && _loc6_.isMusicMute == false)
            {
               _loc6_.track_boombox.soundTransform = new SoundTransform(1);
            }
         }
      }
      
      public function setActiveFurni(param1:FurnitureItem) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.activeFurni != null)
         {
         }
         _loc2_.activeFurni = param1;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.existingFurniIsSet == false)
         {
            _loc2_.createExistingFurni();
         }
         var _loc3_:Number = _loc2_.putAwayClosedX;
         if(_loc2_.shouldShowPutAway)
         {
            _loc3_ = _loc2_.putAwayOpenX;
         }
         var _loc4_:Number;
         if((_loc4_ = _loc3_ - _loc2_.clip.putaway_btn.x) != 0)
         {
            _loc2_.clip.putaway_btn.x += _loc4_ / _loc2_.putAwayTweenSpeed;
            _loc2_.clip.putaway_tray.x = _loc2_.clip.putaway_btn.x;
            if(Math.abs(_loc4_) <= 1)
            {
               _loc2_.clip.putaway_btn.x = _loc3_;
               _loc2_.clip.putaway_tray.x = _loc2_.clip.putaway_btn.x;
            }
         }
         if(_loc2_.furniItems.length > 0 && _loc2_.activeFurni == null)
         {
            _loc7_ = 410;
            if(_loc2_.removePanelExpanded)
            {
               _loc7_ = 365;
            }
            if(_loc2_.clip.removepanel.y > _loc7_)
            {
               _loc2_.clip.removepanel.y += (_loc7_ - _loc2_.clip.removepanel.y) / 2;
               if(_loc2_.clip.removepanel.y < _loc7_)
               {
                  _loc2_.clip.removepanel.y = _loc7_;
               }
            }
            else if(_loc2_.clip.removepanel.y < _loc7_)
            {
               _loc2_.clip.removepanel.y += (_loc7_ - _loc2_.clip.removepanel.y) / 2;
               if(_loc2_.clip.removepanel.y > _loc7_)
               {
                  _loc2_.clip.removepanel.y = _loc7_;
               }
            }
         }
         else if(_loc2_.clip.removepanel.y < 436)
         {
            _loc2_.clip.removepanel.y += (436 - _loc2_.clip.removepanel.y) / 2;
            if(_loc2_.clip.removepanel.y >= 435)
            {
               _loc2_.clip.removepanel.y = 436;
               _loc2_.removePanelExpanded = false;
               _loc2_.clip.removepanel.removeall_btn.visible = true;
               _loc2_.clip.removepanel.removefurni_btn.visible = false;
               _loc2_.clip.removepanel.removeposters_btn.visible = false;
            }
         }
         _loc2_.clip.grid.visible = _loc2_.shouldShowPutAway;
         if(_loc2_.showTrimPopup)
         {
            _loc2_.clip.colorpanel.visible = true;
            _loc2_.clip.colorpanel.x = 252;
         }
         else if(_loc2_.showTopPopup)
         {
            _loc2_.clip.colorpanel.visible = true;
            _loc2_.clip.colorpanel.x = 84;
         }
         else
         {
            _loc2_.clip.colorpanel.visible = false;
         }
         if(_loc2_.shouldShowFurniHUD)
         {
            if(_loc2_.clip.furnihud.alpha < 1)
            {
               _loc2_.clip.furnihud.alpha += 0.25;
            }
         }
         else
         {
            ++_loc2_.hideFurniHUDTimer;
            if(_loc2_.hideFurniHUDTimer > _loc2_.hideFurniHUDTimerMax || _loc2_.clip.furnihud.alpha != 1)
            {
               if(_loc2_.clip.furnihud.alpha > 0)
               {
                  _loc2_.clip.furnihud.alpha -= 0.25;
               }
            }
         }
         var _loc5_:Number = _loc2_.furniHUDTargetX - _loc2_.clip.furnihud.x;
         var _loc6_:Number = _loc2_.furniHUDTargetY - _loc2_.clip.furnihud.y;
         _loc2_.clip.furnihud.x += _loc5_ / 2;
         _loc2_.clip.furnihud.y += _loc6_ / 2;
         if(Math.abs(_loc5_) <= 1 && Math.abs(_loc6_) <= 1)
         {
            _loc2_.clip.furnihud.x = _loc2_.furniHUDTargetX;
            _loc2_.clip.furnihud.y = _loc2_.furniHUDTargetY;
         }
         if(_loc2_.inventoryIsOpen)
         {
            if(_loc2_.clip.inventory.panels.currentFrame == 6 || _loc2_.clip.inventory.panels.currentFrame == 17)
            {
               _loc2_.clip.inventory.panels.stop();
               if(_loc2_.shouldShowNext)
               {
                  _loc2_.clip.inventory.next_btn.visible = true;
               }
               else
               {
                  _loc2_.clip.inventory.next_btn.visible = false;
               }
               if(_loc2_.shouldShowPrev)
               {
                  _loc2_.clip.inventory.prev_btn.visible = true;
               }
               else
               {
                  _loc2_.clip.inventory.prev_btn.visible = false;
               }
            }
            else
            {
               _loc2_.clip.inventory.next_btn.visible = false;
               _loc2_.clip.inventory.prev_btn.visible = false;
            }
            if(_loc2_.clip.inventory.panels.currentFrame == 11)
            {
               _loc2_.populatePanels();
               _loc2_.clip.inventory.panels.gotoAndPlay(1);
            }
            else if(_loc2_.clip.inventory.panels.currentFrame == 22)
            {
               _loc2_.populatePanels();
               _loc2_.clip.inventory.panels.gotoAndPlay(12);
            }
            _loc2_.clip.inventory_close_btn.visible = true;
            _loc2_.clip.inventory_open_btn.visible = false;
         }
         else if(_loc2_.isInvClosing)
         {
            _loc9_ = (_loc8_ = 480) - _loc2_.clip.inventory.y;
            _loc2_.clip.inventory.y += _loc9_ / _loc2_.invOpenSpeed;
            if(_loc9_ >= -1 && _loc9_ <= 1)
            {
               _loc2_.clip.inventory.y = _loc8_;
               _loc2_.isInvClosing = false;
            }
            _loc2_.clip.inventory_close_btn.visible = false;
            _loc2_.clip.inventory_open_btn.visible = true;
         }
         else if(_loc2_.isInvOpening)
         {
            _loc11_ = (_loc10_ = 0) - _loc2_.clip.inventory.y;
            _loc2_.clip.inventory.y += _loc11_ / _loc2_.invOpenSpeed;
            if(_loc11_ >= -1 && _loc11_ <= 1)
            {
               _loc2_.clip.inventory.y = _loc10_;
               _loc2_.isInvOpening = false;
               _loc2_.inventoryIsOpen = true;
            }
            _loc2_.clip.inventory_close_btn.visible = true;
            _loc2_.clip.inventory_open_btn.visible = false;
         }
         else
         {
            _loc2_.clip.inventory_close_btn.visible = false;
            _loc2_.clip.inventory_open_btn.visible = true;
         }
      }
      
      public function populatePanels() : void
      {
         var index:Number = NaN;
         var mypanel:MovieClip = null;
         var whichTag:String = null;
         var furniData:FurniData = null;
         var amt:Number = NaN;
         var freshness:Number = NaN;
         var screen:LobbyEditorScreen = this;
         var data:UserData = screen.gameObj.var_127;
         var gamedata:GameData = screen.gameObj.var_132;
         var offset:Number = screen.panelsPerSet * (screen.whichSet - 1);
         var i:int = 0;
         while(i < screen.panelsPerSet)
         {
            index = i + offset;
            mypanel = screen.clip.inventory.panels["panel" + (i + 1)];
            if(index < screen.workingArray.length)
            {
               whichTag = String(screen.workingArray[index]);
               furniData = gamedata.getFurniFromTag(whichTag);
               mypanel.visible = true;
               mypanel.title_txt.text = furniData.title;
               mypanel.title_txt.setTextFormat(screen.kernFormat);
               mypanel.theme.gotoAndStop(furniData.theme);
               amt = data.getFurniAmount(whichTag,false);
               mypanel.tally.amount_txt.text = String(amt);
               mypanel.tally.amount_txt.setTextFormat(screen.kernFormat);
               freshness = data.getFurniItemFreshness(furniData.tag);
               mypanel.freshbar.bar.x = screen.miniFreshStartX + screen.miniFreshBarRange * freshness;
               mypanel.points_txt.htmlText = "<B>" + furniData.getMaxPoints(data.getHolidayThemeThisMonth()) + " Pts</B>";
               mypanel.points_txt.setTextFormat(screen.kernFormat);
               if(data.getHolidayThemeThisMonth() == furniData.theme)
               {
                  mypanel.points_txt.textColor = 45056;
               }
               else
               {
                  mypanel.points_txt.textColor = 11943935;
               }
               if(amt > 1)
               {
                  mypanel.tally.visible = true;
               }
               else
               {
                  mypanel.tally.visible = false;
               }
               if(furniData.tag == "wall" + data.lobbyWallpaper || furniData.tag == "floor" + data.lobbyFlooring)
               {
                  mypanel.checkmark.visible = true;
                  mypanel.tally.visible = true;
                  mypanel.tally.amount_txt.text = "";
               }
               else
               {
                  mypanel.checkmark.visible = false;
               }
               try
               {
                  if(mypanel.thumb.numChildren > 0)
                  {
                     mypanel.thumb.removeChildAt(0);
                  }
               }
               catch(err:Error)
               {
                  class_6.error("Error removing thumb.");
               }
               mypanel.thumb.addChild(screen.createThumbnail(furniData));
               mypanel.hilite.visible = false;
            }
            else
            {
               mypanel.visible = false;
            }
            i++;
         }
         if(screen.workingArray.length > offset + screen.panelsPerSet)
         {
            screen.shouldShowNext = true;
         }
         else
         {
            screen.shouldShowNext = false;
         }
         if(screen.whichSet > 1)
         {
            screen.shouldShowPrev = true;
         }
         else
         {
            screen.shouldShowPrev = false;
         }
      }
      
      public function createThumbnail(param1:FurniData) : MovieClip
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
         73;
         60;
         if(param1.type == FurniData.TYPE_FLOORING)
         {
            _loc6_ = Number(String(param1.tag).split("floor")[1]);
            _loc3_ = new MovieClip();
            (_loc7_ = new flooring_chunk()).gotoAndStop(_loc6_);
            (_loc8_ = new flooring_chunk()).gotoAndStop(_loc6_);
            _loc8_.x = _loc7_.width;
            _loc3_.addChild(_loc7_);
            _loc3_.addChild(_loc8_);
            _loc3_.scaleX = 0.25;
            _loc3_.scaleY = 0.25;
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
            _loc3_.scaleX = 0.25;
            _loc3_.scaleY = 0.25;
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
            if(_loc15_.height > 60 || _loc15_.width > 73)
            {
               if(_loc15_.height >= _loc15_.width)
               {
                  _loc15_.height = 60;
                  _loc15_.width = _loc15_.height * _loc18_;
               }
               else
               {
                  _loc15_.width = 73;
                  _loc15_.height = _loc15_.width * _loc17_;
               }
            }
            _loc19_ = (73 - _loc15_.width) / 2;
            _loc20_ = (60 - _loc15_.height) / 2;
            _loc23_ = (_loc22_ = (_loc21_ = _loc15_.getBounds(_loc15_)).y + _loc21_.height) * (_loc15_.height / _loc16_);
            if(param1.type == FurniData.TYPE_FURNI)
            {
               _loc15_.x = _loc19_;
               _loc15_.y = 60 - _loc20_;
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
      
      public function clickTrimButton(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_127.setTrained("toptrim");
         if(_loc2_.whichContextTraining == "toptrim")
         {
            _loc2_.removeContextTraining();
         }
         _loc2_.hideTrainingTips();
         _loc2_.closeInventory();
         _loc2_.showTopPopup = false;
         _loc2_.showTrimPopup = !_loc2_.showTrimPopup;
         _loc2_.clip.colorpanel.selector.x = _loc2_.selectedTrimX;
         _loc2_.clip.colorpanel.selector.y = _loc2_.selectedTrimY;
      }
      
      public function clickTopButton(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_127.setTrained("toptrim");
         if(_loc2_.whichContextTraining == "toptrim")
         {
            _loc2_.removeContextTraining();
         }
         _loc2_.hideTrainingTips();
         _loc2_.closeInventory();
         _loc2_.showTrimPopup = false;
         _loc2_.showTopPopup = !_loc2_.showTopPopup;
         _loc2_.clip.colorpanel.selector.x = _loc2_.selectedTopX;
         _loc2_.clip.colorpanel.selector.y = _loc2_.selectedTopY;
      }
      
      public function clickColorPanel(param1:MouseEvent) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:int = 0;
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:Number = Number(_loc2_.clip.colorpanel.mouseX);
         var _loc4_:Number = Number(_loc2_.clip.colorpanel.mouseY);
         if(_loc3_ >= 0 && _loc4_ >= 0 && _loc3_ < _loc2_.colorBMP.width && _loc4_ < _loc2_.colorBMP.height)
         {
            _loc5_ = _loc2_.colorBMP.getPixel(_loc3_,_loc4_);
            class_6.info("Use X/Y: " + _loc3_ + ", " + _loc4_ + ". Color = " + _loc5_);
            if(_loc2_.showTrimPopup)
            {
               _loc2_.gameObj.var_127.lobbyTrim = _loc5_;
               _loc6_ = 0;
               while(_loc6_ < _loc2_.furniItems.length)
               {
                  _loc2_.furniItems[_loc6_].updateWindowTint();
                  _loc6_++;
               }
               _loc2_.selectedTrimX = Math.floor(_loc3_ / 16) * 16;
               _loc2_.selectedTrimY = Math.floor(_loc4_ / 16) * 16;
               _loc2_.clip.colorpanel.selector.x = _loc2_.selectedTrimX;
               _loc2_.clip.colorpanel.selector.y = _loc2_.selectedTrimY;
            }
            else if(_loc2_.showTopPopup)
            {
               _loc2_.gameObj.var_127.lobbyTop = _loc5_;
               _loc2_.selectedTopX = Math.floor(_loc3_ / 16) * 16;
               _loc2_.selectedTopY = Math.floor(_loc4_ / 16) * 16;
               _loc2_.clip.colorpanel.selector.x = _loc2_.selectedTopX;
               _loc2_.clip.colorpanel.selector.y = _loc2_.selectedTopY;
            }
            _loc2_.showTrimPopup = false;
            _loc2_.showTopPopup = false;
            _loc2_.updateLobbyBitmap();
         }
      }
      
      public function setupSelectedSwatches() : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc1_:LobbyEditorScreen = this;
         var _loc2_:int = 0;
         while(_loc2_ < Math.ceil(_loc1_.colorBMP.width / 16))
         {
            _loc3_ = 0;
            while(_loc3_ < Math.ceil(_loc1_.colorBMP.height / 16))
            {
               _loc4_ = _loc2_ * 16;
               _loc5_ = _loc3_ * 16;
               if(_loc4_ < _loc1_.colorBMP.width && _loc5_ < _loc1_.colorBMP.height)
               {
                  if(_loc1_.colorBMP.getPixel(_loc4_,_loc5_) == _loc1_.gameObj.var_127.lobbyTop)
                  {
                     _loc1_.selectedTopX = _loc4_;
                     _loc1_.selectedTopY = _loc5_;
                  }
                  else if(_loc1_.colorBMP.getPixel(_loc4_,_loc5_) == _loc1_.gameObj.var_127.lobbyTrim)
                  {
                     _loc1_.selectedTrimX = _loc4_;
                     _loc1_.selectedTrimY = _loc5_;
                  }
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      public function clickOpenInventory(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.hideTrainingTips();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.shouldShowPutAway = false;
         _loc2_.showTopPopup = false;
         _loc2_.showTrimPopup = false;
         _loc2_.hideFurniHUD(null,true);
         if(_loc2_.inventoryIsOpen || _loc2_.isInvOpening)
         {
            _loc2_.closeInventory();
         }
         else
         {
            if(_loc2_.activeFurni != null)
            {
               _loc2_.putAwayFurni(_loc2_.activeFurni);
            }
            _loc2_.openInventory();
         }
         _loc2_.removeContextTraining();
      }
      
      public function clickPutAway(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.playSound("set_empty_cup.wav");
         _loc2_.shouldShowPutAway = false;
         _loc2_.hideFurniHUD(null,true);
         if(_loc2_.activeFurni != null)
         {
            _loc2_.putAwayFurni(_loc2_.activeFurni);
         }
      }
      
      public function clickRemoveAll(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.activeFurni == null && _loc2_.furniItems.length > 0)
         {
            _loc2_.removePanelExpanded = true;
            _loc2_.clip.removepanel.removeall_btn.visible = false;
            _loc2_.clip.removepanel.removefurni_btn.visible = true;
            _loc2_.clip.removepanel.removeposters_btn.visible = true;
         }
         else
         {
            class_6.method_1("Hey, you have furni in your hand! Can\'t remove all right now!");
         }
      }
      
      public function clickRemoveAllFurni(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.activeFurni == null && _loc2_.furniItems.length > 0)
         {
            class_6.method_1("Remove all furni!");
            _loc3_ = int(_loc2_.furniItems.length - 1);
            while(_loc3_ >= 0)
            {
               if(_loc2_.furniItems[_loc3_].data.type == FurniData.TYPE_FURNI)
               {
                  _loc2_.pickupFurni(_loc2_.furniItems[_loc3_].data,_loc2_.furniItems[_loc3_].xtile,_loc2_.furniItems[_loc3_].ytile);
                  _loc2_.putAwayFurni(_loc2_.furniItems[_loc3_]);
               }
               _loc3_--;
            }
            _loc2_.shouldShowPutAway = false;
            _loc2_.hideFurniHUD(null,true);
            _loc2_.gameObj.var_128.playSound("set_empty_cup.wav");
         }
         else
         {
            class_6.method_1("Hey, you have furni in your hand! Can\'t remove all right now!");
         }
         _loc2_.removePanelExpanded = false;
         _loc2_.clip.removepanel.removeall_btn.visible = true;
         _loc2_.clip.removepanel.removefurni_btn.visible = false;
         _loc2_.clip.removepanel.removeposters_btn.visible = false;
      }
      
      public function clickRemoveAllPosters(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.activeFurni == null && _loc2_.furniItems.length > 0)
         {
            class_6.method_1("Remove all furni!");
            _loc3_ = int(_loc2_.furniItems.length - 1);
            while(_loc3_ >= 0)
            {
               if(_loc2_.furniItems[_loc3_].data.type == FurniData.TYPE_POSTER)
               {
                  _loc2_.pickupFurni(_loc2_.furniItems[_loc3_].data,_loc2_.furniItems[_loc3_].xtile,_loc2_.furniItems[_loc3_].ytile);
                  _loc2_.putAwayFurni(_loc2_.furniItems[_loc3_]);
               }
               _loc3_--;
            }
            _loc2_.shouldShowPutAway = false;
            _loc2_.hideFurniHUD(null,true);
            _loc2_.gameObj.var_128.playSound("set_empty_cup.wav");
         }
         else
         {
            class_6.method_1("Hey, you have furni in your hand! Can\'t remove all right now!");
         }
         _loc2_.removePanelExpanded = false;
         _loc2_.clip.removepanel.removeall_btn.visible = true;
         _loc2_.clip.removepanel.removefurni_btn.visible = false;
         _loc2_.clip.removepanel.removeposters_btn.visible = false;
      }
      
      public function openInventory() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         if(!_loc1_.inventoryIsOpen && !_loc1_.isInvOpening)
         {
            _loc1_.populatePanels();
            _loc1_.isInvClosing = false;
            _loc1_.isInvOpening = true;
            _loc1_.inventoryIsOpen = false;
         }
      }
      
      public function closeInventory() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         if(_loc1_.inventoryIsOpen || _loc1_.isInvOpening)
         {
            _loc1_.isInvClosing = true;
            _loc1_.isInvOpening = false;
            _loc1_.inventoryIsOpen = false;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         _loc1_.kernFormat = null;
         _loc1_.gameObj.var_128.removeEventListener("musicIsMuted",_loc1_.onMusicIsMuted);
         _loc1_.gameObj.var_128.removeEventListener("musicIsNotMuted",_loc1_.onMusicIsNotMuted);
         if(_loc1_.colorBMP)
         {
            _loc1_.colorBMP.dispose();
            _loc1_.colorBMP = null;
         }
         _loc1_.removeContextTraining();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.furniItems.length)
         {
            _loc1_.furniItems[_loc2_].destroy();
            _loc1_.furniItems[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.furniItems = null;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.backdrop_holder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.clip.trainingtips.close_btn.removeEventListener(MouseEvent.CLICK,_loc1_.hideTrainingTips);
         _loc1_.clip.trainingtips.next_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickTrainingNext);
         _loc1_.clip.trainingtips.prev_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickTrainingPrevious);
         _loc1_.clip.inventory.furni_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.poster_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.wallpaper_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.inventory.flooring_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickChangeMode);
         _loc1_.clip.trim_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickTrimButton);
         _loc1_.clip.top_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickTopButton);
         _loc1_.clip.colorpanel.removeEventListener(MouseEvent.CLICK,_loc1_.clickColorPanel);
         _loc1_.clip.inventory.next_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickNext);
         _loc1_.clip.inventory.prev_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickPrevious);
         _loc1_.clip.inventory.sortpanel.holiday_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortHoliday);
         _loc1_.clip.inventory.sortpanel.newest_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickSortNewest);
         var _loc3_:int = 1;
         while(_loc3_ <= _loc1_.panelsPerSet)
         {
            _loc1_.clip.inventory.panels["panel" + _loc3_].removeEventListener(MouseEvent.CLICK,_loc1_.grabFurniFromInventory);
            _loc1_.clip.inventory.panels["panel" + _loc3_].removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverInvPanel);
            _loc1_.clip.inventory.panels["panel" + _loc3_].removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutInvPanel);
            _loc3_++;
         }
         try
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         }
         catch(err:Error)
         {
         }
         _loc1_.clip.backtogame_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickBackToGame);
         _loc1_.clip.inventory_open_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickOpenInventory);
         _loc1_.clip.inventory_close_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickOpenInventory);
         _loc1_.clip.putaway_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickPutAway);
         _loc1_.clip.mute_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickMute);
         _loc1_.clip.unmute_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickUnmute);
         _loc1_.clip.mute_music_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickMuteMusic);
         _loc1_.clip.unmute_music_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickUnmuteMusic);
         _loc1_.clip.help_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickHelp);
         _loc1_.clip.removepanel.removeall_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickRemoveAll);
         _loc1_.clip.removepanel.removefurni_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickRemoveAllFurni);
         _loc1_.clip.removepanel.removeposters_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickRemoveAllPosters);
         _loc1_.clip.removeEventListener(MouseEvent.MOUSE_UP,_loc1_.clickScreen);
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function clickScreen(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.activeFurni != null && param1.target != _loc2_.clip.inventory_open_btn && param1.target != _loc2_.clip.inventory_close_btn && param1.target != _loc2_.clip.backtogame_btn)
         {
            _loc2_.activeFurni.clickFurni(param1);
         }
      }
      
      public function updateMuteButton() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         _loc1_.clip.mute_btn.visible = !_loc1_.gameObj.var_128.isMute;
         _loc1_.clip.unmute_btn.visible = _loc1_.gameObj.var_128.isMute;
         _loc1_.clip.mute_music_btn.visible = !_loc1_.gameObj.var_128.isMusicMute;
         _loc1_.clip.unmute_music_btn.visible = _loc1_.gameObj.var_128.isMusicMute;
      }
      
      public function clickMute(param1:MouseEvent = null) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.muteSound();
         _loc2_.updateMuteButton();
      }
      
      public function clickUnmute(param1:MouseEvent = null) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.unmuteSound();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.updateMuteButton();
      }
      
      public function clickMuteMusic(param1:MouseEvent = null) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.muteMusic();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.updateMuteButton();
      }
      
      public function clickUnmuteMusic(param1:MouseEvent = null) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.gameObj.var_128.unmuteMusic();
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.updateMuteButton();
      }
      
      public function showContextTraining(param1:String) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         if(!_loc2_.trainingClip)
         {
            _loc2_.trainingClip = new trainingMC();
            _loc2_.clip.addChild(_loc2_.trainingClip);
            _loc2_.trainingClip.mouseEnabled = false;
            _loc2_.trainingClip.mouseChildren = false;
         }
         _loc2_.whichContextTraining = param1;
         _loc2_.trainingClip.gotoAndStop(param1);
      }
      
      public function removeContextTraining() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         if(_loc1_.trainingClip)
         {
            _loc1_.clip.removeChild(_loc1_.trainingClip);
            _loc1_.trainingClip = null;
         }
         _loc1_.whichContextTraining = "none";
      }
      
      public function clickChangeMode(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         var _loc3_:Array = String(param1.currentTarget.name).split("_");
         var _loc4_:String = String(_loc3_[0]);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc2_.mode != _loc4_)
         {
            _loc2_.selectMode(_loc4_);
         }
      }
      
      public function selectMode(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:LobbyEditorScreen = this;
         _loc3_.mode = param1;
         _loc3_.clip.inventory.tabbg.gotoAndStop("inv_" + _loc3_.mode);
         _loc3_.refreshInventory();
         _loc3_.whichSet = 1;
         if(!param2)
         {
            _loc3_.clip.inventory.panels.gotoAndPlay("nextset");
            _loc3_.clip.inventory.next_btn.visible = false;
            _loc3_.clip.inventory.prev_btn.visible = false;
         }
         else
         {
            _loc3_.clip.inventory.panels.gotoAndPlay(1);
            _loc3_.clip.inventory.next_btn.visible = false;
            _loc3_.clip.inventory.prev_btn.visible = false;
         }
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:LobbyEditorScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new lobbyBackdropMC();
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
         _loc5_.holder.countertop.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTop);
         _loc1_.clip.trim_swatch.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTrim);
         _loc1_.clip.top_swatch.transform.colorTransform = _loc1_.createColorTransform(_loc2_.lobbyTop);
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(640,480,false,4294967295)).draw(_loc5_,null,null,null,new Rectangle(0,0,640,480));
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
      
      public function updateLobbyBitmap() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         if(_loc1_.backdropBitmap != null)
         {
            _loc1_.backdropBitmap.bitmapData.dispose();
            try
            {
               _loc1_.clip.backdrop_holder.removeChild(_loc1_.backdropBitmap);
            }
            catch(err:Error)
            {
            }
            _loc1_.backdropBitmap = null;
         }
         _loc1_.backdropBitmap = _loc1_.createLobbyBackdropBitmap();
         _loc1_.clip.backdrop_holder.addChild(_loc1_.backdropBitmap);
      }
      
      public function gradeLayout(param1:FurniData = null, param2:Number = -1, param3:Number = -1) : void
      {
         var _loc11_:Number = NaN;
         var _loc5_:UserData;
         var _loc4_:LobbyEditorScreen;
         var _loc6_:Number = (_loc5_ = (_loc4_ = this).gameObj.var_127).getLobbyMaxPoints();
         var _loc7_:Number = _loc5_.getLobbyMatchingPoints();
         var _loc8_:Number = _loc5_.getLobbyFreshness();
         var _loc9_:Number = _loc5_.getLobbyPercent();
         class_6.info("Matching: " + _loc7_ + ", Max: " + _loc6_ + ", Percent = " + _loc7_ / _loc6_);
         class_6.info("Freshness: " + _loc8_ * 100);
         class_6.info("Lobby Overall Percent: " + _loc9_);
         var _loc10_:Number = Math.round(_loc9_ * _loc6_);
         class_6.info("Actual Points Earned: " + _loc10_ + " out of " + _loc6_);
         _loc4_.clip.pointbar.x = _loc4_.pointbarStartX + _loc10_ / _loc6_ * _loc4_.barRange;
         _loc4_.clip.freshbar.x = _loc4_.freshbarStartX + _loc8_ * _loc4_.barRange;
         _loc4_.clip.points_txt.htmlText = String("<b>" + _loc10_ + "/" + _loc6_ + " Points</b>");
         if(param1 != null)
         {
            if((_loc11_ = _loc5_.getLobbyMatchingInTheme(param1.theme)) > 1)
            {
               _loc4_.clip.matchstar.theme.gotoAndStop(param1.theme);
               _loc4_.clip.matchstar.inside.num_txt.text = _loc11_;
               _loc4_.clip.matchstar.inside.num_txt.setTextFormat(_loc4_.kernFormat);
               _loc4_.clip.matchstar.gotoAndPlay("show");
               if(param2 == -1 && param3 == -1)
               {
                  _loc4_.clip.matchstar.x = _loc4_.clip.mouseX;
                  _loc4_.clip.matchstar.y = _loc4_.clip.mouseY;
               }
               else
               {
                  _loc4_.clip.matchstar.x = param2;
                  _loc4_.clip.matchstar.y = param3;
               }
               if(_loc4_.matchStarStatic)
               {
                  _loc4_.clip.matchstar.x = 46;
                  _loc4_.clip.matchstar.y = 146;
               }
               if(_loc4_.clip.matchstar.x < _loc4_.clip.matchstar.width / 2)
               {
                  _loc4_.clip.matchstar.x = _loc4_.clip.matchstar.width / 2;
               }
               if(_loc4_.clip.matchstar.y < _loc4_.clip.matchstar.height / 2)
               {
                  _loc4_.clip.matchstar.y = _loc4_.clip.matchstar.height / 2;
               }
            }
         }
      }
      
      public function showFurniHUD(param1:FurnitureItem) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         0;
         _loc2_.clip.furnihud.name_txt.text = param1.data.title;
         _loc2_.clip.furnihud.effect_txt.htmlText = "<B>" + param1.data.effect + " Bonus</B>";
         _loc2_.clip.furnihud.points_txt.htmlText = "<B>" + param1.data.getMaxPoints(_loc2_.gameObj.var_127.getHolidayThemeThisMonth()) + " Points</B>";
         _loc2_.clip.furnihud.theme.gotoAndStop(param1.data.theme);
         if(_loc2_.gameObj.var_127.getHolidayThemeThisMonth() == param1.data.theme)
         {
            _loc2_.clip.furnihud.points_txt.textColor = 45056;
         }
         else
         {
            _loc2_.clip.furnihud.points_txt.textColor = 11943935;
         }
         _loc2_.clip.furnihud.name_txt.setTextFormat(_loc2_.kernFormat);
         _loc2_.clip.furnihud.effect_txt.setTextFormat(_loc2_.kernFormat);
         _loc2_.clip.furnihud.points_txt.setTextFormat(_loc2_.kernFormat);
         var _loc4_:Number = _loc2_.gameObj.var_127.getFurniItemFreshness(param1.data.tag);
         _loc2_.clip.furnihud.freshbar.bar.x = _loc2_.miniFreshStartX + _loc2_.miniFreshBarRange * _loc4_;
         _loc2_.whichHUDFurni = param1;
         _loc2_.clip.furnihud.visible = true;
         var _loc5_:Number = param1.clip.x + param1.data.width * param1.tileWidth / 2 - _loc2_.clip.furnihud.width / 2;
         var _loc6_:Number = param1.clip.y - Math.min(250,param1.clip.height) - _loc2_.clip.furnihud.height - 0;
         if(param1.data.type == FurniData.TYPE_POSTER)
         {
            _loc6_ = param1.clip.y + param1.clip.height + 0;
         }
         if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         _loc2_.furniHUDTargetX = _loc5_;
         _loc2_.furniHUDTargetY = _loc6_;
         _loc2_.shouldShowFurniHUD = true;
         _loc2_.hideFurniHUDTimer = 0;
      }
      
      public function hideFurniHUD(param1:FurnitureItem = null, param2:Boolean = false) : void
      {
         var _loc3_:LobbyEditorScreen = this;
         if(_loc3_.whichHUDFurni == param1 || param2)
         {
            _loc3_.whichHUDFurni = null;
            _loc3_.shouldShowFurniHUD = false;
            _loc3_.hideFurniHUDTimer = 0;
            if(param2)
            {
               _loc3_.hideFurniHUDTimer = _loc3_.hideFurniHUDTimerMax;
            }
         }
      }
      
      public function showTrainingTips() : void
      {
         var _loc1_:LobbyEditorScreen = this;
         _loc1_.clip.trainingtips.visible = true;
         _loc1_.clip.trainingtips.gotoAndStop(1);
      }
      
      public function hideTrainingTips(param1:MouseEvent = null) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         _loc2_.clip.trainingtips.visible = false;
         if(param1 != null)
         {
            param1.stopImmediatePropagation();
         }
      }
      
      public function clickTrainingNext(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.clip.trainingtips.currentFrame == _loc2_.clip.trainingtips.totalFrames)
         {
            _loc2_.clip.trainingtips.gotoAndStop(1);
         }
         else
         {
            _loc2_.clip.trainingtips.nextFrame();
         }
      }
      
      public function clickTrainingPrevious(param1:MouseEvent) : void
      {
         var _loc2_:LobbyEditorScreen = this;
         if(_loc2_.clip.trainingtips.currentFrame == 0)
         {
            _loc2_.clip.trainingtips.gotoAndStop(_loc2_.clip.trainingtips.totalFrames);
         }
         else
         {
            _loc2_.clip.trainingtips.prevFrame();
         }
      }
   }
}
