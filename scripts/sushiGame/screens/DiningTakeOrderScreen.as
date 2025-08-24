package sushiGame.screens
{
   import flash.display.*;
   import flash.geom.Rectangle;
   import package_2.class_6;
   import package_4.*;
   import sushiGame.data.UserData;
   import sushiGame.events.ValueEvent;
   import sushiGame.managers.*;
   import sushiGame.models.Worker;
   
   public class DiningTakeOrderScreen extends TakeOrderScreen
   {
       
      
      public var sittingModel:MovieClip = null;
      
      public var buddyModel:MovieClip = null;
      
      public function DiningTakeOrderScreen(param1:class_5)
      {
         super(param1);
         param1.var_130.api.addEventListener(ValueEvent.OUTFIT,this.outfitChanged);
      }
      
      override public function setupScreen() : void
      {
         var _loc1_:DiningTakeOrderScreen = this;
         _loc1_.clip = new takeOrderDiningMC();
         _loc1_.clip.bubble.clip.gotoAndStop(1);
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip.worker_holder,_loc1_.gameObj.var_143,209,64,1,false,true);
         _loc1_.workerStartLabel = "startplaceorder";
      }
      
      public function setupBuddy() : void
      {
         var _loc3_:String = null;
         var _loc1_:DiningTakeOrderScreen = this;
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
         var _loc3_:DiningTakeOrderScreen = this;
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
      
      override public function initStationUpgrades() : void
      {
         var _loc1_:DiningTakeOrderScreen = this;
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
      
      override public function activateScreen() : void
      {
         var _loc1_:DiningTakeOrderScreen = this;
         if(!_loc1_.gameObj.var_139.contains(_loc1_.clip))
         {
            _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         }
         _loc1_.currentCustomer = _loc1_.gameObj.var_133.orderline[0];
         _loc1_.setupCustomerModel(_loc1_.gameObj.var_131.getCustomerClipName(currentCustomer.customerType));
         _loc1_.currentCustomer.moveToDiningTakeOrder();
         _loc1_.clip.customer_holder.addChild(_loc1_.sittingModel);
         _loc1_.sittingModel.x = 330;
         _loc1_.sittingModel.y = 110;
         _loc1_.sittingModel.gotoAndStop("sit");
         _loc1_.setupBuddy();
         _loc1_.clip.coffee.visible = false;
         _loc1_.clip.coffee.stop();
         _loc1_.initializeOrder();
         _loc1_.timeActivated = _loc1_.gameObj.controls.gameplayTimer;
         _loc1_.gameObj.var_128.switchMusic("order");
         _loc1_.isActive = true;
      }
      
      override public function destroy() : void
      {
         var _loc1_:DiningTakeOrderScreen = this;
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
      
      override protected function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:DiningTakeOrderScreen = this;
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
      
      override public function startCustomerAnimation() : void
      {
         var _loc1_:DiningTakeOrderScreen = this;
         if(_loc1_.whichStep == 0)
         {
            _loc1_.sittingModel.gotoAndPlay("takeorder");
         }
      }
      
      override public function finishCustomerAnimation() : void
      {
         var _loc1_:DiningTakeOrderScreen = this;
         _loc1_.sittingModel.gotoAndPlay("sit");
      }
      
      public function outfitChanged(param1:ValueEvent) : void
      {
         var currAnimation:String = null;
         var buddyAnimation:String = null;
         var e:ValueEvent = param1;
         var screen:DiningTakeOrderScreen = this;
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
