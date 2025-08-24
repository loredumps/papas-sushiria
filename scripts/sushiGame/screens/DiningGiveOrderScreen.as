package sushiGame.screens
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.events.ValueEvent;
   import sushiGame.models.*;
   
   public class DiningGiveOrderScreen extends GiveOrderScreen
   {
       
      
      public var sittingModel:MovieClip = null;
      
      public var buddyModel:MovieClip = null;
      
      public function DiningGiveOrderScreen(param1:class_5)
      {
         super(param1);
         param1.var_130.api.addEventListener(ValueEvent.OUTFIT,this.outfitChanged);
      }
      
      override public function getCustomerReactionNumber(param1:String) : Number
      {
         this;
         return 1;
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:DiningGiveOrderScreen = this;
         _loc1_.clip = new giveOrderDiningMC();
         _loc1_.clip.bubbles.stop();
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.worker_holder,_loc1_.gameObj.var_143,209,64,1,false,true);
         _loc1_.clip.ticketmeter.bar.mask = _loc1_.clip.ticketmeter.masker;
         _loc1_.clip.ticketmeter.bar.scaleX = 0;
         _loc1_.clip.ticketmeter.ball1.gotoAndStop(1);
         _loc1_.clip.ticketmeter.ball2.gotoAndStop(1);
         _loc1_.clip.ticketmeter.ball3.gotoAndStop(1);
      }
      
      override public function activateScreen() : void
      {
         var _loc1_:DiningGiveOrderScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         var _loc2_:SushiRoll = _loc1_.gameObj.var_137.currentOrder;
         _loc2_.moveToGiveDiningOrder(_loc1_.clip.customer_holder);
         _loc1_.currentCustomer = _loc1_.gameObj.var_133.getWaitingCustomer(_loc2_.attachedTicket.customerType);
         _loc1_.setupCustomerModel(_loc1_.gameObj.var_131.getCustomerClipName(currentCustomer.customerType));
         _loc1_.clip.customer_holder.addChild(_loc1_.sittingModel);
         _loc1_.sittingModel.x = 330;
         _loc1_.sittingModel.y = 110;
         _loc1_.sittingModel.gotoAndPlay("look");
         _loc1_.setupBuddy();
         _loc1_.clip.coffee.visible = false;
         _loc1_.clip.coffee.stop();
         _loc1_.shouldAnimateMeter = false;
         _loc1_.shouldShowWorkerReaction = false;
         _loc1_.clip.tipjar.gotoAndStop(1);
         _loc1_.clip.tips.gotoAndStop(1);
         _loc1_.clip.starburst.gotoAndStop(1);
         _loc1_.adjustJarCoins();
         _loc1_.startPresentation();
         _loc1_.gameObj.var_128.switchMusic("none");
         _loc1_.drumrollSound = _loc1_.gameObj.var_128.playMusicClip("giveorder_drumroll.wav");
         _loc1_.isActive = true;
      }
      
      public function setupBuddy() : void
      {
         var _loc3_:String = null;
         var _loc1_:DiningGiveOrderScreen = this;
         var _loc2_:Number = _loc1_.currentCustomer.diningBuddy;
         if(_loc2_ > -1)
         {
            _loc3_ = _loc1_.gameObj.var_131.getCustomerClipName(_loc2_);
            _loc1_.setupCustomerModel(_loc3_,true);
            _loc1_.clip.customer2_holder.addChild(_loc1_.buddyModel);
            _loc1_.buddyModel.visible = true;
            _loc1_.buddyModel.scaleX = -1;
            _loc1_.buddyModel.x = 139;
            _loc1_.buddyModel.y = 140;
            _loc1_.buddyModel.gotoAndPlay("sitbuddy");
            _loc1_.clip.coffeebuddy.visible = false;
            _loc1_.clip.coffeebuddy.stop();
         }
         else
         {
            if(_loc1_.buddyModel)
            {
               _loc1_.buddyModel.visible = false;
            }
            _loc1_.clip.coffeebuddy.visible = false;
            _loc1_.clip.coffeebuddy.stop();
         }
      }
      
      public function setupCustomerModel(param1:String, param2:Boolean = false) : void
      {
         var _loc4_:MovieClip = null;
         var _loc3_:DiningGiveOrderScreen = this;
         if(param2)
         {
            if(_loc3_.buddyModel != null)
            {
               _loc3_.destroyCustomerModel(_loc3_.buddyModel);
               if(_loc3_.clip.customer2_holder.contains(_loc3_.buddyModel))
               {
                  _loc3_.clip.customer2_holder.removeChild(_loc3_.buddyModel);
               }
               _loc3_.buddyModel = null;
            }
            _loc3_.buddyModel = new customerDiningMC();
            _loc4_ = _loc3_.buddyModel;
         }
         else
         {
            if(_loc3_.sittingModel != null)
            {
               _loc3_.destroyCustomerModel(_loc3_.sittingModel);
               if(_loc3_.clip.customer_holder.contains(_loc3_.sittingModel))
               {
                  _loc3_.clip.customer_holder.removeChild(_loc3_.sittingModel);
               }
               _loc3_.sittingModel = null;
            }
            _loc3_.sittingModel = new customerDiningMC();
            _loc4_ = _loc3_.sittingModel;
         }
         _loc3_.gameObj.var_131.buildCustomer(param1,_loc4_);
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
      }
      
      override public function initStationUpgrades() : void
      {
         var _loc1_:DiningGiveOrderScreen = this;
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
         _loc1_.backdropBitmap.x = -24;
         _loc1_.backdropBitmap.y = -40;
         _loc1_.clip.table1.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.clip.table2.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.clip.table3.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.clip.trim1.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.clip.trim2.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.clip.trim3.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.clip.trim4.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.worker.updateModelLook();
      }
      
      override public function showCustomerReaction() : void
      {
         var _loc1_:DiningGiveOrderScreen = this;
         _loc1_.sittingModel.gotoAndPlay("look" + _loc1_.customerReaction + "1");
         _loc1_.gameObj.var_136.recordTagged("diningroom");
         if(_loc1_.buddyModel)
         {
            if(_loc1_.customerReaction == "overjoyed" || _loc1_.customerReaction == "happy" || _loc1_.wasFriendlyFillup || _loc1_.wasTeaParty)
            {
               _loc1_.buddyModel.gotoAndPlay("buddyhappy");
            }
            else if(_loc1_.customerReaction == "decent" || _loc1_.customerReaction == "worried")
            {
               _loc1_.buddyModel.gotoAndPlay("buddyok");
            }
            else
            {
               _loc1_.buddyModel.gotoAndPlay("buddyangry");
            }
         }
      }
      
      override public function showWorkerReaction() : void
      {
         var _loc1_:DiningGiveOrderScreen = this;
         var _loc2_:String = _loc1_.customerReaction;
         if(_loc2_ == "overjoyed" || _loc2_ == "happy")
         {
            _loc1_.worker.playAnimation("score_happy");
         }
         else if(_loc2_ == "decent" || _loc2_ == "worried")
         {
            _loc1_.worker.playAnimation("score_ok");
         }
         else
         {
            _loc1_.worker.playAnimation("score_sad");
         }
      }
      
      override protected function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:DiningGiveOrderScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Bitmap = null;
         var _loc5_:MovieClip = new nowindowBackdropMC();
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
         _loc5_.holder.wallparts.mask = _loc5_.holder.wallmask;
         _loc5_.holder.floorparts.mask = _loc5_.holder.floormask;
         var _loc6_:BitmapData;
         (_loc6_ = new BitmapData(706,552,true,0)).draw(_loc5_,null,null,null,new Rectangle(0,0,706,552));
         _loc3_ = new Bitmap(_loc6_);
         _loc5_ = null;
         return _loc3_;
      }
      
      override public function destroy() : void
      {
         var _loc1_:DiningGiveOrderScreen = this;
         _loc1_.kernFormat = null;
         _loc1_.gameObj.var_130.api.removeEventListener(ValueEvent.OUTFIT,_loc1_.outfitChanged);
         if(_loc1_.sittingModel != null)
         {
            _loc1_.destroyCustomerModel(_loc1_.sittingModel);
            if(_loc1_.clip.customer_holder.contains(_loc1_.sittingModel))
            {
               _loc1_.clip.customer_holder.removeChild(_loc1_.sittingModel);
            }
            _loc1_.sittingModel = null;
         }
         if(_loc1_.buddyModel != null)
         {
            _loc1_.destroyCustomerModel(_loc1_.buddyModel);
            if(_loc1_.clip.customer2_holder.contains(_loc1_.buddyModel))
            {
               _loc1_.clip.customer2_holder.removeChild(_loc1_.buddyModel);
            }
            _loc1_.buddyModel = null;
         }
         super.destroy();
      }
      
      override public function getClothingBonus() : Number
      {
         var _loc1_:DiningGiveOrderScreen = this;
         return Math.round(_loc1_.extraTipForHolidaySpirit * _loc1_.gameObj.var_127.getClothingHolidaySpirit(true));
      }
      
      override public function getWorkerClothingTags() : Array
      {
         var _loc1_:DiningGiveOrderScreen = this;
         return _loc1_.gameObj.var_143.getClothingTags();
      }
      
      override public function getOtherScreen() : GiveOrderScreen
      {
         var _loc1_:GiveOrderScreen = this;
         class_6.method_1("(with Main Give Order)");
         return _loc1_.gameObj.var_188;
      }
      
      public function outfitChanged(param1:ValueEvent) : void
      {
         var currAnimation:String = null;
         var buddyAnimation:String = null;
         var e:ValueEvent = param1;
         var screen:DiningGiveOrderScreen = this;
         try
         {
            if(screen.isActive)
            {
               if(screen.currentCustomer != null && e.value == screen.currentCustomer.customerType)
               {
                  currAnimation = screen.sittingModel.currentLabel;
                  screen.setupCustomerModel(screen.gameObj.var_131.getCustomerClipName(currentCustomer.customerType));
                  screen.clip.customer_holder.addChild(screen.sittingModel);
                  screen.sittingModel.x = 330;
                  screen.sittingModel.y = 110;
                  screen.sittingModel.gotoAndPlay(currAnimation);
               }
               if(screen.currentCustomer != null && e.value == screen.currentCustomer.diningBuddy)
               {
                  buddyAnimation = screen.buddyModel.currentLabel;
                  screen.setupBuddy();
                  screen.buddyModel.gotoAndPlay(buddyAnimation);
               }
            }
         }
         catch(err:Error)
         {
            class_6.error("Error changing outfits on DiningGiveOrderScreen: " + err.message);
         }
      }
   }
}
