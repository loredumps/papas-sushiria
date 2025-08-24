package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_2.class_6;
   import package_3.class_17;
   import package_4.class_5;
   import sushiGame.data.GameData;
   import sushiGame.data.UserData;
   
   public class MainMenuScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var container:MovieClip;
      
      private var params:Object;
      
      private var confirmYesButton:class_17;
      
      private var confirmNoButton:class_17;
      
      public var currentSection:String = "";
      
      public var backdropBitmap:Bitmap;
      
      public var stickers:StickerScreen;
      
      public var cookbook:CookbookScreen;
      
      public var customers:CustomerScreen;
      
      public var credits:CreditsScreen;
      
      public var help:HelpScreen;
      
      public var editor:CharacterEditorScreen;
      
      public var didSetupOutroButton:Boolean = false;
      
      public var outroButton:SimpleButton = null;
      
      public function MainMenuScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         this.gameObj = param1;
         this.container = param2;
         this.params = param3;
         this.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:MainMenuScreen = this;
         _loc1_.clip = new mainmenuMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.container.addEventListener("clickInfo",_loc1_.clickInfo);
         _loc1_.container.addEventListener("clickCustomers",_loc1_.clickCustomers);
         _loc1_.container.addEventListener("clickMedals",_loc1_.clickMedals);
         _loc1_.container.addEventListener("clickCookbook",_loc1_.clickCookbook);
         _loc1_.container.addEventListener("clickCredits",_loc1_.clickCredits);
         _loc1_.container.addEventListener("clickHelp",_loc1_.clickHelp);
         _loc1_.container.addEventListener("clickBackToGame",_loc1_.clickBackToGame);
         _loc1_.container.addEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.addEventListener("clickBackToSplash",_loc1_.clickBackToSplash);
         _loc1_.container.addEventListener("clickContinueSpecial",_loc1_.clickContinueSpecial);
         _loc1_.setupInfo();
         _loc1_.setupCustomers();
         _loc1_.setupMedals();
         _loc1_.setupCookbook();
         _loc1_.setupHelp();
         _loc1_.setupCredits();
         _loc1_.setupConfirmQuit();
         _loc1_.clip.outro_btn.visible = false;
         if(Boolean(_loc1_.params) && _loc1_.params.hasOwnProperty("useSection"))
         {
            _loc1_.setSection(_loc1_.params.useSection);
         }
         else
         {
            _loc1_.setSection("info");
            _loc1_.gameObj.var_128.switchMusic("none");
            _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.delayOutroButton);
         }
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.adjustMenuIcons);
      }
      
      public function clickInfo(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("info");
      }
      
      public function clickCustomers(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("customers");
      }
      
      public function clickMedals(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("medals");
      }
      
      public function clickHelp(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("help");
      }
      
      public function clickCredits(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("credits");
      }
      
      public function clickCookbook(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("cookbook");
      }
      
      public function clickBackToGame(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.closeMainMenuScreen();
      }
      
      public function clickBackToSplash(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.closeMainMenuScreen(true);
      }
      
      public function clickContinueSpecial(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.method_118();
         _loc2_.closeMainMenuScreen();
      }
      
      public function clickQuit(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.clip.confirmquit.visible = true;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.disableButtons();
      }
      
      public function clickConfirmQuit(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.clip.confirmquit.visible = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.closeMainMenuScreen(true);
      }
      
      public function clickCancelQuit(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.clip.confirmquit.visible = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_130.api.enableButtons();
      }
      
      public function setSection(param1:String) : void
      {
         var _loc2_:MainMenuScreen = this;
         if(param1 != _loc2_.currentSection)
         {
            _loc2_.currentSection = param1;
            if(_loc2_.currentSection == "info")
            {
               _loc2_.editor.addToContainer();
            }
            else
            {
               _loc2_.editor.removeFromContainer();
            }
            if(_loc2_.currentSection == "customers")
            {
               _loc2_.customers.addToContainer();
            }
            else
            {
               _loc2_.customers.removeFromContainer();
            }
            if(_loc2_.currentSection == "credits")
            {
               _loc2_.credits.addToContainer();
            }
            else
            {
               _loc2_.credits.removeFromContainer();
            }
            if(_loc2_.currentSection == "help")
            {
               _loc2_.help.addToContainer();
            }
            else
            {
               _loc2_.help.removeFromContainer();
            }
            if(_loc2_.currentSection == "medals")
            {
               _loc2_.stickers.addToContainer();
            }
            else
            {
               _loc2_.stickers.removeFromContainer();
            }
            if(_loc2_.currentSection == "cookbook")
            {
               _loc2_.cookbook.addToContainer();
            }
            else
            {
               _loc2_.cookbook.removeFromContainer();
            }
            _loc2_.gameObj.var_130.api.method_133(_loc2_.getSectionTitle());
            _loc2_.clip.fader.gotoAndPlay("fadein");
            if(param1 == "badges")
            {
               if(!_loc2_.gameObj.var_127.hasVisitedBadgesScreen)
               {
                  _loc2_.gameObj.var_127.hasVisitedBadgesScreen = true;
               }
            }
         }
      }
      
      public function setupInfo(param1:Boolean = true) : void
      {
         var _loc5_:Object = null;
         var _loc2_:MainMenuScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:GameData = _loc2_.gameObj.var_132;
         if(param1)
         {
            (_loc5_ = {}).inMenu = true;
            _loc2_.editor = new CharacterEditorScreen(_loc2_.gameObj,_loc2_.clip.holder,_loc5_);
         }
         else
         {
            _loc2_.editor.destroy();
            _loc2_.editor = null;
         }
      }
      
      public function setupCookbook(param1:Boolean = true) : void
      {
         var _loc3_:Object = null;
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            _loc3_ = {};
            _loc3_.inMenu = true;
            _loc2_.cookbook = new CookbookScreen(_loc2_.gameObj,_loc2_.clip.holder,_loc3_);
         }
         else
         {
            _loc2_.cookbook.destroy();
            _loc2_.cookbook = null;
         }
      }
      
      public function setupCustomers(param1:Boolean = true) : void
      {
         var _loc3_:Object = null;
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            _loc3_ = {};
            _loc3_.inMenu = true;
            _loc2_.customers = new CustomerScreen(_loc2_.gameObj,_loc2_.clip.holder,_loc3_);
         }
         else
         {
            _loc2_.customers.destroy();
            _loc2_.customers = null;
         }
      }
      
      public function setupHelp(param1:Boolean = true) : void
      {
         var _loc4_:Object = null;
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            (_loc4_ = {}).inMenu = true;
            _loc2_.help = new HelpScreen(_loc2_.gameObj,_loc2_.clip.holder,_loc4_);
         }
         else
         {
            _loc2_.help.destroy();
            _loc2_.help = null;
         }
      }
      
      public function setupCredits(param1:Boolean = true) : void
      {
         var _loc3_:Object = null;
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            _loc3_ = {};
            _loc3_.inMenu = true;
            _loc2_.credits = new CreditsScreen(_loc2_.gameObj,_loc2_.clip.holder,_loc3_);
         }
         else
         {
            _loc2_.credits.destroy();
            _loc2_.credits = null;
         }
      }
      
      public function setupConfirmQuit(param1:Boolean = true) : void
      {
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            _loc2_.confirmYesButton = new class_17(null,"YES","small","button","clickYesQuit",null,false,false,false,null,false,80);
            _loc2_.confirmYesButton.x = 203;
            _loc2_.confirmYesButton.y = 230;
            _loc2_.confirmNoButton = new class_17(null,"NO","small","button","clickNoQuit",null,false,false,false,null,false,80);
            _loc2_.confirmNoButton.x = 356;
            _loc2_.confirmNoButton.y = _loc2_.confirmYesButton.y;
            _loc2_.clip.confirmquit.addChild(_loc2_.confirmYesButton);
            _loc2_.clip.confirmquit.addChild(_loc2_.confirmNoButton);
            _loc2_.confirmYesButton.addEventListener("clickYesQuit",_loc2_.clickConfirmQuit);
            _loc2_.confirmNoButton.addEventListener("clickNoQuit",_loc2_.clickCancelQuit);
            _loc2_.clip.confirmquit.visible = false;
         }
         else
         {
            _loc2_.clip.confirmquit.removeChild(_loc2_.confirmYesButton);
            _loc2_.clip.confirmquit.removeChild(_loc2_.confirmNoButton);
            _loc2_.confirmYesButton.removeEventListener("clickYesQuit",_loc2_.clickConfirmQuit);
            _loc2_.confirmNoButton.removeEventListener("clickNoQuit",_loc2_.clickCancelQuit);
            _loc2_.confirmYesButton.destroy();
            _loc2_.confirmNoButton.destroy();
            _loc2_.confirmYesButton = null;
            _loc2_.confirmNoButton = null;
         }
      }
      
      public function closeMainMenuScreen(param1:Boolean = false) : void
      {
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            _loc2_.gameObj.method_136();
            _loc2_.gameObj.method_145();
         }
         else
         {
            try
            {
               if(_loc2_.gameObj.var_145.isActive)
               {
                  _loc2_.gameObj.var_128.switchMusic("order");
                  _loc2_.gameObj.var_145.playFurniMusic();
               }
               else if(_loc2_.gameObj.var_186.isActive)
               {
                  _loc2_.gameObj.var_128.switchMusic("order");
               }
               else if(_loc2_.gameObj.var_195.isActive)
               {
                  _loc2_.gameObj.var_128.switchMusic("order");
               }
               else if(_loc2_.gameObj.var_135.isActive)
               {
                  _loc2_.gameObj.var_128.switchMusic("bake");
               }
               else if(_loc2_.gameObj.var_129.isActive)
               {
                  _loc2_.gameObj.var_128.switchMusic("build");
               }
               else if(_loc2_.gameObj.var_137.isActive)
               {
                  _loc2_.gameObj.var_128.switchMusic("other");
               }
            }
            catch(err:Error)
            {
            }
            _loc2_.gameObj.method_152(true);
         }
      }
      
      public function getSectionTitle() : String
      {
         var _loc1_:MainMenuScreen = this;
         if(_loc1_.currentSection == "info")
         {
            return "INFO";
         }
         if(_loc1_.currentSection == "credits")
         {
            return "CREDITS";
         }
         if(_loc1_.currentSection == "help")
         {
            return "HELP";
         }
         if(_loc1_.currentSection == "customers")
         {
            return "CUSTOMERS";
         }
         if(_loc1_.currentSection == "medals")
         {
            return "STICKERS";
         }
         return _loc1_.currentSection.toUpperCase();
      }
      
      public function destroy() : void
      {
         var _loc1_:MainMenuScreen = this;
         _loc1_.setupOutroButton(false);
         _loc1_.container.removeEventListener("clickInfo",_loc1_.clickInfo);
         _loc1_.container.removeEventListener("clickCustomers",_loc1_.clickCustomers);
         _loc1_.container.removeEventListener("clickMedals",_loc1_.clickMedals);
         _loc1_.container.removeEventListener("clickCookbook",_loc1_.clickCookbook);
         _loc1_.container.removeEventListener("clickCredits",_loc1_.clickCredits);
         _loc1_.container.removeEventListener("clickHelp",_loc1_.clickHelp);
         _loc1_.container.removeEventListener("clickBackToGame",_loc1_.clickBackToGame);
         _loc1_.container.removeEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.removeEventListener("clickBackToSplash",_loc1_.clickBackToSplash);
         _loc1_.container.removeEventListener("clickContinueSpecial",_loc1_.clickContinueSpecial);
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.adjustMenuIcons);
         _loc1_.setupInfo(false);
         _loc1_.setupCustomers(false);
         _loc1_.setupMedals(false);
         _loc1_.setupCookbook(false);
         _loc1_.setupHelp(false);
         _loc1_.setupCredits(false);
         _loc1_.setupConfirmQuit(false);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function setupMedals(param1:Boolean = true) : void
      {
         var _loc3_:Object = null;
         var _loc2_:MainMenuScreen = this;
         if(param1)
         {
            _loc3_ = {};
            _loc3_.inMenu = true;
            _loc2_.stickers = new StickerScreen(_loc2_.gameObj,_loc2_.clip.holder,_loc3_);
         }
         else
         {
            _loc2_.stickers.destroy();
            _loc2_.stickers = null;
         }
      }
      
      public function adjustMenuIcons(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc3_.hasNewSpecials())
         {
            class_6.method_1("SHOW NEW FOR COOKBOOK");
            _loc2_.gameObj.var_130.api.setButtonIcon("all","COOKBOOK","menuicon_new");
         }
         _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.adjustMenuIcons);
      }
      
      public function clickRewatchOutro(param1:MouseEvent = null) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.gameObj.method_148(true);
      }
      
      public function delayOutroButton(param1:Event) : void
      {
         var _loc2_:MainMenuScreen = this;
         _loc2_.setupOutroButton(true);
         _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.delayOutroButton);
      }
      
      public function setupOutroButton(param1:Boolean = true) : void
      {
         var firstDay:Number = NaN;
         var init:Boolean = param1;
         var screen:MainMenuScreen = this;
         if(!screen.didSetupOutroButton || init == false)
         {
            try
            {
               if(init)
               {
                  class_6.method_1("Setup outro button");
                  screen.outroButton = screen.clip.outro_btn;
                  screen.outroButton.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickRewatchOutro);
                  screen.gameObj.var_130.api.method_203(screen.outroButton,"MainMenu");
                  firstDay = screen.gameObj.var_127.getCustomerFirstDay(screen.gameObj.var_131.getCustomerIndex("Papa Louie"));
                  if(firstDay > 0 && firstDay <= screen.gameObj.var_127.getDay())
                  {
                     screen.outroButton.visible = true;
                  }
                  else
                  {
                     screen.outroButton.visible = false;
                  }
               }
               else
               {
                  class_6.method_1("Cleanup outro button");
                  screen.clip.removeEventListener(Event.ENTER_FRAME,screen.delayOutroButton);
                  if(screen.outroButton)
                  {
                     screen.outroButton.removeEventListener(MouseEvent.MOUSE_DOWN,screen.clickRewatchOutro);
                     if(screen.outroButton.parent)
                     {
                        screen.outroButton.parent.removeChild(screen.outroButton);
                     }
                  }
                  screen.outroButton = null;
               }
            }
            catch(err:Error)
            {
               class_6.error("Error setting up Outro button: " + err.message);
            }
         }
         screen.didSetupOutroButton = true;
      }
   }
}
