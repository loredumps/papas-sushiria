package sushiGame.models
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   import package_2.class_12;
   import package_2.class_14;
   import package_2.class_3;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.CustomerData;
   import sushiGame.data.CustomerOrder;
   import sushiGame.data.FoodData;
   import sushiGame.data.GameData;
   import sushiGame.data.UserData;
   import sushiGame.events.ValueEvent;
   import sushiGame.managers.ChallengeManager;
   import sushiGame.screens.CustomerScreen;
   
   public class CustomerPage
   {
       
      
      public var gameObj:class_5;
      
      public var screen:CustomerScreen;
      
      public var container:MovieClip;
      
      public var customerIndex:Number = -1;
      
      public var customerClip:MovieClip = null;
      
      public var clip:MovieClip;
      
      public var isBlank:Boolean = false;
      
      public var panelHolder:MovieClip = null;
      
      public var panelParts:Vector.<MovieClip> = null;
      
      public var orderData:CustomerOrder = null;
      
      public var ticketClip:MovieClip = null;
      
      public var ticketLargeX:Number = 274;
      
      public var ticketLargeY:Number = 45;
      
      public var ticketLargeScaleX:Number = 0.95;
      
      public var ticketLargeScaleY:Number = 0.95;
      
      public var ticketSmallX:Number = 317;
      
      public var ticketSmallY:Number = 213;
      
      public var ticketSmallScaleX:Number = 0.201385;
      
      public var ticketSmallScaleY:Number = 0.209625;
      
      public var ticketIsLarge:Boolean = false;
      
      private var useWhichLink:String = "";
      
      private var useWhichFlipdeckLink:String = "";
      
      private var shouldShowPlayNow:Boolean = false;
      
      private var stickerStartX:Number = 188;
      
      private var stickerStartY:Number = 89;
      
      private var stickerSpacing:Number = 60;
      
      private var stickers:Vector.<MovieClip>;
      
      private var isOverSticker:Boolean = false;
      
      private var currentGame:String = "Papa\'s Sushiria";
      
      private var gameIconLabels:Array;
      
      private var gameIconLinks:Array;
      
      private var kernFormat:TextFormat = null;
      
      public function CustomerPage(param1:class_5, param2:CustomerScreen, param3:MovieClip, param4:Number = -1)
      {
         this.gameIconLabels = ["Papa\'s Burgeria","Papa\'s Cheeseria","Papa\'s Cupcakeria","Papa\'s Donuteria","Papa\'s Freezeria","Papa\'s Hot Doggeria","Papa\'s Pancakeria","Papa Louie 3","Papa Louie","Papa\'s Pastaria","Papa\'s Pizzeria","Papa\'s Taco Mia!","Papa\'s Wingeria","Papa\'s Bakeria","Papa\'s Sushiria","Papa\'s Pizzeria To Go!"];
         this.gameIconLinks = ["http://www.flipline.com/games/papasburgeria/","http://www.flipline.com/games/papascheeseria/","http://www.flipline.com/games/papascupcakeria/","http://www.flipline.com/games/papasdonuteria/","http://www.flipline.com/games/papasfreezeria/","http://www.flipline.com/games/papashotdoggeria/","http://www.flipline.com/games/papaspancakeria/","http://www.flipline.com/games/papalouie3/","http://www.flipline.com/games/papalouie/","http://www.flipline.com/games/papaspastaria/","http://www.flipline.com/games/papaspizzeria/","http://www.flipline.com/games/papastacomia/","http://www.flipline.com/games/papaswingeria/","http://www.flipline.com/games/papasbakeria/","http://www.flipline.com/games/papassushiria/","http://www.flipline.com/apps/papaspizzeriatogo/"];
         super();
         this.gameObj = param1;
         this.screen = param2;
         this.kernFormat = new TextFormat();
         this.kernFormat.kerning = true;
         this.customerIndex = param4;
         this.setupCustomerPage(param3);
      }
      
      public function setContainer(param1:MovieClip) : void
      {
         var _loc2_:CustomerPage = this;
         if(_loc2_.clip != null && param1 != null && param1.contains(_loc2_.clip) == false)
         {
            param1.addChild(_loc2_.clip);
         }
      }
      
      public function clickGame(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         if(_loc2_.useWhichLink != "")
         {
            _loc2_.gameObj.var_130.api.method_109(_loc2_.useWhichLink);
         }
      }
      
      public function clickFlipdeck(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         if(_loc2_.useWhichFlipdeckLink != "")
         {
            _loc2_.gameObj.var_130.api.method_109(_loc2_.useWhichFlipdeckLink);
         }
      }
      
      public function clickTicket(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         if(_loc2_.ticketIsLarge)
         {
            _loc2_.ticketIsLarge = false;
            _loc2_.gameObj.var_128.playSound("dropticket.wav");
         }
         else
         {
            _loc2_.ticketIsLarge = true;
            _loc2_.gameObj.var_128.playSound("grabticket.wav");
         }
         if(Boolean(_loc2_.ticketClip) && _loc2_.ticketClip.hasEventListener(Event.ENTER_FRAME) == false)
         {
            _loc2_.ticketClip.addEventListener(Event.ENTER_FRAME,_loc2_.updateTicket);
         }
      }
      
      public function updateTicket(param1:Event) : void
      {
         var _loc2_:CustomerPage = this;
         var _loc3_:Number = _loc2_.ticketSmallScaleX;
         var _loc4_:Number = _loc2_.ticketSmallScaleY;
         var _loc5_:Number = _loc2_.ticketSmallX;
         var _loc6_:Number = _loc2_.ticketSmallY;
         if(_loc2_.ticketIsLarge)
         {
            _loc3_ = _loc2_.ticketLargeScaleX;
            _loc4_ = _loc2_.ticketLargeScaleY;
            _loc5_ = _loc2_.ticketLargeX;
            _loc6_ = _loc2_.ticketLargeY;
         }
         if(_loc2_.ticketClip)
         {
            _loc2_.ticketClip.scaleX += (_loc3_ - _loc2_.ticketClip.scaleX) / 2;
            _loc2_.ticketClip.scaleY += (_loc4_ - _loc2_.ticketClip.scaleY) / 2;
            _loc2_.ticketClip.x += (_loc5_ - _loc2_.ticketClip.x) / 2;
            _loc2_.ticketClip.y += (_loc6_ - _loc2_.ticketClip.y) / 2;
            if(Math.abs(_loc3_ - _loc2_.ticketClip.scaleX) <= 0.01 && Math.abs(_loc4_ - _loc2_.ticketClip.scaleY) <= 0.01 && Math.abs(_loc5_ - _loc2_.ticketClip.x) <= 1 && Math.abs(_loc6_ - _loc2_.ticketClip.y) <= 1)
            {
               _loc2_.ticketClip.scaleX = _loc3_;
               _loc2_.ticketClip.scaleY = _loc4_;
               _loc2_.ticketClip.x = _loc5_;
               _loc2_.ticketClip.y = _loc6_;
               _loc2_.ticketClip.removeEventListener(Event.ENTER_FRAME,_loc2_.updateTicket);
            }
         }
      }
      
      public function setupCustomerPage(param1:MovieClip) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Number = NaN;
         var _loc14_:String = null;
         var _loc15_:MovieClip = null;
         var _loc16_:int = 0;
         var _loc17_:String = null;
         var _loc2_:CustomerPage = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:GameData = _loc2_.gameObj.var_132;
         var _loc5_:CustomerData = _loc2_.gameObj.var_131;
         if(!class_3.method_56())
         {
            _loc2_.shouldShowPlayNow = true;
         }
         if(_loc2_.customerIndex == -1)
         {
            _loc2_.clip = new menu_customer_nopage();
            _loc2_.isBlank = true;
         }
         else
         {
            _loc2_.clip = new menu_customer_page();
            _loc2_.clip.stickerinfo.alpha = 0;
            _loc2_.isOverSticker = false;
            _loc2_.clip.stickerinfo.mouseEnabled = false;
            _loc2_.clip.stickerinfo.mouseChildren = false;
            _loc2_.clip.stickerinfo.panel.stop();
            _loc2_.clip.name_txt.text = _loc5_.getCustomerName(_loc2_.customerIndex,true);
            _loc2_.clip.name_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.day_txt.text = "Day " + _loc3_.getCustomerFirstDay(_loc2_.customerIndex);
            if(_loc3_.getCustomerFirstDay(_loc2_.customerIndex) <= 0)
            {
               _loc2_.clip.day_txt.text = "--";
            }
            _loc2_.clip.meals_txt.text = _loc3_.getCustomerTotalOrders(_loc2_.customerIndex);
            if((_loc6_ = _loc5_.getCustomerFavoriteHoliday(_loc2_.customerIndex)) == 13 || _loc6_ == 0)
            {
               _loc2_.clip.holiday_txt.text = "ALL OF THEM!";
               _loc2_.clip.holiday_icon.stop();
               _loc2_.clip.holiday_icon.visible = false;
            }
            else
            {
               _loc2_.clip.holiday_txt.text = _loc4_.getHolidayName(_loc6_).toUpperCase();
               _loc2_.clip.holiday_icon.gotoAndStop(_loc6_);
            }
            _loc2_.clip.day_txt.setTextFormat(_loc2_.kernFormat);
            _loc2_.clip.meals_txt.setTextFormat(_loc2_.kernFormat);
            _loc7_ = _loc3_.getCustomerSeal(_loc2_.customerIndex);
            _loc8_ = _loc3_.getCustomerStars(_loc2_.customerIndex);
            if(_loc7_ > 0)
            {
               _loc2_.clip.seal.gotoAndStop(_loc7_);
            }
            else
            {
               _loc2_.clip.seal.gotoAndStop(4);
            }
            _loc9_ = 1;
            while(_loc9_ <= 5)
            {
               if(_loc8_ >= _loc9_)
               {
                  if(_loc7_ == 0 || _loc7_ == 1)
                  {
                     _loc2_.clip["star" + _loc9_].gotoAndStop(2);
                  }
                  else if(_loc7_ == 2)
                  {
                     _loc2_.clip["star" + _loc9_].gotoAndStop(3);
                  }
                  else
                  {
                     _loc2_.clip["star" + _loc9_].gotoAndStop(4);
                  }
               }
               else
               {
                  _loc2_.clip["star" + _loc9_].gotoAndStop(1);
               }
               _loc9_++;
            }
            _loc2_.buildCustomer();
            if(_loc5_.isCloser(_loc2_.customerIndex))
            {
               _loc2_.clip.coupon.visible = false;
            }
            else if(_loc3_.couponCustomer == _loc2_.customerIndex)
            {
               _loc2_.clip.coupon.visible = true;
               _loc2_.clip.coupon.btn.visible = false;
               _loc2_.clip.coupon.checkmark.visible = true;
               _loc2_.clip.coupon.other.visible = false;
               _loc2_.clip.created_txt.width = 109;
            }
            else if(_loc3_.couponCustomer > -1 && _loc3_.numCoupons > 0)
            {
               _loc2_.clip.coupon.visible = true;
               _loc2_.clip.coupon.btn.visible = false;
               _loc2_.clip.coupon.checkmark.visible = false;
               _loc2_.clip.coupon.other.visible = true;
               _loc2_.clip.created_txt.width = 109;
            }
            else if(_loc3_.numCoupons > 0)
            {
               _loc2_.clip.coupon.visible = true;
               _loc2_.clip.coupon.btn.visible = true;
               _loc2_.clip.coupon.checkmark.visible = false;
               _loc2_.clip.coupon.other.visible = false;
               _loc2_.clip.created_txt.width = 109;
            }
            else
            {
               _loc2_.clip.coupon.visible = false;
            }
            _loc2_.clip.coupon.btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickCoupon);
            if(_loc5_.isCloser(_loc2_.customerIndex))
            {
               if(_loc2_.customerIndex == 1)
               {
                  _loc2_.clip.critic.visible = true;
                  _loc2_.clip.closer.visible = false;
               }
               else
               {
                  _loc2_.clip.critic.visible = false;
                  _loc2_.clip.closer.visible = true;
               }
               _loc2_.clip.created_txt.text = "";
            }
            else
            {
               _loc2_.clip.critic.visible = false;
               _loc2_.clip.closer.visible = false;
               _loc14_ = "";
               if(_loc5_.getCustomerName(_loc2_.customerIndex) == "Hope")
               {
                  _loc14_ = "Created by Colorinda";
               }
               else if(_loc5_.getCustomerName(_loc2_.customerIndex) == "Yui")
               {
                  _loc14_ = "Created by Julia D";
               }
               else if(_loc5_.getCustomerName(_loc2_.customerIndex) == "Steven")
               {
                  _loc14_ = "Created by Kiki";
               }
               else if(_loc5_.getCustomerName(_loc2_.customerIndex) == "Elle")
               {
                  _loc14_ = "Created by Clare";
               }
               else
               {
                  _loc14_ = "";
               }
               _loc2_.clip.created_txt.text = _loc14_;
               class_12.method_158(_loc2_.clip.created_txt,_loc14_);
               _loc2_.clip.created_txt.setTextFormat(_loc2_.kernFormat);
            }
            _loc2_.clip.bg.gotoAndStop(_loc5_.getCustomerColor(_loc2_.customerIndex));
            _loc2_.clip.styleA_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickStyleButton);
            _loc2_.clip.styleB_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickStyleButton);
            _loc2_.clip.styleH_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickStyleButton);
            _loc2_.updateStyleBar();
            _loc10_ = _loc5_.getCustomerStickers(_loc2_.customerIndex);
            _loc2_.stickers = new Vector.<MovieClip>();
            _loc11_ = 0;
            while(_loc11_ < _loc10_.length)
            {
               (_loc15_ = class_14.method_103("stix_" + _loc10_[_loc11_],true,false)).scaleX = 0.8;
               _loc15_.scaleY = 0.8;
               _loc15_.x = _loc2_.stickerStartX + _loc11_ * _loc2_.stickerSpacing;
               _loc15_.y = _loc2_.stickerStartY;
               _loc15_.lines.visible = false;
               _loc2_.clip.customerholder.addChild(_loc15_);
               _loc2_.stickers.push(_loc15_);
               _loc15_.addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverSticker);
               _loc15_.addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutSticker);
               if(_loc3_.hasBadge(_loc2_.gameObj.var_136.getChallengeIndexForSticker(_loc10_[_loc11_])))
               {
                  _loc15_.gotoAndStop(1);
               }
               else
               {
                  _loc15_.gotoAndStop(2);
               }
               _loc11_++;
            }
            if(_loc3_.hasAlternateOutfit(_loc2_.customerIndex))
            {
               _loc2_.clip.message.visible = false;
            }
            else
            {
               _loc2_.clip.message.visible = true;
            }
            if(_loc3_.hasAlternateOutfit(_loc2_.customerIndex) == false && _loc3_.hasAllStickers(_loc10_))
            {
               _loc2_.clip.gift_btn.gotoAndPlay(1);
               _loc2_.clip.gift_btn.rolloverMC.visible = false;
               _loc2_.clip.gift_btn.visible = true;
               _loc2_.clip.gift_btn.mouseEnabled = true;
               _loc2_.clip.gift_btn.buttonMode = true;
               _loc2_.clip.gift_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickGiftBox);
               _loc2_.clip.gift_btn.addEventListener(MouseEvent.ROLL_OVER,_loc2_.rolloverGiftBox);
               _loc2_.clip.gift_btn.addEventListener(MouseEvent.ROLL_OUT,_loc2_.rolloutGiftBox);
               _loc16_ = 0;
               while(_loc16_ < _loc2_.stickers.length)
               {
                  _loc2_.stickers[_loc16_].visible = false;
                  _loc16_++;
               }
               if(_loc3_.hasTrained("stickergivegift") == false)
               {
                  _loc2_.screen.showContextTraining("stickergivegift");
               }
            }
            else
            {
               _loc2_.clip.gift_btn.gotoAndStop(1);
               _loc2_.clip.gift_btn.mouseEnabled = false;
               _loc2_.clip.gift_btn.mouseChildren = false;
               _loc2_.clip.gift_btn.tabEnabled = false;
               _loc2_.clip.gift_btn.visible = false;
               if(_loc2_.screen.whichContextTraining == "stickergivegift" || _loc2_.screen.whichContextTraining == "stickersort")
               {
                  _loc2_.screen.removeContextTraining();
               }
            }
            _loc12_ = _loc5_.getCustomerFirstGame(_loc2_.customerIndex);
            if((_loc13_ = _loc2_.gameIconLabels.indexOf(_loc12_)) > -1)
            {
               _loc2_.clip.gameicon.gotoAndStop(_loc13_ + 1);
               if(_loc2_.shouldShowPlayNow && _loc12_ != _loc2_.currentGame)
               {
                  _loc2_.useWhichLink = _loc2_.gameIconLinks[_loc13_];
                  _loc2_.clip.gameicon.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickGame);
               }
               else
               {
                  _loc2_.clip.gameicon.mouseEnabled = false;
                  _loc2_.clip.gameicon.mouseChildren = false;
               }
            }
            else
            {
               class_6.error("Couldn\'t find game to use: " + _loc5_.getCustomerFirstGame(_loc2_.customerIndex));
               _loc2_.clip.gameicon.gotoAndStop(_loc2_.clip.gameicon.totalFrames);
               _loc2_.clip.gameicon.mouseEnabled = false;
               _loc2_.clip.gameicon.mouseChildren = false;
            }
            if(_loc5_.getCustomerFlipdeckNumber(_loc2_.customerIndex) == 0)
            {
               _loc2_.clip.flipdeck.visible = false;
            }
            else
            {
               if((_loc17_ = String(_loc5_.getCustomerFlipdeckNumber(_loc2_.customerIndex))).length == 1)
               {
                  _loc17_ = "0" + _loc17_;
               }
               _loc2_.clip.flipdeck.visible = true;
               if(_loc2_.shouldShowPlayNow)
               {
                  _loc2_.clip.flipdeck.addEventListener(MouseEvent.MOUSE_DOWN,_loc2_.clickFlipdeck);
                  _loc2_.useWhichFlipdeckLink = "http://www.flipline.com/flipdeck/" + _loc17_;
               }
               else
               {
                  _loc2_.clip.flipdeck.mouseEnabled = false;
                  _loc2_.clip.flipdeck.mouseChildren = false;
                  _loc2_.useWhichFlipdeckLink = "";
               }
            }
            _loc2_.createOrderTicket();
         }
         param1.addChild(_loc2_.clip);
      }
      
      public function clickCoupon(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.coupon.btn.visible = false;
         _loc2_.clip.coupon.checkmark.visible = true;
         _loc2_.gameObj.method_288(_loc2_.customerIndex,_loc2_.finishedGivingCoupon,_loc2_.screen.inMenu);
         _loc2_.screen.removeContextTraining();
         _loc2_.gameObj.var_127.setTrained("givecoupon");
      }
      
      public function finishedGivingCoupon() : void
      {
         var _loc1_:CustomerPage = this;
         if(_loc1_.screen.inMenu)
         {
            _loc1_.screen.showContextTraining("visittomorrow");
         }
         else
         {
            _loc1_.screen.showContextTraining("visittoday");
         }
         _loc1_.gameObj.var_136.recordTagged("coupon");
         try
         {
            _loc1_.gameObj.var_130.api.method_132("gaveCoupon");
         }
         catch(err:Error)
         {
         }
         if(_loc1_.screen.inMenu == false)
         {
            class_6.method_1("(Start of Day - Save Data.)");
            _loc1_.gameObj.var_127.saveData();
         }
      }
      
      public function updateStyleBar() : void
      {
         var _loc1_:CustomerPage = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:CustomerData = _loc1_.gameObj.var_131;
         if(_loc2_.hasAlternateOutfit(_loc1_.customerIndex))
         {
            _loc1_.clip.styleB_btn.visible = true;
            if(_loc2_.getWearingOutfit(_loc1_.customerIndex) == 4 || _loc2_.getWearingOutfit(_loc1_.customerIndex) == 2 && (_loc2_.getHolidayMonth() == 0 || _loc3_.getCustomerHolidayOutfitMonth(_loc1_.customerIndex) != _loc2_.getHolidayMonth()))
            {
               _loc1_.clip.styleB.gotoAndStop(3);
            }
            else
            {
               _loc1_.clip.styleB.gotoAndStop(2);
            }
         }
         else
         {
            _loc1_.clip.styleB_btn.visible = false;
            _loc1_.clip.styleB.gotoAndStop(1);
         }
         if(_loc2_.getWearingOutfit(_loc1_.customerIndex) == 3 || _loc2_.getWearingOutfit(_loc1_.customerIndex) == 1 && (_loc2_.getHolidayMonth() == 0 || _loc3_.getCustomerHolidayOutfitMonth(_loc1_.customerIndex) != _loc2_.getHolidayMonth()))
         {
            _loc1_.clip.styleA.gotoAndStop(3);
         }
         else
         {
            _loc1_.clip.styleA.gotoAndStop(2);
         }
         if(_loc3_.getCustomerHolidayOutfitMonth(_loc1_.customerIndex) > 0 && (!_loc3_.isCloser(_loc1_.customerIndex) || _loc2_.getRank() >= _loc2_.getMinRankForMonth(GameData.MONTH_OCTOBER)))
         {
            if((_loc2_.getWearingOutfit(_loc1_.customerIndex) == 1 || _loc2_.getWearingOutfit(_loc1_.customerIndex) == 2) && _loc2_.getHolidayMonth() == _loc3_.getCustomerHolidayOutfitMonth(_loc1_.customerIndex))
            {
               _loc1_.clip.styleH.gotoAndStop(3);
            }
            else
            {
               _loc1_.clip.styleH.gotoAndStop(2);
            }
         }
         else
         {
            _loc1_.clip.styleH_btn.visible = false;
            _loc1_.clip.styleH.visible = false;
            _loc1_.clip.styleH.gotoAndStop(1);
         }
      }
      
      public function clickStyleButton(param1:MouseEvent) : void
      {
         var whichStyle:Number;
         var didClickHoliday:Boolean;
         var customerHoliday:Number;
         var currentHoliday:Number;
         var isDuringHoliday:Boolean;
         var e:MouseEvent = param1;
         var ob:CustomerPage = this;
         var user:UserData = ob.gameObj.var_127;
         var didChange:Boolean = false;
         var previousValue:Number = user.getWearingOutfit(ob.customerIndex);
         ob.gameObj.var_128.playSound("buttonclick.wav");
         whichStyle = -1;
         didClickHoliday = false;
         if(e.currentTarget == ob.clip.styleA_btn)
         {
            whichStyle = 1;
         }
         else if(e.currentTarget == ob.clip.styleB_btn)
         {
            whichStyle = 2;
         }
         else if(e.currentTarget == ob.clip.styleH_btn)
         {
            whichStyle = 3;
            didClickHoliday = true;
         }
         if(ob.screen.whichContextTraining == "customeroutfit" && (whichStyle == 1 || whichStyle == 2))
         {
            ob.screen.removeContextTraining();
         }
         customerHoliday = ob.gameObj.var_131.getCustomerHolidayOutfitMonth(ob.customerIndex);
         currentHoliday = user.getHolidayMonth();
         isDuringHoliday = false;
         if(currentHoliday > 0 && currentHoliday == customerHoliday)
         {
            isDuringHoliday = true;
         }
         if(whichStyle == 1 && isDuringHoliday)
         {
            user.setWearingOutfit(ob.customerIndex,3);
         }
         else if(whichStyle == 2 && isDuringHoliday)
         {
            user.setWearingOutfit(ob.customerIndex,4);
         }
         else if(whichStyle == 1)
         {
            user.setWearingOutfit(ob.customerIndex,1);
         }
         else if(whichStyle == 2)
         {
            user.setWearingOutfit(ob.customerIndex,2);
         }
         else if(whichStyle == 3)
         {
            if(user.getWearingOutfit(ob.customerIndex) == 3)
            {
               user.setWearingOutfit(ob.customerIndex,1);
            }
            else if(user.getWearingOutfit(ob.customerIndex) == 4)
            {
               user.setWearingOutfit(ob.customerIndex,2);
            }
         }
         ob.buildCustomer(didClickHoliday);
         ob.updateStyleBar();
         ob.clip.flasher.gotoAndPlay(2);
         ob.gameObj.var_128.playSound("takephoto.wav");
         ob.clip.name_txt.text = ob.gameObj.var_131.getCustomerName(ob.customerIndex,true);
         ob.clip.name_txt.setTextFormat(ob.kernFormat);
         try
         {
            if(user.getWearingOutfit(ob.customerIndex) != previousValue)
            {
               ob.gameObj.var_130.api.dispatchEvent(new ValueEvent(ValueEvent.OUTFIT,true,true,ob.customerIndex));
            }
         }
         catch(err:Error)
         {
            class_6.error("Error broadcasting an outfit change: " + err.message);
         }
      }
      
      public function buildCustomer(param1:Boolean = false) : void
      {
         var _loc8_:MovieClip = null;
         var _loc9_:MovieClip = null;
         var _loc10_:MovieClip = null;
         var _loc11_:MovieClip = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc2_:CustomerPage = this;
         _loc2_.clearCustomer();
         _loc2_.customerClip = new customerMC();
         var _loc3_:String = _loc2_.gameObj.var_131.getCustomerClipName(_loc2_.customerIndex);
         _loc2_.gameObj.var_131.buildCustomer(_loc3_,_loc2_.customerClip,param1);
         _loc2_.customerClip.gotoAndStop("portrait");
         try
         {
            _loc12_ = 0;
            while(_loc12_ < _loc2_.customerClip.numChildren)
            {
               if(_loc2_.customerClip.getChildAt(_loc12_) is MovieClip)
               {
                  (_loc8_ = MovieClip(_loc2_.customerClip.getChildAt(_loc12_))).stop();
                  _loc13_ = 0;
                  while(_loc13_ < _loc8_.numChildren)
                  {
                     if(_loc8_.getChildAt(_loc13_) is MovieClip)
                     {
                        (_loc9_ = MovieClip(_loc8_.getChildAt(_loc13_))).stop();
                        _loc14_ = 0;
                        while(_loc14_ < _loc9_.numChildren)
                        {
                           if(_loc9_.getChildAt(_loc14_) is MovieClip)
                           {
                              (_loc10_ = MovieClip(_loc9_.getChildAt(_loc14_))).stop();
                              _loc15_ = 0;
                              while(_loc15_ < _loc10_.numChildren)
                              {
                                 if(_loc10_.getChildAt(_loc15_) is MovieClip)
                                 {
                                    (_loc11_ = MovieClip(_loc10_.getChildAt(_loc15_))).stop();
                                 }
                                 _loc15_++;
                              }
                           }
                           _loc14_++;
                        }
                     }
                     _loc13_++;
                  }
               }
               _loc12_++;
            }
         }
         catch(err:Error)
         {
         }
         0.597;
         _loc2_.customerClip.scaleX = 0.597;
         _loc2_.customerClip.scaleY = 0.597;
         _loc2_.customerClip.x = 32;
         _loc2_.customerClip.y = 44;
         var _loc5_:Rectangle;
         var _loc6_:Number = (_loc5_ = _loc2_.customerClip.getBounds(_loc2_.customerClip)).x * 0.597 + _loc5_.width * 0.597 / 2;
         _loc2_.customerClip.x = 81.5 - _loc6_;
         _loc2_.clip.customerholder.addChild(_loc2_.customerClip);
         var _loc7_:Number;
         if((_loc7_ = _loc2_.gameObj.var_127.getWearingOutfit(_loc2_.customerIndex)) == 3 || _loc7_ == 4)
         {
            class_6.method_1("Build Customer with Outfit " + (_loc7_ - 2) + " (" + _loc7_ + " - IGNORE HOLIDAY).  Force Holiday: " + param1);
         }
         else
         {
            class_6.method_1("Build Customer with Outfit " + _loc7_ + ". Force Holiday: " + param1);
         }
      }
      
      public function clearCustomer() : void
      {
         var ob:CustomerPage = this;
         if(ob.customerClip)
         {
            ob.customerClip.stop();
            try
            {
               ob.customerClip.body.removeChildAt(0);
               ob.customerClip.head.removeChildAt(0);
               ob.customerClip.eyes.removeChildAt(0);
               ob.customerClip.mouth.removeChildAt(0);
               ob.customerClip.neck.removeChildAt(0);
               ob.customerClip.front_shoe.removeChildAt(0);
               ob.customerClip.back_shoe.removeChildAt(0);
               ob.customerClip.fronthand.removeChildAt(0);
               ob.customerClip.backhand.removeChildAt(0);
               ob.customerClip.front_upperarm.removeChildAt(0);
               ob.customerClip.back_upperarm.removeChildAt(0);
               ob.customerClip.front_forearm.removeChildAt(0);
               ob.customerClip.back_forearm.removeChildAt(0);
            }
            catch(err:Error)
            {
               class_6.error("Error removing parts of customer");
            }
            try
            {
               ob.customerClip.hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            try
            {
               ob.customerClip.back_hair.removeChildAt(0);
            }
            catch(err:Error)
            {
            }
            if(ob.customerClip.parent)
            {
               ob.customerClip.parent.removeChild(ob.customerClip);
            }
            ob.customerClip = null;
         }
      }
      
      public function createOrderTicket() : void
      {
         var _loc1_:CustomerPage = this;
         if(_loc1_.customerIndex == 1)
         {
            _loc1_.orderData = _loc1_.gameObj.var_131.getFoodCriticOrder();
            _loc1_.ticketClip = new MovieClip();
            _loc1_.clip.addChild(_loc1_.ticketClip);
            _loc1_.clip.jojoticket.visible = true;
            return;
         }
         _loc1_.orderData = _loc1_.gameObj.var_131.getAvailableOrder(_loc1_.customerIndex);
         _loc1_.clip.jojoticket.visible = false;
         _loc1_.createOrderPanels();
         _loc1_.ticketClip = new ticketMC();
         _loc1_.ticketClip.addChild(_loc1_.panelHolder);
         _loc1_.ticketClip.number_txt.text = "";
         _loc1_.ticketClip.clipper.visible = false;
         _loc1_.ticketClip.buttonMode = true;
         _loc1_.ticketClip.mouseEnabled = true;
         _loc1_.ticketClip.mouseChildren = false;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.panelParts.length)
         {
            _loc1_.panelParts[_loc2_].visible = true;
            _loc2_++;
         }
         _loc1_.panelHolder.cacheAsBitmap = true;
         _loc1_.ticketClip.addChild(_loc1_.panelHolder);
         _loc1_.clip.addChild(_loc1_.ticketClip);
         _loc1_.ticketClip.scaleX = _loc1_.ticketSmallScaleX;
         _loc1_.ticketClip.scaleY = _loc1_.ticketSmallScaleY;
         _loc1_.ticketClip.x = _loc1_.ticketSmallX;
         _loc1_.ticketClip.y = _loc1_.ticketSmallY;
         _loc1_.ticketClip.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTicket);
      }
      
      public function createOrderPanels() : void
      {
         var _loc2_:int = 0;
         var _loc9_:MovieClip = null;
         var _loc10_:MovieClip = null;
         var _loc1_:CustomerPage = this;
         _loc1_.panelHolder = new MovieClip();
         _loc1_.panelParts = new Vector.<MovieClip>();
         0;
         var _loc5_:MovieClip;
         (_loc5_ = new ticket_panel_paper()).gotoAndStop(_loc1_.orderData.paperType);
         var _loc6_:MovieClip;
         (_loc6_ = new ticket_panel_rice()).gotoAndStop(_loc1_.orderData.riceType);
         if(_loc1_.orderData.isFlipped)
         {
            _loc6_.flipicon.visible = true;
            _loc5_.scaleX = -1;
            _loc5_.x = 69;
            _loc5_.y = 230;
            _loc6_.x = -66;
            _loc6_.y = 230;
            _loc1_.panelParts.push(_loc5_);
            _loc1_.panelHolder.addChild(_loc5_);
            _loc5_.visible = false;
            _loc1_.panelParts.push(_loc6_);
            _loc1_.panelHolder.addChild(_loc6_);
            _loc6_.visible = false;
         }
         else
         {
            _loc6_.flipicon.visible = false;
            _loc6_.scaleX = -1;
            _loc6_.x = 69;
            _loc6_.y = 230;
            _loc5_.x = -66;
            _loc5_.y = 230;
            _loc1_.panelParts.push(_loc5_);
            _loc1_.panelHolder.addChild(_loc5_);
            _loc5_.visible = false;
            _loc1_.panelParts.push(_loc6_);
            _loc1_.panelHolder.addChild(_loc6_);
            _loc6_.visible = false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderData.fillings.length)
         {
            (_loc9_ = new ticket_panel_filling()).gotoAndStop(_loc1_.orderData.fillings[_loc2_]);
            _loc9_.x = 0;
            _loc9_.y = 207 - _loc2_ * 36;
            _loc1_.panelParts.push(_loc9_);
            _loc1_.panelHolder.addChild(_loc9_);
            _loc9_.visible = false;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc1_.orderData.toppings.length)
         {
            if(FoodData.isDrop(_loc1_.orderData.toppings[_loc2_]))
            {
               _loc10_ = new ticket_panel_filling();
            }
            else if(FoodData.isSauce(_loc1_.orderData.toppings[_loc2_]))
            {
               _loc10_ = new ticket_panel_sauce();
            }
            else
            {
               _loc10_ = new ticket_panel_shaker();
            }
            _loc10_.gotoAndStop(_loc1_.orderData.toppings[_loc2_]);
            _loc10_.x = 0;
            _loc10_.y = 91 - _loc2_ * 34;
            _loc1_.panelParts.push(_loc10_);
            _loc1_.panelHolder.addChild(_loc10_);
            _loc10_.visible = false;
            _loc2_++;
         }
         var _loc7_:MovieClip;
         (_loc7_ = new ticket_panel_tea()).gotoAndStop(_loc1_.orderData.teaType);
         _loc7_.x = -31;
         _loc7_.y = -10;
         _loc1_.panelParts.push(_loc7_);
         _loc1_.panelHolder.addChild(_loc7_);
         _loc7_.visible = false;
         var _loc8_:MovieClip;
         (_loc8_ = new ticket_panel_bubbles()).gotoAndStop(_loc1_.orderData.bubbleType);
         _loc8_.x = 37;
         _loc8_.y = -10;
         _loc1_.panelParts.push(_loc8_);
         _loc1_.panelHolder.addChild(_loc8_);
         _loc8_.visible = false;
      }
      
      public function rolloverSticker(param1:MouseEvent) : void
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc2_:CustomerPage = this;
         var _loc3_:ChallengeManager = _loc2_.gameObj.var_136;
         var _loc4_:Number = -1;
         if(param1.currentTarget == _loc2_.stickers[0])
         {
            _loc4_ = 0;
         }
         else if(param1.currentTarget == _loc2_.stickers[1])
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.stickers[2])
         {
            _loc4_ = 2;
         }
         if(_loc4_ > -1)
         {
            _loc6_ = String((_loc5_ = _loc2_.gameObj.var_131.getCustomerStickers(_loc2_.customerIndex))[_loc4_]);
            _loc7_ = _loc3_.getChallengeIndexForSticker(_loc6_);
            _loc8_ = "" + (_loc7_ + 1);
            if(_loc7_ + 1 < 10)
            {
               _loc8_ = "00" + _loc8_;
            }
            else if(_loc7_ + 1 < 100)
            {
               _loc8_ = "0" + _loc8_;
            }
            _loc2_.clip.stickerinfo.panel.title_txt.text = _loc8_ + "  " + _loc3_.getChallengeTitle(_loc7_);
            _loc2_.clip.stickerinfo.panel.description_txt.text = _loc3_.getChallengeDescription(_loc7_);
            _loc2_.clip.stickerinfo.panel.tally_txt.text = _loc3_.getBadgeTallyString(_loc7_);
            _loc2_.clip.stickerinfo.panel.newstar.stop();
            _loc2_.clip.stickerinfo.panel.newstar.bg.stop();
            _loc2_.clip.stickerinfo.panel.newstar.visible = false;
            _loc2_.clip.stickerinfo.panel.hilite.alpha = 0;
            if(_loc2_.gameObj.var_127.hasBadge(_loc7_))
            {
               _loc2_.clip.stickerinfo.panel.bg.gotoAndStop(2);
               _loc2_.clip.stickerinfo.panel.title_txt.x = 15;
               _loc2_.clip.stickerinfo.panel.title_txt.textColor = 16745495;
               _loc2_.clip.stickerinfo.panel.checkmark.visible = true;
               _loc2_.clip.stickerinfo.panel.tally_txt.visible = false;
               _loc2_.clip.stickerinfo.pointer.gotoAndStop(2);
            }
            else
            {
               _loc2_.clip.stickerinfo.panel.bg.gotoAndStop(1);
               _loc2_.clip.stickerinfo.panel.title_txt.x = 4;
               _loc2_.clip.stickerinfo.panel.title_txt.textColor = 1992297;
               _loc2_.clip.stickerinfo.panel.checkmark.visible = false;
               _loc2_.clip.stickerinfo.panel.tally_txt.visible = true;
               _loc2_.clip.stickerinfo.pointer.gotoAndStop(1);
            }
            if(_loc3_.shouldLockBadge(_loc7_))
            {
               _loc2_.clip.stickerinfo.panel.title_txt.text = _loc8_ + "  (Hidden Achievement)";
               _loc2_.clip.stickerinfo.panel.title_txt.textColor = 6710886;
               _loc2_.clip.stickerinfo.panel.description_txt.text = "You don\'t have everything available to earn this Sticker yet!";
               _loc2_.clip.stickerinfo.panel.description_txt.textColor = 10066329;
               _loc2_.clip.stickerinfo.panel.tally_txt.text = "";
            }
            if(_loc4_ == 0)
            {
               _loc2_.clip.stickerinfo.pointer.x = -58;
            }
            else if(_loc4_ == 1)
            {
               _loc2_.clip.stickerinfo.pointer.x = 1;
            }
            else if(_loc4_ == 2)
            {
               _loc2_.clip.stickerinfo.pointer.x = 60;
            }
            _loc2_.isOverSticker = true;
            if(_loc2_.clip.stickerinfo.hasEventListener(Event.ENTER_FRAME) == false)
            {
               _loc2_.clip.stickerinfo.addEventListener(Event.ENTER_FRAME,_loc2_.fadeSticker);
            }
         }
      }
      
      public function rolloutSticker(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         _loc2_.isOverSticker = false;
         if(_loc2_.clip.stickerinfo.hasEventListener(Event.ENTER_FRAME) == false)
         {
            _loc2_.clip.stickerinfo.addEventListener(Event.ENTER_FRAME,_loc2_.fadeSticker);
         }
      }
      
      public function fadeSticker(param1:Event) : void
      {
         var _loc2_:CustomerPage = this;
         if(_loc2_.isOverSticker)
         {
            _loc2_.clip.stickerinfo.alpha += 0.2;
            if(_loc2_.clip.stickerinfo.alpha >= 1)
            {
               _loc2_.clip.stickerinfo.alpha = 1;
               _loc2_.clip.stickerinfo.removeEventListener(Event.ENTER_FRAME,_loc2_.fadeSticker);
            }
         }
         else
         {
            _loc2_.clip.stickerinfo.alpha -= 0.2;
            if(_loc2_.clip.stickerinfo.alpha <= 0)
            {
               _loc2_.clip.stickerinfo.alpha = 0;
               _loc2_.clip.stickerinfo.removeEventListener(Event.ENTER_FRAME,_loc2_.fadeSticker);
            }
         }
      }
      
      public function clickGiftBox(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.gift_btn.mouseEnabled = false;
         _loc2_.clip.gift_btn.mouseChilidren = false;
         _loc2_.gameObj.method_249(_loc2_.customerIndex,_loc2_.finishedGivingOutfit);
         _loc2_.screen.removeContextTraining();
         _loc2_.gameObj.var_127.setTrained("stickergivegift");
         _loc2_.gameObj.var_127.setTrained("stickersort");
         _loc2_.gameObj.var_127.setTrained("stickeropencustomers");
         _loc2_.gameObj.var_127.setTrained("stickeropenmenu");
      }
      
      public function finishedGivingOutfit() : void
      {
         var i:int;
         var ob:CustomerPage = this;
         ob.buildCustomer();
         ob.updateStyleBar();
         ob.clip.name_txt.text = ob.gameObj.var_131.getCustomerName(ob.customerIndex,true);
         ob.clip.name_txt.setTextFormat(ob.kernFormat);
         ob.clip.gift_btn.visible = false;
         ob.clip.gift_btn.stop();
         ob.clip.message.visible = false;
         i = 0;
         while(i < ob.stickers.length)
         {
            ob.stickers[i].visible = true;
            i++;
         }
         ob.screen.populateCustomerThumbs();
         ob.screen.adjustIcons();
         ob.screen.clip.fader.gotoAndPlay("fadein");
         try
         {
            ob.gameObj.var_130.api.dispatchEvent(new ValueEvent(ValueEvent.OUTFIT,true,true,ob.customerIndex));
         }
         catch(err:Error)
         {
            class_6.error("Error broadcasting an outfit change: " + err.message);
         }
         if(ob.gameObj.var_127.hasTrained("customeroutfit") == false)
         {
            ob.screen.showContextTraining("customeroutfit");
            ob.gameObj.var_127.setTrained("customeroutfit");
         }
         if(ob.screen.inMenu == false)
         {
            class_6.method_1("(Start of Day - Save Data.)");
            ob.gameObj.var_127.saveData();
         }
      }
      
      public function rolloverGiftBox(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         _loc2_.clip.gift_btn.rolloverMC.visible = true;
      }
      
      public function rolloutGiftBox(param1:MouseEvent) : void
      {
         var _loc2_:CustomerPage = this;
         _loc2_.clip.gift_btn.rolloverMC.visible = false;
      }
      
      public function destroy() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:CustomerPage = this;
         _loc1_.kernFormat = null;
         _loc1_.clearCustomer();
         if(!_loc1_.isBlank)
         {
            _loc1_.clip.styleA_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickStyleButton);
            _loc1_.clip.styleB_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickStyleButton);
            _loc1_.clip.styleH_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickStyleButton);
            _loc1_.clip.gameicon.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickGame);
            _loc1_.clip.flipdeck.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickFlipdeck);
            _loc1_.clip.stickerinfo.removeEventListener(Event.ENTER_FRAME,_loc1_.fadeSticker);
            _loc1_.clip.gift_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickGiftBox);
            _loc1_.clip.gift_btn.removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverGiftBox);
            _loc1_.clip.gift_btn.removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutGiftBox);
            _loc1_.clip.coupon.btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickCoupon);
            if(Boolean(_loc1_.stickers) && _loc1_.stickers.length > 0)
            {
               _loc2_ = int(_loc1_.stickers.length - 1);
               while(_loc2_ >= 0)
               {
                  if(_loc1_.stickers[_loc2_].parent)
                  {
                     _loc1_.stickers[_loc2_].parent.removeChild(_loc1_.stickers[_loc2_]);
                  }
                  _loc1_.stickers[_loc2_].removeEventListener(MouseEvent.ROLL_OVER,_loc1_.rolloverSticker);
                  _loc1_.stickers[_loc2_].removeEventListener(MouseEvent.ROLL_OUT,_loc1_.rolloutSticker);
                  _loc1_.stickers[_loc2_] = null;
                  _loc1_.stickers.splice(_loc2_,1);
                  _loc2_--;
               }
            }
            _loc1_.stickers = null;
            if(Boolean(_loc1_.panelParts) && _loc1_.panelParts.length > 0)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc1_.panelParts.length)
               {
                  if(_loc1_.panelParts[_loc3_].parent)
                  {
                     _loc1_.panelParts[_loc3_].parent.removeChild(_loc1_.panelParts[_loc3_]);
                  }
                  _loc1_.panelParts[_loc3_] = null;
                  _loc3_++;
               }
            }
            _loc1_.panelParts = null;
            if(Boolean(_loc1_.panelHolder) && Boolean(_loc1_.panelHolder.parent))
            {
               _loc1_.panelHolder.parent.removeChild(_loc1_.panelHolder);
            }
            _loc1_.panelHolder = null;
            if(_loc1_.ticketClip)
            {
               if(_loc1_.ticketClip.parent)
               {
                  _loc1_.ticketClip.parent.removeChild(_loc1_.ticketClip);
               }
               _loc1_.ticketClip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateTicket);
               _loc1_.ticketClip.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickTicket);
               _loc1_.ticketClip = null;
            }
            _loc1_.orderData = null;
         }
         if(Boolean(_loc1_.clip) && Boolean(_loc1_.clip.parent))
         {
            _loc1_.clip.parent.removeChild(_loc1_.clip);
         }
         _loc1_.screen = null;
         _loc1_.gameObj = null;
         _loc1_.clip = null;
      }
   }
}
