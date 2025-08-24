package package_4
{
   import flash.display.*;
   import flash.events.Event;
   import package_1.class_1;
   import package_1.class_10;
   import package_2.class_3;
   import package_2.class_6;
   import sushiGame.data.ClothingData;
   import sushiGame.data.CustomerData;
   import sushiGame.data.GameData;
   import sushiGame.data.ToppingData;
   import sushiGame.data.UserData;
   import sushiGame.data.WorkerData;
   import sushiGame.events.GameControls;
   import sushiGame.managers.ChallengeManager;
   import sushiGame.managers.CustomerManager;
   import sushiGame.managers.SoundManager;
   import sushiGame.managers.TicketManager;
   import sushiGame.screens.*;
   
   public dynamic class class_5 extends MovieClip
   {
       
      
      public var var_139:MovieClip;
      
      public var var_150:MovieClip;
      
      public var var_127:UserData;
      
      public var var_131:CustomerData;
      
      public var var_132:GameData;
      
      public var var_134:ClothingData;
      
      public var workerData:WorkerData;
      
      public var var_143:WorkerData;
      
      public var toppingData:ToppingData;
      
      public var var_145:OrderScreen;
      
      public var var_137:TeaScreen;
      
      public var var_135:CookScreen;
      
      public var var_129:BuildScreen;
      
      public var var_186:TakeOrderScreen;
      
      public var var_188:GiveOrderScreen;
      
      public var var_195:DiningTakeOrderScreen;
      
      public var var_191:DiningGiveOrderScreen;
      
      public var var_193:StartDayScreen;
      
      public var var_194:FinishDayScreen;
      
      public var var_213:UnlockScreen;
      
      public var var_236:PrizePopup;
      
      public var var_223:SpecialPopup;
      
      public var var_226:UnlockOutfitScreen;
      
      public var var_222:DeliverCouponScreen;
      
      public var var_229:HireWaiterScreen;
      
      public var var_216:ParadeScreen;
      
      public var var_392:CharacterEditorScreen;
      
      public var var_227:MiniGameScreen;
      
      public var var_178:LobbyEditorScreen;
      
      public var var_235:IntroScreen;
      
      public var var_231:OutroScreen;
      
      public var var_133:CustomerManager;
      
      public var var_152:TicketManager;
      
      public var var_136:ChallengeManager;
      
      public var loadingScreen:class_2;
      
      public var var_250:class_11;
      
      public var var_254:class_9;
      
      public var var_249:class_7;
      
      public var var_318:class_8;
      
      public var var_354:Array;
      
      public var hud:GameHUD;
      
      public var controls:GameControls;
      
      public var var_128:SoundManager;
      
      public var var_130:class_10;
      
      public var var_169:Boolean = false;
      
      public var var_202:Boolean = false;
      
      public var var_206:Number = 10800;
      
      public var var_395:Number = 640;
      
      public var var_396:Number = 480;
      
      public var training:Boolean = false;
      
      public var var_196:Number = 1;
      
      public var var_304:Number = 36;
      
      public var var_391:Boolean = false;
      
      public var var_308:Boolean = false;
      
      private var var_288:Boolean = false;
      
      public function class_5()
      {
         this.var_354 = [SplashScreen,SlotSelectScreen,EndOfDayScreen,StartDayPanel,ShopScreen,MainMenuScreen,CharacterEditorScreen];
         super();
      }
      
      public function method_262(param1:Event = null) : void
      {
         var _loc2_:class_5 = this;
         _loc2_.method_234();
         _loc2_.var_139 = new MovieClip();
         _loc2_.var_139.mouseEnabled = false;
         _loc2_.addChild(_loc2_.var_139);
         _loc2_.var_150 = new MovieClip();
         _loc2_.var_150.mouseEnabled = false;
         _loc2_.addChild(_loc2_.var_150);
         var _loc3_:MovieClip = new border_overlay();
         _loc2_.addChild(_loc3_);
         _loc2_.var_131 = new CustomerData(_loc2_);
         _loc2_.var_132 = new GameData(_loc2_);
         _loc2_.var_127 = new UserData(_loc2_);
         _loc2_.var_134 = new ClothingData(_loc2_);
         _loc2_.workerData = new WorkerData();
         _loc2_.var_143 = new WorkerData();
         _loc2_.toppingData = new ToppingData(_loc2_);
         _loc2_.var_136 = new ChallengeManager(_loc2_);
         _loc2_.var_130 = new class_10(_loc2_);
         _loc2_.var_130.method_153();
         _loc2_.var_132.setPrizes();
         trace("Papa\'s Sushiria (c) 2016 Flipline Studios.  All Rights Reserved.");
         trace("Game Version: " + _loc2_.var_130.var_38 + "");
         trace("- Loaded.");
         trace("----------------------------------------------------------------");
         _loc2_.method_218();
      }
      
      public function method_303(param1:Function) : void
      {
         this;
         class_6.method_214(param1);
      }
      
      public function method_234() : void
      {
         var loaderInfo:LoaderInfo = null;
         var sentLevel:String = null;
         var numberLevel:Number = NaN;
         var mod:class_5 = this;
         class_6.method_211(mod.method_282);
         class_6.method_163(class_6.ALL);
         try
         {
            loaderInfo = mod.root.loaderInfo;
            if(loaderInfo.loader != null)
            {
               loaderInfo = loaderInfo.loader.loaderInfo;
            }
            if(loaderInfo.parameters.hasOwnProperty("traceall"))
            {
               class_6.method_163(class_6.ALL);
            }
            else if(loaderInfo.parameters.hasOwnProperty("tracelevel"))
            {
               sentLevel = String(loaderInfo.parameters.tracelevel);
               numberLevel = 0;
               if(sentLevel == "all")
               {
                  numberLevel = class_6.ALL;
               }
               else if(sentLevel == "debug")
               {
                  numberLevel = class_6.const_8;
               }
               else if(sentLevel == "error")
               {
                  numberLevel = class_6.const_10;
               }
               else if(sentLevel == "warn")
               {
                  numberLevel = class_6.const_7;
               }
               else if(sentLevel == "none" || sentLevel == "off")
               {
                  numberLevel = class_6.const_21;
               }
               else
               {
                  numberLevel = Number(sentLevel);
               }
               class_6.method_163(numberLevel);
            }
         }
         catch(err:Error)
         {
            class_6.error("Error checking parameters for trace override.");
         }
      }
      
      public function method_282() : String
      {
         var mod:class_5 = this;
         var returnVal:String = "";
         try
         {
            if(mod.controls)
            {
               returnVal = mod.controls.gameplayTimer + "   ";
            }
            else
            {
               returnVal = "???   ";
            }
         }
         catch(err:Error)
         {
            returnVal = "err   ";
         }
         return returnVal;
      }
      
      public function method_218() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.stage != null)
         {
            _loc1_.stage.stageFocusRect = false;
         }
         _loc1_.var_128 = new SoundManager(_loc1_);
         _loc1_.var_130.method_160(_loc1_.var_128);
         if(class_3.method_65())
         {
            if(class_3.method_56())
            {
               if(class_1.method_90())
               {
                  _loc1_.method_285();
               }
               else if(class_1.method_84())
               {
                  _loc1_.method_157();
               }
               else
               {
                  _loc1_.var_130.api.method_106("SplashScreen");
               }
            }
            else
            {
               _loc1_.method_298();
            }
         }
         else
         {
            _loc1_.method_295();
         }
      }
      
      public function method_295() : void
      {
         var _loc1_:class_5 = this;
         if(!_loc1_.var_318)
         {
            _loc1_.var_318 = new class_8(_loc1_);
         }
      }
      
      public function method_298() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_250 = new class_11(_loc1_);
      }
      
      public function method_182() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_250)
         {
            _loc1_.var_250.destroy();
            _loc1_.var_250 = null;
         }
      }
      
      public function method_285() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_254 = new class_9(_loc1_);
      }
      
      public function method_241() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_254)
         {
            _loc1_.var_254.destroy();
            _loc1_.var_254 = null;
         }
      }
      
      public function method_157() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_249 = new class_7(_loc1_);
      }
      
      public function method_208() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_249)
         {
            _loc1_.var_249.destroy();
            _loc1_.var_249 = null;
         }
      }
      
      public function method_145() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_130.api.method_107("EndOfDay");
         _loc1_.method_152();
         _loc1_.var_169 = false;
         _loc1_.var_288 = false;
         _loc1_.var_130.api.method_106("SplashScreen");
      }
      
      public function method_154(param1:Number = -1) : void
      {
         var _loc2_:class_5 = this;
         if(_loc2_.var_193)
         {
            _loc2_.var_193.destroy();
            _loc2_.var_193 = null;
         }
         if(!_loc2_.var_193)
         {
            _loc2_.var_193 = new StartDayScreen(_loc2_,param1);
         }
      }
      
      public function method_273() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_193)
         {
            _loc1_.var_193.destroy();
            _loc1_.var_193 = null;
         }
         if(_loc1_.controls)
         {
            _loc1_.controls.resetKeyFocus();
         }
      }
      
      public function method_279() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_194)
         {
            _loc1_.var_194.destroy();
            _loc1_.var_194 = null;
         }
         if(!_loc1_.var_194)
         {
            _loc1_.var_194 = new FinishDayScreen(_loc1_);
         }
      }
      
      public function method_232() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_194)
         {
            _loc1_.var_194.destroy();
            _loc1_.var_194 = null;
         }
      }
      
      public function method_118() : void
      {
         var _loc1_:class_5 = this;
         var _loc2_:Object = new Object();
         _loc2_.showAd = false;
         if(_loc1_.var_127.playedALevel)
         {
            _loc2_.showAd = true;
         }
         _loc1_.var_130.api.method_106("StartDayPanel",_loc2_);
      }
      
      public function method_116() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_130.api.method_107("StartDayPanel");
      }
      
      public function method_220() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("Show Shop Screen!");
         _loc1_.var_130.api.method_106("ShopScreen");
      }
      
      public function method_204() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_130.api.method_107("ShopScreen");
      }
      
      public function method_184(param1:Number = -1, param2:Boolean = false) : void
      {
         var _loc3_:class_5 = this;
         var _loc4_:Object;
         (_loc4_ = new Object()).selectedSlot = param1;
         _loc4_.firsttime = true;
         _loc4_.firstwaiter = param2;
         if(param2)
         {
            _loc3_.var_130.api.method_106("WaiterEditor",_loc4_);
         }
         else
         {
            _loc3_.var_130.api.method_106("CharacterEditor",_loc4_);
         }
      }
      
      public function method_179() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_130.api.method_107("WaiterEditor");
         _loc1_.var_130.api.method_107("CharacterEditor");
      }
      
      public function method_236() : void
      {
         var _loc1_:class_5 = this;
         if(!_loc1_.var_178)
         {
            _loc1_.var_178 = new LobbyEditorScreen(_loc1_);
         }
      }
      
      public function method_277() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_178)
         {
            _loc1_.var_178.destroy();
            _loc1_.var_178 = null;
         }
      }
      
      public function method_296() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Show Credits Screen");
         _loc1_.var_130.api.method_106("Credits");
      }
      
      public function method_243() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Remove Credits Screen");
         _loc1_.var_130.api.method_107("Credits");
      }
      
      public function method_242() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Show Help Screen");
         _loc1_.var_130.api.method_106("Help");
      }
      
      public function method_246() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Remove Help Screen");
         _loc1_.var_130.api.method_107("Help");
      }
      
      public function method_219() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Show Sticker Screen");
         _loc1_.var_130.api.method_106("Stickers");
      }
      
      public function method_229() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Remove Sticker Screen");
         _loc1_.var_130.api.method_107("Stickers");
      }
      
      public function method_294() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Show Customer Screen");
         _loc1_.var_130.api.method_106("Customer");
      }
      
      public function method_272() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Remove Customer Screen");
         _loc1_.var_130.api.method_107("Customer");
      }
      
      public function method_226() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Show Cookbook");
         _loc1_.var_130.api.method_106("Cookbook");
      }
      
      public function method_239() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("-- Remove Cookbook");
         _loc1_.var_130.api.method_107("Cookbook");
      }
      
      public function method_248(param1:String = null) : void
      {
         var _loc2_:class_5 = this;
         _loc2_.var_308 = true;
         _loc2_.var_288 = _loc2_.var_169;
         _loc2_.var_169 = true;
         if(param1 == "help")
         {
            _loc2_.var_130.api.method_106("LobbyHelp",{"useSection":String(param1)});
         }
         else if(param1 == "cookbook")
         {
            _loc2_.var_130.api.method_106("Cookbook",{"useSection":String(param1)});
         }
         else
         {
            _loc2_.var_130.api.method_106("MainMenu");
         }
      }
      
      public function method_152(param1:Boolean = false) : void
      {
         var _loc2_:class_5 = this;
         _loc2_.var_308 = false;
         _loc2_.var_169 = _loc2_.var_288;
         _loc2_.var_130.api.method_107("SplashCredits");
         _loc2_.var_130.api.method_107("MainMenu");
         _loc2_.var_130.api.method_107("LobbyHelp");
         _loc2_.var_130.api.method_107("Cookbook");
         if(param1)
         {
            try
            {
               _loc2_.hud.closedMenu();
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function method_134(param1:Boolean = false) : void
      {
         var _loc2_:class_5 = this;
         if(!_loc2_.var_213)
         {
            _loc2_.var_213 = new UnlockScreen(_loc2_,param1);
         }
      }
      
      public function method_166() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_213)
         {
            _loc1_.var_213.destroy();
            _loc1_.var_213 = null;
         }
      }
      
      public function showNewHireScreen() : void
      {
         var _loc1_:class_5 = this;
         if(!_loc1_.var_229)
         {
            _loc1_.var_229 = new HireWaiterScreen(_loc1_,_loc1_.var_150);
         }
      }
      
      public function method_280() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_229)
         {
            _loc1_.var_229.destroy();
            _loc1_.var_229 = null;
         }
      }
      
      public function method_288(param1:Number, param2:Function = null, param3:Boolean = false) : void
      {
         var _loc4_:class_5;
         if(!(_loc4_ = this).var_222)
         {
            _loc4_.var_222 = new DeliverCouponScreen(_loc4_,param1,param2,param3);
         }
      }
      
      public function method_275() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_222)
         {
            _loc1_.var_222.destroy();
            _loc1_.var_222 = null;
         }
      }
      
      public function method_249(param1:Number, param2:Function = null) : void
      {
         var _loc3_:class_5 = this;
         if(!_loc3_.var_226)
         {
            _loc3_.var_226 = new UnlockOutfitScreen(_loc3_,param1,param2);
         }
      }
      
      public function method_253() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_226)
         {
            _loc1_.var_226.destroy();
            _loc1_.var_226 = null;
         }
      }
      
      public function method_266(param1:String) : void
      {
         var _loc2_:class_5 = this;
         if(!_loc2_.var_236)
         {
            _loc2_.var_236 = new PrizePopup(_loc2_,_loc2_.var_150,param1);
         }
      }
      
      public function method_223() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_236)
         {
            _loc1_.var_236.destroy();
            _loc1_.var_236 = null;
         }
      }
      
      public function method_195(param1:Boolean = true) : void
      {
         var _loc2_:class_5 = this;
         if(!_loc2_.var_223)
         {
            _loc2_.var_223 = new SpecialPopup(_loc2_,_loc2_.var_150,param1);
         }
      }
      
      public function method_265() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_223)
         {
            _loc1_.var_223.destroy();
            _loc1_.var_223 = null;
         }
      }
      
      public function method_177(param1:Boolean = false) : void
      {
         var _loc2_:class_5 = this;
         if(!_loc2_.var_216)
         {
            _loc2_.var_216 = new ParadeScreen(_loc2_,param1);
         }
      }
      
      public function method_215() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_216)
         {
            _loc1_.var_216.destroy();
            _loc1_.var_216 = null;
         }
      }
      
      public function method_174(param1:String = "") : void
      {
         var _loc2_:class_5 = this;
         if(!_loc2_.var_227)
         {
            _loc2_.method_136();
            _loc2_.var_130.api.method_107("EndOfDay");
            _loc2_.var_227 = new MiniGameScreen(_loc2_,param1);
         }
      }
      
      public function method_254() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_227)
         {
            _loc1_.var_227.destroy();
            _loc1_.var_227 = null;
         }
      }
      
      public function method_198() : void
      {
         var _loc1_:class_5 = this;
         if(!_loc1_.var_235)
         {
            _loc1_.var_235 = new IntroScreen(_loc1_);
         }
      }
      
      public function method_286() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_235)
         {
            _loc1_.var_235.destroy();
            _loc1_.var_235 = null;
         }
      }
      
      public function method_148(param1:Boolean = false, param2:Function = null) : void
      {
         var _loc3_:class_5 = this;
         if(!_loc3_.var_231)
         {
            _loc3_.var_231 = new OutroScreen(_loc3_,param1,param2);
         }
      }
      
      public function method_261() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.var_231)
         {
            _loc1_.var_231.destroy();
            _loc1_.var_231 = null;
         }
      }
      
      public function method_144() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_130.api.method_107("EndOfDay");
         _loc1_.method_254();
         if(_loc1_.var_127.currentDay == 1)
         {
            _loc1_.training = true;
            _loc1_.var_196 = 1;
         }
         else
         {
            _loc1_.training = false;
         }
         _loc1_.controls = new GameControls(_loc1_);
         _loc1_.var_133 = new CustomerManager(_loc1_);
         _loc1_.var_152 = new TicketManager(_loc1_);
         _loc1_.hud = new GameHUD(_loc1_);
         _loc1_.var_145 = new OrderScreen(_loc1_);
         _loc1_.var_135 = new CookScreen(_loc1_);
         _loc1_.var_129 = new BuildScreen(_loc1_);
         _loc1_.var_137 = new TeaScreen(_loc1_);
         _loc1_.var_186 = new TakeOrderScreen(_loc1_);
         _loc1_.var_188 = new GiveOrderScreen(_loc1_);
         _loc1_.var_191 = new DiningGiveOrderScreen(_loc1_);
         _loc1_.var_195 = new DiningTakeOrderScreen(_loc1_);
         _loc1_.var_131.generateCustomerBitmap();
         if(_loc1_.var_127.currentDay > 1)
         {
            _loc1_.method_118();
         }
         else
         {
            _loc1_.var_133.setupLineup();
            _loc1_.method_154();
         }
      }
      
      public function method_136() : void
      {
         var _loc1_:class_5 = this;
         if(_loc1_.hud)
         {
            _loc1_.controls.destroy();
            _loc1_.var_133.destroy();
            _loc1_.var_152.destroy();
            _loc1_.hud.destroy();
            _loc1_.var_145.destroy();
            _loc1_.var_137.destroy();
            _loc1_.var_135.destroy();
            _loc1_.var_129.destroy();
            _loc1_.var_186.destroy();
            _loc1_.var_188.destroy();
            _loc1_.var_191.destroy();
            _loc1_.var_195.destroy();
            _loc1_.controls = null;
            _loc1_.var_133 = null;
            _loc1_.var_152 = null;
            _loc1_.hud = null;
            _loc1_.var_145 = null;
            _loc1_.var_137 = null;
            _loc1_.var_135 = null;
            _loc1_.var_129 = null;
            _loc1_.var_186 = null;
            _loc1_.var_188 = null;
            _loc1_.var_191 = null;
            _loc1_.var_195 = null;
         }
      }
      
      public function method_222() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.var_202 = false;
         _loc1_.var_128.restoreSoundAfterAd();
         _loc1_.controls.setupGameCycle();
         _loc1_.var_137.initStationUpgrades();
         _loc1_.var_135.initStationUpgrades();
         _loc1_.var_129.initStationUpgrades();
         _loc1_.var_145.initStationUpgrades();
         _loc1_.var_188.initStationUpgrades();
         _loc1_.var_191.initStationUpgrades();
         _loc1_.var_195.initStationUpgrades();
         _loc1_.var_186.initStationUpgrades();
         _loc1_.hud.startHUD();
         _loc1_.var_133.startSpawningCustomers();
      }
      
      public function method_250() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.method_136();
         _loc1_.var_130.api.method_106("EndOfDay");
      }
      
      public function quitToTitle() : void
      {
         var _loc1_:class_5 = this;
         _loc1_.method_204();
         _loc1_.method_116();
         _loc1_.method_152();
         _loc1_.method_136();
         _loc1_.method_145();
      }
      
      public function method_105(... rest) : Boolean
      {
         var _loc2_:class_5 = this;
         if(_loc2_.training && rest.indexOf(_loc2_.var_196) > -1)
         {
            return true;
         }
         return false;
      }
      
      public function method_104(... rest) : void
      {
         var _loc2_:class_5 = this;
         if(_loc2_.training && rest.indexOf(_loc2_.var_196) > -1)
         {
            _loc2_.method_278();
         }
      }
      
      private function method_278() : void
      {
         var _loc1_:class_5 = this;
         ++_loc1_.var_196;
         try
         {
            _loc1_.hud.trainingClip.nextFrame();
         }
         catch(err:Error)
         {
         }
         try
         {
            _loc1_.hud.showTrainingWarning("hidden");
         }
         catch(err:Error)
         {
         }
         if(_loc1_.var_196 > _loc1_.var_304)
         {
            class_6.info("Training Complete!");
            _loc1_.training = false;
            try
            {
               _loc1_.hud.removeSkipButtons();
            }
            catch(err:Error)
            {
            }
         }
      }
      
      public function method_217() : void
      {
         var _loc1_:class_5 = this;
         class_6.method_1("SKIP TRAINING");
         _loc1_.training = false;
         _loc1_.hud.removeContextTraining();
         _loc1_.var_127.setTrained("twofill");
         _loc1_.var_127.setTrained("streusel");
         _loc1_.var_127.setTrained("streuselpour");
         _loc1_.var_127.setTrained("distroinner");
      }
      
      public function method_121(param1:Boolean = false) : void
      {
         var prev:String = null;
         var fromTicketSwap:Boolean = param1;
         var mod:class_5 = this;
         var user:UserData = mod.var_127;
         var checkForRemoving:Boolean = false;
         try
         {
            if(!mod.training)
            {
               if(mod.var_127.currentDay == 1)
               {
                  if(mod.var_152.hangerTicket != null && mod.var_133.totalCustomers == 2)
                  {
                     if(!user.hasTrained("flipsushi") && (mod.hud.transitionToScreen == "build" || fromTicketSwap && mod.hud.currentStation == "build" || mod.hud.currentStation == "build" && mod.hud.transitionToScreen == "none") && mod.var_129.currentOrder != null && mod.var_129.mode == mod.var_129.MODE_FILLING && mod.var_152.hangerTicket.ticketNumber == 2)
                     {
                        mod.hud.showContextTraining("flipsushi");
                     }
                     else if(!user.hasTrained("shaker") && mod.hud.currentStation == "build" && mod.var_129.currentOrder != null && mod.var_129.mode == mod.var_129.MODE_TOPPING && mod.var_129.currentOrder.isRolling == false && mod.var_152.hangerTicket.ticketNumber == 2)
                     {
                        mod.hud.showContextTraining("shaker");
                     }
                     else if(!user.hasTrained("brownrice") && (mod.hud.transitionToScreen == "cook" || fromTicketSwap && mod.hud.currentStation == "cook") && mod.var_152.hangerTicket.ticketNumber == 2)
                     {
                        mod.hud.showContextTraining("brownrice");
                     }
                     else if(fromTicketSwap)
                     {
                        checkForRemoving = true;
                     }
                  }
                  else if(mod.var_152.hangerTicket == null && fromTicketSwap)
                  {
                     checkForRemoving = true;
                  }
               }
               else if(mod.var_127.currentDay > 1)
               {
                  if(mod.var_127.getRank() >= 11 && !mod.var_127.hasTrained("season") && mod.hud.transitionToScreen == "build" && mod.var_129.currentOrder != null && mod.var_129.mode == mod.var_129.MODE_FILLING)
                  {
                     mod.hud.showContextTraining("season");
                     mod.var_127.setTrained("season");
                  }
               }
            }
            if(checkForRemoving)
            {
               prev = mod.hud.whichContextTraining;
               if(prev == "flipsushi" || prev == "shaker" || prev == "brownrice")
               {
                  mod.hud.removeContextTraining();
               }
            }
         }
         catch(err:Error)
         {
            class_6.error("Error checking for contextual training: " + err.message);
         }
      }
   }
}
