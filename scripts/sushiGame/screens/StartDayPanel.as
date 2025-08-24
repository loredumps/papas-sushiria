package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_2.class_15;
   import package_2.class_3;
   import package_2.class_6;
   import package_3.class_4;
   import package_4.class_5;
   import sushiGame.data.CustomerData;
   import sushiGame.data.UserData;
   
   public class StartDayPanel
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip;
      
      public var clip:MovieClip;
      
      public var var_201:Boolean = false;
      
      public var var_264:Boolean = false;
      
      public var var_383:Number = 10;
      
      public var var_281:Number = 21;
      
      public var action:String = "continue";
      
      public var var_315:Boolean = true;
      
      public var trainingClip:MovieClip;
      
      public var var_199:String = "none";
      
      public var editor:CharacterEditorScreen;
      
      public var cookbook:CookbookScreen;
      
      public var customers:CustomerScreen;
      
      public var stickers:StickerScreen;
      
      public var credits:CreditsScreen;
      
      public var help:HelpScreen;
      
      public var currentSection:String = "none";
      
      public var didSetupOutroButton:Boolean = false;
      
      public var outroButton:SimpleButton = null;
      
      public var var_262:String = "Papa Louie";
      
      public var var_325:Boolean = false;
      
      private var var_140:MovieClip = null;
      
      private var var_198:Array;
      
      private var var_344:Array;
      
      public function StartDayPanel(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         this.var_198 = [MiniGame.TYPE_PUTT,MiniGame.TYPE_MESS,MiniGame.TYPE_HOMERUN,MiniGame.TYPE_CHILI,MiniGame.TYPE_GOKART,MiniGame.TYPE_HALLWAY,MiniGame.TYPE_SHOT];
         this.var_344 = ["Freeze-Putt","Mitch\'s Mess","Home Run Derby","Rico\'s Chiliworks","Papa\'s Raceway","Hallway Hunt","Soda Shot"];
         super();
         var _loc4_:StartDayPanel;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         if(param3 != null && param3.hasOwnProperty("showAd"))
         {
            _loc4_.var_201 = param3.showAd;
         }
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         trace("Setup Start Day Panel");
         var _loc1_:StartDayPanel = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new startDayPanelMC();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.container.addEventListener("clickShop",_loc1_.clickShop);
         _loc1_.container.addEventListener("clickEditLobby",_loc1_.clickEditLobby);
         _loc1_.container.addEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.container.addEventListener("clickParade",_loc1_.clickParade);
         _loc1_.container.addEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.addEventListener("clickCookbook",_loc1_.clickCookbook);
         _loc1_.container.addEventListener("clickCustomers",_loc1_.clickCustomers);
         _loc1_.container.addEventListener("clickCredits",_loc1_.clickCredits);
         _loc1_.container.addEventListener("clickHelp",_loc1_.clickHelp);
         _loc1_.container.addEventListener("clickStickers",_loc1_.clickStickers);
         _loc1_.container.addEventListener("clickInfo",_loc1_.clickInfo);
         _loc1_.gameObj.var_130.api.addEventListener("clickCookbook",_loc1_.clickCookbook);
         if(_loc2_.furniInventory.length <= 2)
         {
            _loc1_.var_315 = false;
         }
         _loc1_.clip.play();
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,this.updateScreen);
         _loc1_.editor = new CharacterEditorScreen(_loc1_.gameObj,_loc1_.clip.backdrop_holder);
         _loc1_.cookbook = new CookbookScreen(_loc1_.gameObj,_loc1_.clip.backdrop_holder);
         _loc1_.customers = new CustomerScreen(_loc1_.gameObj,_loc1_.clip.backdrop_holder);
         _loc1_.help = new HelpScreen(_loc1_.gameObj,_loc1_.clip.backdrop_holder);
         _loc1_.credits = new CreditsScreen(_loc1_.gameObj,_loc1_.clip.backdrop_holder);
         _loc1_.stickers = new StickerScreen(_loc1_.gameObj,_loc1_.clip.backdrop_holder);
         _loc1_.setSection("info");
         _loc1_.clip.outro_btn.visible = false;
      }
      
      public function method_192(param1:Boolean = true) : void
      {
         var _loc2_:StartDayPanel = this;
         if(param1)
         {
            return;
         }
         if(_loc2_.var_140)
         {
            _loc2_.var_140.removeEventListener(MouseEvent.CLICK,_loc2_.method_146);
            _loc2_.var_140.panel0.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            _loc2_.var_140.panel1.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            _loc2_.var_140.panel2.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            _loc2_.var_140.panel3.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            _loc2_.var_140.panel4.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            _loc2_.var_140.panel5.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            _loc2_.var_140.panel6.removeEventListener(MouseEvent.MOUSE_DOWN,_loc2_.method_123);
            if(_loc2_.var_140.parent)
            {
               _loc2_.var_140.parent.removeChild(_loc2_.var_140);
            }
            _loc2_.var_140 = null;
         }
      }
      
      public function method_146(param1:MouseEvent, param2:Boolean = false) : void
      {
         var _loc3_:StartDayPanel = this;
         if(_loc3_.var_140.panel0.visible === true || param2)
         {
            _loc3_.var_140.panel0.visible = false;
            _loc3_.var_140.panel1.visible = false;
            _loc3_.var_140.panel2.visible = false;
            _loc3_.var_140.panel3.visible = false;
            _loc3_.var_140.panel4.visible = false;
            _loc3_.var_140.panel5.visible = false;
            _loc3_.var_140.panel6.visible = false;
            _loc3_.var_140.paneltop.visible = false;
            _loc3_.var_140.panelbottom.visible = false;
         }
         else
         {
            _loc3_.var_140.panel0.visible = true;
            _loc3_.var_140.panel1.visible = true;
            _loc3_.var_140.panel2.visible = true;
            _loc3_.var_140.panel3.visible = true;
            _loc3_.var_140.panel4.visible = true;
            _loc3_.var_140.panel5.visible = true;
            _loc3_.var_140.panel6.visible = true;
            _loc3_.var_140.paneltop.visible = true;
            _loc3_.var_140.panelbottom.visible = true;
         }
      }
      
      public function method_123(param1:MouseEvent) : void
      {
         var _loc2_:StartDayPanel = this;
         if(_loc2_.var_140)
         {
            if(param1.currentTarget == _loc2_.var_140.panel0)
            {
               _loc2_.var_199 = _loc2_.var_198[0];
            }
            else if(param1.currentTarget == _loc2_.var_140.panel1)
            {
               _loc2_.var_199 = _loc2_.var_198[1];
            }
            else if(param1.currentTarget == _loc2_.var_140.panel2)
            {
               _loc2_.var_199 = _loc2_.var_198[2];
            }
            else if(param1.currentTarget == _loc2_.var_140.panel3)
            {
               _loc2_.var_199 = _loc2_.var_198[3];
            }
            else if(param1.currentTarget == _loc2_.var_140.panel4)
            {
               _loc2_.var_199 = _loc2_.var_198[4];
            }
            else if(param1.currentTarget == _loc2_.var_140.panel5)
            {
               _loc2_.var_199 = _loc2_.var_198[5];
            }
            else if(param1.currentTarget == _loc2_.var_140.panel6)
            {
               _loc2_.var_199 = _loc2_.var_198[6];
            }
            _loc2_.method_146(null,true);
            _loc2_.var_140.mouseEnabled = false;
            _loc2_.var_140.mouseChildren = false;
            _loc2_.var_140.visible = false;
            _loc2_.action = "minigame";
            _loc2_.startClosingScreen();
            _loc2_.var_201 = false;
         }
      }
      
      public function adjustMenuIcons() : void
      {
         var _loc1_:StartDayPanel = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         if(_loc1_.var_325 == false)
         {
            if(_loc1_.method_230() > _loc2_.seenFloatsInParade)
            {
               class_6.method_1("SHOW NEW FOR PARADE");
               _loc1_.gameObj.var_130.api.setButtonIcon("all","View Parade","menuicon_new");
            }
            if(_loc2_.hasNewFurni)
            {
               class_6.method_1("SHOW NEW FOR DECORATE");
               _loc1_.gameObj.var_130.api.setButtonIcon("all","Decorate Lobby","menuicon_new");
            }
            _loc1_.var_325 = true;
         }
      }
      
      public function method_230() : Number
      {
         var _loc1_:StartDayPanel = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:CustomerData = _loc1_.gameObj.var_131;
         var _loc4_:Number = 0;
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Marty")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Rita")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Mitch")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Maggie")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Penny")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Alberto")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Cooper")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Prudence")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Chuck")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Mandi")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Taylor")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Peggy")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("James")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Willow")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Carlo Romano")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Gino Romano")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Bruna Romano")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Little Edoardo")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Roy")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Doan")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Utah")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Tony")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Scooter")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Scarlett")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Rudy")) > 0)
         {
            _loc4_++;
         }
         if(_loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Timm")) > 0 || _loc2_.getCustomerTotalOrders(_loc3_.getCustomerIndex("Cecilia")) > 0)
         {
            _loc4_++;
         }
         class_6.method_1("Floats in parade: " + _loc4_);
         return _loc4_;
      }
      
      public function setSection(param1:String) : void
      {
         var _loc2_:StartDayPanel = this;
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
         }
      }
      
      public function getSectionTitle() : String
      {
         var _loc1_:StartDayPanel = this;
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
         if(_loc1_.currentSection == "medals" || _loc1_.currentSection == "stickers")
         {
            return "STICKERS";
         }
         return _loc1_.currentSection.toUpperCase();
      }
      
      public function startClosingScreen() : void
      {
         var _loc1_:StartDayPanel = this;
         _loc1_.clip.gotoAndPlay("hide");
         _loc1_.clip.fader.gotoAndPlay("quickfadeout");
         _loc1_.gameObj.var_128.playSound("trayslide.wav");
         _loc1_.gameObj.var_130.api.disableButtons();
         _loc1_.gameObj.var_130.api.method_126("StartDayPanel");
         if(_loc1_.var_140)
         {
            _loc1_.var_140.visible = false;
         }
      }
      
      public function clickContinue(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.action = "continue";
         _loc2_.startClosingScreen();
         _loc2_.gameObj.var_128.switchMusic("none");
         _loc2_.gameObj.var_130.method_117("start",String(_loc2_.gameObj.var_127.currentDay));
      }
      
      public function clickQuit(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.action = "quit";
         _loc2_.startClosingScreen();
         _loc2_.var_201 = false;
      }
      
      public function clickShop(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.action = "shop";
         _loc2_.startClosingScreen();
         _loc2_.var_201 = false;
      }
      
      public function clickParade(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.action = "parade";
         _loc2_.startClosingScreen();
         _loc2_.var_201 = false;
      }
      
      public function clickEditLobby(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.action = "lobbyeditor";
         _loc2_.startClosingScreen();
         _loc2_.var_201 = false;
         _loc2_.gameObj.var_127.setTrained("decorate");
         _loc2_.gameObj.var_127.hasNewFurni = false;
         if(_loc2_.trainingClip)
         {
            _loc2_.gameObj.removeChild(_loc2_.trainingClip);
            _loc2_.trainingClip = null;
         }
      }
      
      public function clickCookbook(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("cookbook");
      }
      
      public function clickCustomers(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("customers");
      }
      
      public function clickCredits(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("credits");
      }
      
      public function clickHelp(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("help");
      }
      
      public function clickStickers(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("medals");
      }
      
      public function clickInfo(param1:Event) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.setSection("info");
      }
      
      public function method_245(param1:Event = null, param2:Boolean = false) : void
      {
         var _loc3_:StartDayPanel = this;
         class_6.method_1("Ad Finished");
         _loc3_.clip.gotoAndPlay(_loc3_.var_281 + 1);
      }
      
      public function updateScreen(param1:Event) : void
      {
         var _loc4_:Array = null;
         var _loc2_:StartDayPanel = this;
         var _loc3_:class_15 = _loc2_.gameObj.var_130.api.var_153;
         if(!_loc2_.didSetupOutroButton)
         {
            _loc2_.setupOutroButton();
            _loc2_.method_192();
         }
         _loc2_.adjustMenuIcons();
         if(_loc2_.clip.currentFrame == _loc2_.var_383 - 1)
         {
            _loc4_ = ["Continue ►","Visit Shop","View Parade","(Customers)","(Credits)","(Help)","(Info)","(Stickers)","(Cookbook)"];
            if(_loc2_.var_315)
            {
               _loc4_.push("Decorate Lobby");
            }
            _loc2_.gameObj.var_130.api.enableButtons("StartDayPanel",_loc4_);
            class_6.method_1("ENABLE BUTTONS");
         }
         else if(_loc2_.clip.currentFrame == _loc2_.var_281)
         {
            if(_loc2_.var_201 && !_loc2_.var_264 && !class_3.method_42())
            {
               _loc2_.var_264 = true;
               class_4.method_61(_loc2_.gameObj,_loc2_.method_245);
            }
            else if(!_loc2_.var_264)
            {
               _loc2_.clip.gotoAndPlay(_loc2_.var_281 + 1);
            }
         }
         else if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.clip.removeEventListener(Event.ENTER_FRAME,this.updateScreen);
            _loc2_.gameObj.var_128.restoreSoundAfterAd();
            if(_loc2_.action == "continue")
            {
               _loc2_.gameObj.var_133.setupLineup();
               if(_loc2_.gameObj.var_133.showNewCustomer && _loc2_.gameObj.var_133.showNewCustomerNum == _loc2_.gameObj.var_131.getCustomerIndex(_loc2_.var_262))
               {
                  class_6.method_1("Show that Outro Screen!");
                  _loc2_.gameObj.method_148();
               }
               else
               {
                  _loc2_.gameObj.method_134();
               }
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "shop")
            {
               _loc2_.gameObj.method_220();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "lobbyeditor")
            {
               _loc2_.gameObj.method_236();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "minigame")
            {
               _loc2_.gameObj.method_174(_loc2_.var_199);
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "cookbook")
            {
               _loc2_.gameObj.method_226();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "customers")
            {
               _loc2_.gameObj.method_294();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "credits")
            {
               _loc2_.gameObj.method_296();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "help")
            {
               _loc2_.gameObj.method_242();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "stickers")
            {
               _loc2_.gameObj.method_219();
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "parade")
            {
               _loc2_.gameObj.method_177(true);
               _loc2_.gameObj.method_116();
            }
            else if(_loc2_.action == "quit")
            {
               _loc2_.gameObj.quitToTitle();
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:StartDayPanel = this;
         _loc1_.setupOutroButton(false);
         _loc1_.method_192(false);
         _loc1_.editor.destroy();
         _loc1_.editor = null;
         if(_loc1_.customers)
         {
            _loc1_.customers.destroy();
            _loc1_.customers = null;
         }
         if(_loc1_.stickers)
         {
            _loc1_.stickers.destroy();
            _loc1_.stickers = null;
         }
         if(_loc1_.help)
         {
            _loc1_.help.destroy();
            _loc1_.help = null;
         }
         if(_loc1_.cookbook)
         {
            _loc1_.cookbook.destroy();
            _loc1_.cookbook = null;
         }
         if(_loc1_.credits)
         {
            _loc1_.credits.destroy();
            _loc1_.credits = null;
         }
         if(_loc1_.trainingClip)
         {
            _loc1_.gameObj.removeChild(_loc1_.trainingClip);
            _loc1_.trainingClip = null;
         }
         _loc1_.container.removeEventListener("clickShop",_loc1_.clickShop);
         _loc1_.container.removeEventListener("clickEditLobby",_loc1_.clickEditLobby);
         _loc1_.container.removeEventListener("clickContinue",_loc1_.clickContinue);
         _loc1_.container.removeEventListener("clickParade",_loc1_.clickParade);
         _loc1_.container.removeEventListener("clickQuit",_loc1_.clickQuit);
         _loc1_.container.removeEventListener("clickCookbook",_loc1_.clickCookbook);
         _loc1_.container.removeEventListener("clickCustomers",_loc1_.clickCustomers);
         _loc1_.container.removeEventListener("clickCredits",_loc1_.clickCredits);
         _loc1_.container.removeEventListener("clickHelp",_loc1_.clickHelp);
         _loc1_.container.removeEventListener("clickStickers",_loc1_.clickStickers);
         _loc1_.container.removeEventListener("clickInfo",_loc1_.clickInfo);
         _loc1_.gameObj.var_130.api.removeEventListener("clickCookbook",_loc1_.clickCookbook);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function setupOutroButton(param1:Boolean = true) : void
      {
         var firstDay:Number = NaN;
         var init:Boolean = param1;
         var screen:StartDayPanel = this;
         if(!screen.didSetupOutroButton)
         {
            try
            {
               if(init)
               {
                  screen.outroButton = screen.clip.outro_btn;
                  screen.outroButton.addEventListener(MouseEvent.MOUSE_DOWN,screen.clickRewatchOutro);
                  screen.gameObj.var_130.api.method_203(screen.outroButton,"StartDayPanel");
                  firstDay = screen.gameObj.var_127.getCustomerFirstDay(screen.gameObj.var_131.getCustomerIndex(screen.var_262));
                  if(screen.gameObj.var_133.showNewCustomer && screen.gameObj.var_133.showNewCustomerNum == screen.gameObj.var_131.getCustomerIndex(screen.var_262))
                  {
                     screen.outroButton.visible = false;
                  }
                  else if(firstDay > 0 && firstDay <= screen.gameObj.var_127.getDay())
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
                  screen.outroButton.removeEventListener(MouseEvent.MOUSE_DOWN,screen.clickRewatchOutro);
                  if(screen.outroButton.parent)
                  {
                     screen.outroButton.parent.removeChild(screen.outroButton);
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
      
      public function clickRewatchOutro(param1:MouseEvent = null) : void
      {
         var _loc2_:StartDayPanel = this;
         _loc2_.gameObj.method_148(true,_loc2_.method_216);
      }
      
      public function method_216() : void
      {
         var _loc1_:StartDayPanel = this;
         try
         {
            if(_loc1_.editor)
            {
               _loc1_.editor.clip.fader.gotoAndPlay("fadein");
            }
         }
         catch(err:Error)
         {
         }
      }
   }
}
