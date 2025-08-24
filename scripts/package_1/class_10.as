package package_1
{
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.*;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.system.Security;
   import flipline.api.*;
   import package_2.class_3;
   import package_2.class_6;
   import package_4.class_5;
   import package_5.*;
   import sushiGame.data.UserData;
   import sushiGame.managers.ChallengeManager;
   
   public class class_10
   {
       
      
      public var gameObj:class_5;
      
      public var api:class_18;
      
      public var var_38:String = "1.0.1";
      
      private var var_243:String = "myleaderboard";
      
      private var kongregate:*;
      
      private var var_244:Loader;
      
      public var var_317:Boolean = false;
      
      public function class_10(param1:class_5)
      {
         super();
         this.gameObj = param1;
      }
      
      public function method_153() : void
      {
         var _loc1_:class_10 = this;
         _loc1_.api = new class_18(_loc1_.gameObj,_loc1_.gameObj.var_150,640,480);
         var _loc2_:class_19 = _loc1_.api.method_112("SplashScreen","sushiGame.screens.SplashScreen",false,"",true,"bottom right",true,false,false,true);
         _loc2_.method_113("Play","clickStart",true,false,-1,true,"menuicon_greenarrow");
         _loc2_.method_268(true,"Game and Characters (c) 2016 Flipline Studios. All Rights Reserved.");
         _loc2_.method_213(true,"v " + _loc1_.var_38);
         if(class_3.method_56())
         {
            if(class_1.method_66())
            {
               if(class_1.method_94())
               {
                  _loc2_.method_110(true,"top left",class_3.method_25("31000100011201120108005400430043011501150115004200980104010101080104010101060097004200950107010500590113011201050091011101070113011000950097005700990093010500970091010401010106010301110034011301120105009101050097009601010113010500570112010101120104009701110095011000970097010600910104010700990107003401130112010500910095009301050108009301010099010600570108009301080093011101110113011101000101011001010093"),true,"large");
               }
               else
               {
                  _loc2_.method_110(true,"top left","",true,"large");
               }
            }
            if(class_1.method_102())
            {
               if(class_1.method_100())
               {
                  if(class_1.method_66())
                  {
                     _loc2_.method_115(true,"top right",class_1.method_68(),"large");
                  }
                  else
                  {
                     _loc2_.method_115(true,"top center",class_1.method_68(),"large");
                  }
               }
               else
               {
                  _loc2_.method_115(true,"top right","","large");
               }
            }
            if(class_1.method_73())
            {
               _loc2_.method_108("CREDITS","clickCredits");
            }
            if(class_1.method_96())
            {
               if(class_1.method_80() == "")
               {
                  _loc2_.method_171(class_1.method_70(),class_1.method_68());
               }
               else
               {
                  _loc2_.method_171(class_1.method_70(),class_1.method_80());
               }
            }
            if(class_1.method_95())
            {
               _loc2_.method_180(true);
               _loc2_.method_119("http://www.hoodamath.com/games/papascupcakeria.html");
               _loc2_.method_119("http://www.hoodamath.com/games/papaspastaria.html");
               _loc2_.method_119("http://www.hoodamath.com/games/papasdonuteria.html");
               _loc2_.method_119("http://www.hoodamath.com/games/papascheeseria.html");
               _loc2_.method_119("http://www.hoodamath.com/games/papasbakeria.html");
            }
            else
            {
               _loc2_.var_247 = true;
               _loc2_.var_180 = false;
            }
         }
         else
         {
            _loc2_.method_283(true,class_3.method_25("2580100011201120108005400430043011501150115004200980104010101080104010101060097004200950107010500430108009301080093011101110113011101000101011001010093009101040101009500970106011100970110009700960101011000970095011200420100011201050104"));
            _loc2_.method_110(true,"top left",class_3.method_25("31000100011201120108005400430043011501150115004200980104010101080104010101060097004200950107010500590113011201050091011101070113011000950097005700990093010500970091010401010106010301110034011301120105009101050097009601010113010500570112010101120104009701110095011000970097010600910104010700990107003401130112010500910095009301050108009301010099010600570108009301080093011101110113011101000101011001010093"),true,"large");
            _loc2_.method_129(true,"top right",class_3.method_25("310101000112011201080054004300430115011501150042010800930108009301040107011301010097004200950107010500590113011201050091011101070113011000950097005700990093010500970091010401010106010301110034011301120105009101050097009601010113010500570112010101120104009701110095011000970097010600910104010700990107003401130112010500910095009301050108009301010099010600570108009301080093011101110113011101000101011001010093"),true,"large");
            _loc2_.method_180();
            _loc2_.method_228(true,"http://www.facebook.com/flipline",true,"http://www.twitter.com/FliplineStudios");
            _loc2_.method_119("http://www.flipline.com/games/papascupcakeria/index.html?utm_source=promo_panel&utm_medium=papascupcakeria&utm_campaign=papassushiria");
            _loc2_.method_119("http://www.flipline.com/games/papaspastaria/index.html?utm_source=promo_panel&utm_medium=papaspastaria&utm_campaign=papassushiria");
            _loc2_.method_119("http://www.flipline.com/games/papasdonuteria/index.html?utm_source=promo_panel&utm_medium=papasdonuteria&utm_campaign=papassushiria");
            _loc2_.method_119("http://www.flipline.com/games/papascheeseria/index.html?utm_source=promo_panel&utm_medium=papascheeseria&utm_campaign=papassushiria");
            _loc2_.method_119("http://www.flipline.com/games/papasbakeria/index.html?utm_source=promo_panel&utm_medium=papasbakeria&utm_campaign=papassushiria");
         }
         var _loc3_:class_19 = _loc1_.api.method_112("SlotSelect","sushiGame.screens.SlotSelectScreen",true,"CHOOSE A SLOT",true,"top right",true);
         _loc3_.method_125("BACK","clickBack",true,"menuicon_redback");
         var _loc4_:class_19;
         (_loc4_ = _loc1_.api.method_112("CharacterEditor","sushiGame.screens.CharacterEditorScreen",true,"CREATE YOUR CHEF",true,"top right",true,false,true)).method_125("BACK","clickBack",true,"menuicon_redback");
         _loc4_.method_113("Continue","clickContinue",false,false,-1,false,"menuicon_greenarrow");
         var _loc5_:class_19;
         (_loc5_ = _loc1_.api.method_112("WaiterEditor","sushiGame.screens.CharacterEditorScreen",true,"CREATE YOUR SERVER",true,"top right",true,false,true)).method_125("BACK","clickBack",true,"menuicon_redback");
         _loc5_.method_113("Hire","clickContinue",false,false,130,false,"menuicon_greenarrow");
         var _loc6_:class_19;
         (_loc6_ = _loc1_.api.method_112("Cookbook","sushiGame.screens.CookbookScreen",true,"COOKBOOK",true,"top right",true,false,true)).method_113("Close Cookbook","clickContinue",false,false,-1,false,"menuicon_greenarrow");
         var _loc7_:class_19;
         (_loc7_ = _loc1_.api.method_112("Customer","sushiGame.screens.CustomerScreen",true,"CUSTOMERS",true,"top right",true,false,true)).method_113("Close","clickContinue",false,false,-1,false,"menuicon_greenarrow");
         var _loc8_:class_19;
         (_loc8_ = _loc1_.api.method_112("Credits","sushiGame.screens.CreditsScreen",true,"CREDITS",true,"top right",true,false,true)).method_113("Close","clickContinue",false,false,-1,false,"menuicon_greenarrow");
         var _loc9_:class_19;
         (_loc9_ = _loc1_.api.method_112("Help","sushiGame.screens.HelpScreen",true,"HELP",true,"top right",true,false,true)).method_113("Close","clickContinue",false,false,-1,false,"menuicon_greenarrow");
         var _loc10_:class_19;
         (_loc10_ = _loc1_.api.method_112("Stickers","sushiGame.screens.StickerScreen",true,"HELP",true,"top right",true,false,true)).method_113("Close","clickContinue",false,false,-1,false,"menuicon_greenarrow");
         var _loc11_:class_19;
         (_loc11_ = _loc1_.api.method_112("EndOfDay","sushiGame.screens.EndOfDayScreen",true,"TODAY\'S SERVICE",true,"top right",true)).method_125("QUIT","clickQuit",true,"menuicon_quit");
         _loc11_.method_113("Continue","clickContinue",false,true,-1,false,"menuicon_greenarrow");
         if(class_3.method_56())
         {
            if(class_1.method_64())
            {
               if(class_1.method_88())
               {
                  _loc11_.method_110(true,"bottom left",class_1.method_101());
               }
               else
               {
                  _loc11_.method_110(true,"bottom left","");
               }
            }
            if(class_1.method_77())
            {
               if(class_1.method_71())
               {
                  _loc11_.method_115(true,"bottom right",class_1.method_68(),"small");
               }
               else
               {
                  _loc11_.method_115(true,"bottom right","","small");
               }
            }
            if(class_1.method_69())
            {
               _loc11_.method_108("Submit Score","clickSubmitScore",true);
            }
            if(_loc1_.method_130())
            {
               _loc11_.method_108("Save Backup","clickSaveBackup",true,-1,"menuicon_backup");
            }
         }
         else
         {
            _loc11_.method_110(true,"bottom left",class_1.method_101());
            _loc11_.method_129(true,"bottom right",class_1.method_78(),false,"small");
            if(class_1.method_67())
            {
               _loc11_.method_108("Submit Score","clickSubmitScore",true);
            }
            if(_loc1_.method_130())
            {
               _loc11_.method_108("Save Backup","clickSaveBackup",true,-1,"menuicon_backup");
            }
         }
         var _loc12_:class_19;
         (_loc12_ = _loc1_.api.method_112("StartDayPanel","sushiGame.screens.StartDayPanel",false,"",true,"top right",true)).method_125("QUIT","clickQuit",true,"menuicon_quit");
         _loc12_.method_108("(Info)","clickInfo",true,-1,"menuicon_info");
         _loc12_.method_108("(Customers)","clickCustomers",true,-1,"menuicon_customers");
         _loc12_.method_108("(Stickers)","clickStickers",true,-1,"menuicon_badges");
         _loc12_.method_108("View Parade","clickParade",true,130,"menuicon_parade");
         _loc12_.method_108("Visit Shop","clickShop",true,130,"menuicon_shop");
         _loc12_.method_108("Decorate Lobby","clickEditLobby",true,130,"menuicon_decorate");
         _loc12_.method_108("(Cookbook)","clickCookbook",true,-1,"menuicon_cookbook");
         _loc12_.method_108("(Help)","clickHelp",true,-1,"menuicon_help");
         _loc12_.method_108("(Credits)","clickCredits",true,-1,"menuicon_credits");
         _loc12_.method_113("Continue","clickContinue",false,true,-1,true,"menuicon_greenarrow");
         if(class_3.method_56())
         {
            if(class_1.method_64())
            {
               if(class_1.method_88())
               {
                  _loc12_.method_110(true,"bottom left",class_1.method_101());
               }
               else
               {
                  _loc12_.method_110(true,"bottom left","");
               }
            }
            if(class_1.method_77())
            {
               if(class_1.method_71())
               {
                  _loc12_.method_115(true,"bottom right",class_1.method_68(),"small");
               }
               else
               {
                  _loc12_.method_115(true,"bottom right","","small");
               }
            }
         }
         else
         {
            _loc12_.method_129(true,"bottom right",class_1.method_78(),false,"small");
            _loc12_.method_110(true,"bottom left",class_1.method_101());
         }
         var _loc13_:class_19;
         (_loc13_ = _loc1_.api.method_112("ShopScreen","sushiGame.screens.ShopScreen",false,"",false,"",false,false,false,false,true)).method_113("Leave Shop","clickBackToGame",false,false,-1,false,"menuicon_greenarrow");
         var _loc14_:class_19;
         (_loc14_ = _loc1_.api.method_112("SplashCredits","sushiGame.screens.MainMenuScreen",true,"CREDITS",true,"top right",true)).method_113("Back","clickBackToSplash",false,false,-1,false,"menuicon_greenarrow");
         if(class_3.method_56())
         {
            if(class_1.method_64())
            {
               if(class_1.method_88())
               {
                  _loc14_.method_110(true,"bottom left",class_1.method_101());
               }
               else
               {
                  _loc14_.method_110(true,"bottom left","");
               }
            }
            if(class_1.method_77())
            {
               if(class_1.method_71())
               {
                  _loc14_.method_115(true,"bottom right",class_1.method_68(),"small");
               }
               else
               {
                  _loc14_.method_115(true,"bottom right","","small");
               }
            }
         }
         else
         {
            _loc14_.method_129(true,"bottom right",class_1.method_78(),false,"small");
            _loc14_.method_110(true,"bottom left",class_1.method_101());
         }
         var _loc15_:class_19;
         (_loc15_ = _loc1_.api.method_112("MainMenu","sushiGame.screens.MainMenuScreen",true,"INFO",true,"top right",true)).method_113("Back to Game","clickBackToGame",false,false,-1,false,"menuicon_greenarrow");
         _loc15_.method_108("INFO","clickInfo",false,-1,"menuicon_info");
         _loc15_.method_108("CUSTOMERS","clickCustomers",false,-1,"menuicon_customers");
         _loc15_.method_108("STICKERS","clickMedals",false,-1,"menuicon_badges");
         _loc15_.method_108("HELP","clickHelp",false,-1,"menuicon_help");
         _loc15_.method_108("CREDITS","clickCredits",false,-1,"menuicon_credits");
         _loc15_.method_108("COOKBOOK","clickCookbook",false,-1,"menuicon_cookbook");
         _loc15_.method_125("QUIT","clickQuit",true,"menuicon_quit");
         if(class_3.method_56())
         {
            if(class_1.method_64())
            {
               if(class_1.method_88())
               {
                  _loc15_.method_110(true,"bottom left",class_1.method_101());
               }
               else
               {
                  _loc15_.method_110(true,"bottom left","");
               }
            }
            if(class_1.method_77())
            {
               if(class_1.method_71())
               {
                  _loc15_.method_115(true,"bottom right",class_1.method_68(),"small");
               }
               else
               {
                  _loc15_.method_115(true,"bottom right","","small");
               }
            }
         }
         else
         {
            _loc15_.method_129(true,"bottom right",class_1.method_78(),false,"small");
            _loc15_.method_110(true,"bottom left",class_1.method_101());
         }
         var _loc16_:class_19;
         (_loc16_ = _loc1_.api.method_112("LobbyHelp","sushiGame.screens.MainMenuScreen",true,"LOBBY HELP",true,"top right",true)).method_113("Back to Lobby","clickBackToGame",false,false,-1,false,"menuicon_greenarrow");
         if(class_3.method_56())
         {
            if(class_1.method_64())
            {
               if(class_1.method_88())
               {
                  _loc16_.method_110(true,"bottom left",class_1.method_101());
               }
               else
               {
                  _loc16_.method_110(true,"bottom left","");
               }
            }
            if(class_1.method_77())
            {
               if(class_1.method_71())
               {
                  _loc16_.method_115(true,"bottom right",class_1.method_68(),"small");
               }
               else
               {
                  _loc16_.method_115(true,"bottom right","","small");
               }
            }
         }
         else
         {
            _loc16_.method_110(true,"bottom left",class_1.method_101());
            _loc16_.method_129(true,"bottom right",class_1.method_78(),false,"small");
         }
         _loc1_.method_225();
      }
      
      public function method_130() : Boolean
      {
         this;
         if(class_3.method_75())
         {
            return false;
         }
         if(class_3.method_56() && class_1.method_85() == false)
         {
            return false;
         }
         return true;
      }
      
      public function method_160(param1:*) : void
      {
         var _loc2_:class_10 = this;
         _loc2_.api.method_160(param1);
      }
      
      public function submitScore(param1:Number, param2:String = "Anonymous", param3:Function = null, param4:Object = null) : void
      {
         var _loc5_:class_10 = this;
         if(!class_3.method_56())
         {
            if(class_1.method_67())
            {
               _loc5_.api.method_137(_loc5_.var_243,param3,true,true,true,param2,param1,param4);
            }
         }
         else if(class_1.method_69())
         {
            _loc5_.api.method_137(_loc5_.var_243,param3,true,true,true,param2,param1,param4);
         }
      }
      
      public function method_237(param1:Function = null) : void
      {
         var _loc2_:class_10 = this;
         if(!class_3.method_56())
         {
            if(class_1.method_67())
            {
               _loc2_.api.method_137(_loc2_.var_243,param1);
            }
         }
         else if(class_1.method_69())
         {
            _loc2_.api.method_137(_loc2_.var_243,param1);
         }
      }
      
      public function method_128() : void
      {
         var _loc1_:class_10 = this;
         try
         {
            if(!class_3.method_56())
            {
               if(class_1.method_67())
               {
                  _loc1_.api.method_142();
               }
            }
            else if(class_1.method_69())
            {
               _loc1_.api.method_142();
            }
         }
         catch(err:Error)
         {
         }
      }
      
      private function method_36() : LoaderInfo
      {
         return this.gameObj.root.loaderInfo;
      }
      
      public function method_156() : void
      {
         var _loc1_:class_10 = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:ChallengeManager = _loc1_.gameObj.var_136;
         if(class_3.method_75() && _loc1_.var_317 && _loc1_.kongregate)
         {
            _loc1_.kongregate.stats.submit("highScore",_loc2_.getTotalPoints());
            _loc1_.kongregate.stats.submit("rank",_loc2_.getRank());
            _loc1_.kongregate.stats.submit("daysPlayed",_loc2_.getDay());
            _loc1_.kongregate.stats.submit("customersUnlocked",_loc2_.getStatCustomersUnlocked());
            _loc1_.kongregate.stats.submit("bronzeCustomers",_loc2_.getStatCustomersBronze());
            _loc1_.kongregate.stats.submit("silverCustomers",_loc2_.getStatCustomersSilver());
            _loc1_.kongregate.stats.submit("goldCustomers",_loc2_.getStatCustomersGold());
         }
      }
      
      public function method_225() : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc1_:class_10 = this;
         if(class_3.method_75())
         {
            class_6.info("On Kongregate, connect to API.");
            _loc1_.var_317 = true;
            _loc2_ = LoaderInfo(_loc1_.method_36()).parameters;
            _loc3_ = String(String(_loc2_.kongregate_api_path) || "http://www.kongregate.com/flash/API_AS3_Local.swf");
            Security.allowDomain(_loc3_);
            _loc1_.var_244 = new Loader();
            _loc1_.var_244.contentLoaderInfo.addEventListener(Event.COMPLETE,_loc1_.method_252);
            _loc1_.var_244.load(new URLRequest(_loc3_));
            _loc1_.gameObj.addChild(_loc1_.var_244);
         }
      }
      
      public function method_252(param1:Event) : void
      {
         var _loc2_:class_10 = this;
         class_6.info("Kongregate API Connected.");
         _loc2_.kongregate = param1.target.content;
         _loc2_.kongregate.services.connect();
      }
      
      public function method_117(param1:String, param2:String = null) : void
      {
         var type:String = param1;
         var value:String = param2;
         var ob:class_10 = this;
         if(class_3.method_56())
         {
            try
            {
               if(ExternalInterface.available)
               {
                  if(value == null)
                  {
                     ExternalInterface.call("cmgGameEvent",type);
                  }
                  else
                  {
                     ExternalInterface.call("cmgGameEvent",type,value);
                  }
               }
            }
            catch(err:Error)
            {
               class_6.error("Could not send tracking data: " + err.message);
            }
         }
      }
   }
}
