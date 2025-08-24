package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import package_2.class_6;
   import package_4.class_5;
   
   public class HelpScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip = null;
      
      public var params:Object = null;
      
      public var inMenu:Boolean = false;
      
      public var clip:MovieClip;
      
      public var isClosing:Boolean = false;
      
      public var kernFormat:TextFormat = null;
      
      public var helpLabels:Array;
      
      private var helpIndex:Number = -1;
      
      private var helpScrollStart:Number = 30;
      
      private var helpScrollRange:Number = 253;
      
      private var helpTabScrollDir:Number = 0;
      
      private var helpMainScrollDir:Number = 0;
      
      public function HelpScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         this.helpLabels = ["Taking Orders","Order Tickets","Cook Station","Build Station","Tea Station","Finishing","Ranking","Customers","Closers & Food Critic","Rewards","Server & Dining Room","Earning Specials","Serving Specials","Holiday Seasons","Seasonal Toppings","Holiday Furniture","Holiday Clothing","Buy Upgrades","Buy Furniture","Buy Clothing","Customer Coupons","Worker Clothing","Decorate Lobby","Lobby Scoring","Mini-Games","Pay Day","Stickers","Parade","Saving"];
         super();
         var _loc4_:HelpScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.params = param3;
         if(param3 != null)
         {
            class_6.method_1("Help Screen in Menu");
            if(param3.hasOwnProperty("inMenu"))
            {
               _loc4_.inMenu = param3.inMenu;
            }
         }
         _loc4_.setupScreen();
      }
      
      public function addToContainer() : void
      {
         var screen:HelpScreen = this;
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
      }
      
      public function removeFromContainer() : void
      {
         var screen:HelpScreen = this;
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
      }
      
      public function setupScreen() : void
      {
         var _loc2_:int = 0;
         var _loc1_:HelpScreen = this;
         _loc1_.clip = new helpScreenMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.kernFormat = new TextFormat();
         _loc1_.kernFormat.kerning = true;
         if(_loc1_.inMenu)
         {
            _loc1_.clip.fader.stop();
            _loc1_.clip.fader.visible = false;
         }
         else
         {
            _loc1_.gameObj.var_128.switchMusic("order");
         }
         _loc2_ = 1;
         while(_loc2_ <= _loc1_.helpLabels.length)
         {
            _loc1_.clip.tabholder["tab" + _loc2_].addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTab);
            _loc1_.clip.tabholder["tab" + _loc2_].addEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverHelpTab);
            _loc1_.clip.tabholder["tab" + _loc2_].addEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutHelpTab);
            _loc1_.clip.tabholder["tab" + _loc2_].mouseEnabled = true;
            _loc1_.clip.tabholder["tab" + _loc2_].mouseChildren = false;
            _loc1_.clip.tabholder["tab" + _loc2_].buttonMode = true;
            _loc1_.clip.tabholder["tab" + _loc2_].useHandCursor = true;
            _loc1_.clip.tabholder["tab" + _loc2_].name_txt.htmlText = "<b>" + _loc1_.helpLabels[_loc2_ - 1] + "</b>";
            _loc1_.clip.tabholder["tab" + _loc2_].name_txt.setTextFormat(_loc1_.kernFormat);
            _loc1_.clip.tabholder["tab" + _loc2_].hilite.visible = false;
            _loc1_.clip.tabholder["tab" + _loc2_].roll.visible = false;
            _loc1_.clip.tabholder["tab" + _loc2_].arrow.visible = false;
            _loc1_.clip.tabholder["tab" + _loc2_].bg.gotoAndStop(_loc2_ % 2 + 1);
            _loc2_++;
         }
         _loc1_.clip.tabholder.mask = _loc1_.clip.tabmasker;
         _loc1_.clip.side_scrollpanel.scroll_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTabDragger);
         _loc1_.clip.side_scrollpanel.scroll_btn.y = _loc1_.helpScrollStart;
         _loc1_.clip.side_scrollpanel.scroll_btn.mouseEnabled = true;
         _loc1_.clip.side_scrollpanel.up_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTabArrow);
         _loc1_.clip.side_scrollpanel.down_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTabArrow);
         _loc1_.clip.mainpanel.mask = _loc1_.clip.mainmasker;
         _loc1_.clip.main_scrollpanel.scroll_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpMainDragger);
         _loc1_.clip.main_scrollpanel.scroll_btn.y = _loc1_.helpScrollStart;
         _loc1_.clip.main_scrollpanel.scroll_btn.mouseEnabled = true;
         _loc1_.clip.main_scrollpanel.up_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpMainArrow);
         _loc1_.clip.main_scrollpanel.down_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpMainArrow);
         _loc1_.showHelp(1);
         if(_loc1_.params != null && _loc1_.params.hasOwnProperty("useSection") && _loc1_.params.useSection == "help")
         {
            _loc1_.showHelp(15);
            _loc1_.clip.tabholder.y = _loc1_.clip.tabmasker.y - (_loc1_.clip.tabholder.height - _loc1_.clip.tabmasker.height);
            _loc1_.holdHelpTabArrow(null);
         }
      }
      
      public function clickHelpTabDragger(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.side_scrollpanel.scroll_btn.startDrag(false,new Rectangle(0,30,0,_loc2_.helpScrollRange));
         _loc2_.clip.side_scrollpanel.scroll_btn.addEventListener(Event.ENTER_FRAME,_loc2_.dragHelpTabDragger);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpTabDragger);
      }
      
      public function releaseHelpTabDragger(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpTabDragger);
         _loc2_.clip.side_scrollpanel.scroll_btn.removeEventListener(Event.ENTER_FRAME,_loc2_.dragHelpTabDragger);
         _loc2_.clip.side_scrollpanel.scroll_btn.stopDrag();
      }
      
      public function dragHelpTabDragger(param1:Event) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = (_loc2_.clip.side_scrollpanel.scroll_btn.y - _loc2_.helpScrollStart) / _loc2_.helpScrollRange;
         _loc2_.clip.tabholder.y = Math.round(_loc2_.clip.tabmasker.y - (_loc2_.clip.tabholder.height - _loc2_.clip.tabmasker.height) * _loc3_);
      }
      
      public function clickHelpTabArrow(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:String = String(param1.currentTarget.name);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc3_ == "up_btn")
         {
            _loc2_.helpTabScrollDir = -1;
         }
         else if(_loc3_ == "down_btn")
         {
            _loc2_.helpTabScrollDir = 1;
         }
         _loc2_.clip.tabholder.addEventListener(Event.ENTER_FRAME,_loc2_.holdHelpTabArrow);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpTabArrow);
      }
      
      public function releaseHelpTabArrow(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         _loc2_.helpTabScrollDir = 0;
         _loc2_.clip.tabholder.removeEventListener(Event.ENTER_FRAME,_loc2_.holdHelpTabArrow);
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpTabArrow);
      }
      
      public function holdHelpTabArrow(param1:Event) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = Number(_loc2_.clip.tabmasker.y);
         var _loc4_:Number = _loc2_.clip.tabmasker.y - (_loc2_.clip.tabholder.height - _loc2_.clip.tabmasker.height);
         if(_loc2_.helpTabScrollDir == 1)
         {
            _loc2_.clip.tabholder.y -= 8;
         }
         else if(_loc2_.helpTabScrollDir == -1)
         {
            _loc2_.clip.tabholder.y += 8;
         }
         if(_loc2_.clip.tabholder.y < _loc4_)
         {
            _loc2_.clip.tabholder.y = _loc4_;
            _loc2_.helpTabScrollDir = 0;
         }
         else if(_loc2_.clip.tabholder.y > _loc3_)
         {
            _loc2_.clip.tabholder.y = _loc3_;
            _loc2_.helpTabScrollDir = 0;
         }
         var _loc5_:Number = Math.abs((_loc2_.clip.tabholder.y - _loc3_) / (_loc4_ - _loc3_));
         _loc2_.clip.side_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart + _loc5_ * _loc2_.helpScrollRange;
      }
      
      public function clickHelpMainDragger(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.main_scrollpanel.scroll_btn.startDrag(false,new Rectangle(0,30,0,_loc2_.helpScrollRange));
         _loc2_.clip.main_scrollpanel.scroll_btn.addEventListener(Event.ENTER_FRAME,_loc2_.dragHelpMainDragger);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpMainDragger);
      }
      
      public function releaseHelpMainDragger(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpMainDragger);
         _loc2_.clip.main_scrollpanel.scroll_btn.removeEventListener(Event.ENTER_FRAME,_loc2_.dragHelpMainDragger);
         _loc2_.clip.main_scrollpanel.scroll_btn.stopDrag();
      }
      
      public function dragHelpMainDragger(param1:Event) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = (_loc2_.clip.main_scrollpanel.scroll_btn.y - _loc2_.helpScrollStart) / _loc2_.helpScrollRange;
         _loc2_.clip.mainpanel.y = Math.round(_loc2_.clip.mainmasker.y - (_loc2_.clip.mainpanel.height - _loc2_.clip.mainmasker.height) * _loc3_);
      }
      
      public function clickHelpMainArrow(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:String = String(param1.currentTarget.name);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(_loc3_ == "up_btn")
         {
            _loc2_.helpMainScrollDir = -1;
         }
         else if(_loc3_ == "down_btn")
         {
            _loc2_.helpMainScrollDir = 1;
         }
         _loc2_.clip.mainpanel.addEventListener(Event.ENTER_FRAME,_loc2_.holdHelpMainArrow);
         _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpMainArrow);
      }
      
      public function releaseHelpMainArrow(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         _loc2_.helpTabScrollDir = 0;
         _loc2_.clip.mainpanel.removeEventListener(Event.ENTER_FRAME,_loc2_.holdHelpMainArrow);
         _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP,_loc2_.releaseHelpMainArrow);
      }
      
      public function holdHelpMainArrow(param1:Event) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = Number(_loc2_.clip.mainmasker.y);
         var _loc4_:Number = _loc2_.clip.mainmasker.y - (_loc2_.clip.mainpanel.height - _loc2_.clip.mainmasker.height);
         if(_loc2_.helpMainScrollDir == 1)
         {
            _loc2_.clip.mainpanel.y -= 8;
         }
         else if(_loc2_.helpMainScrollDir == -1)
         {
            _loc2_.clip.mainpanel.y += 8;
         }
         if(_loc2_.clip.mainpanel.y < _loc4_)
         {
            _loc2_.clip.mainpanel.y = _loc4_;
            _loc2_.helpMainScrollDir = 0;
         }
         else if(_loc2_.clip.mainpanel.y > _loc3_)
         {
            _loc2_.clip.mainpanel.y = _loc3_;
            _loc2_.helpMainScrollDir = 0;
         }
         var _loc5_:Number = Math.abs((_loc2_.clip.mainpanel.y - _loc3_) / (_loc4_ - _loc3_));
         _loc2_.clip.main_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart + _loc5_ * _loc2_.helpScrollRange;
      }
      
      public function clickHelpTab(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         MovieClip(param1.currentTarget).roll.visible = false;
         _loc2_.showHelp(_loc3_);
      }
      
      public function rolloverHelpTab(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
         if(_loc2_.helpIndex != _loc3_)
         {
            MovieClip(param1.currentTarget).roll.visible = true;
         }
      }
      
      public function rolloutHelpTab(param1:MouseEvent) : void
      {
         var _loc2_:HelpScreen = this;
         var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
         if(_loc2_.helpIndex != _loc3_)
         {
            MovieClip(param1.currentTarget).roll.visible = false;
         }
      }
      
      public function showHelp(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc2_:HelpScreen = this;
         _loc2_.helpIndex = param1;
         _loc3_ = 1;
         while(_loc3_ <= _loc2_.helpLabels.length)
         {
            try
            {
               if(_loc3_ == param1)
               {
                  _loc2_.clip.tabholder["tab" + _loc3_].hilite.visible = true;
                  _loc2_.clip.tabholder["tab" + _loc3_].arrow.visible = true;
               }
               else
               {
                  _loc2_.clip.tabholder["tab" + _loc3_].hilite.visible = false;
                  _loc2_.clip.tabholder["tab" + _loc3_].arrow.visible = false;
               }
            }
            catch(err:Error)
            {
            }
            _loc3_++;
         }
         _loc2_.clip.mainpanel.gotoAndStop(_loc2_.helpIndex);
         _loc2_.clip.mainpanel.y = _loc2_.clip.mainmasker.y;
         _loc2_.clip.main_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart;
      }
      
      public function destroy() : void
      {
         var _loc1_:HelpScreen = this;
         class_6.method_1("(Destroy Help Menu)");
         _loc1_.kernFormat = null;
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         var _loc2_:int = 1;
         while(_loc2_ <= _loc1_.helpLabels.length)
         {
            _loc1_.clip.tabholder["tab" + _loc2_].removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTab);
            _loc1_.clip.tabholder["tab" + _loc2_].removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverHelpTab);
            _loc1_.clip.tabholder["tab" + _loc2_].removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutHelpTab);
            _loc2_++;
         }
         _loc1_.clip.side_scrollpanel.scroll_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTabDragger);
         _loc1_.clip.side_scrollpanel.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTabArrow);
         _loc1_.clip.side_scrollpanel.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpTabArrow);
         _loc1_.clip.main_scrollpanel.scroll_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpMainDragger);
         _loc1_.clip.main_scrollpanel.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpMainArrow);
         _loc1_.clip.main_scrollpanel.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickHelpMainArrow);
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
         var _loc2_:HelpScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.fader.gotoAndPlay("quickfadeout");
         _loc2_.isClosing = true;
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc2_:HelpScreen = this;
         if(_loc2_.isClosing)
         {
            if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
            {
               _loc2_.gameObj.method_118();
               _loc2_.gameObj.method_246();
            }
         }
      }
   }
}
