package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.getDefinitionByName;
   import package_2.*;
   import package_4.*;
   import sushiGame.data.*;
   import sushiGame.models.Worker;
   
   public class ParadeScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var didStart:Boolean = false;
      
      public var lastTime:Number = 0;
      
      public var goldCustomerIDs:Array;
      
      public var silverCustomerIDs:Array;
      
      public var bronzeCustomerIDs:Array;
      
      public var noneCustomerIDs:Array;
      
      public var goldSetsShown:Number = 0;
      
      public var silverSetsShown:Number = 0;
      
      public var bronzeSetsShown:Number = 0;
      
      public var foodiniCustomerID:Number = -1;
      
      public var closerCustomerIDs:Array;
      
      public var paloozaCustomerIDs:Array;
      
      public var floatCustomerIDs_papalouie:Array;
      
      public var floatCustomerIDs_pizzeria:Array;
      
      public var floatCustomerIDs_burgeria:Array;
      
      public var floatCustomerIDs_tacomia:Array;
      
      public var floatCustomerIDs_freezeria:Array;
      
      public var floatCustomerIDs_pancakeria:Array;
      
      public var floatCustomerIDs_wingeria:Array;
      
      public var floatCustomerIDs_romano:Array;
      
      public var floatCustomerIDs_hotdoggeria:Array;
      
      public var floatCustomerIDs_cupcakeria:Array;
      
      public var floatCustomerIDs_pastaria:Array;
      
      public var floatCustomerIDs_donuteria:Array;
      
      public var floatCustomerIDs_cheeseria:Array;
      
      public var floatCustomerIDs_bakeria:Array;
      
      public var floatCustomerIDs_sushiria:Array;
      
      public var whichOrder:Number = -1;
      
      public var paradeOrder:Array;
      
      public var walkSpeed:Number = 2;
      
      public var carSpeed:Number = 3;
      
      public var movingParts:Array;
      
      public var movingPartsType:Array;
      
      public var startX:Number = -20;
      
      public var carStartY:Number = 335;
      
      public var customerStartY:Number = 268;
      
      public var customerSpacingY:Number = 13;
      
      public var customerScale:Number = 0.21;
      
      public var fromButton:Boolean = false;
      
      public var workers:Vector.<Worker>;
      
      public var parkedCars:Vector.<MovieClip> = null;
      
      public function ParadeScreen(param1:class_5, param2:Boolean)
      {
         this.goldCustomerIDs = [];
         this.silverCustomerIDs = [];
         this.bronzeCustomerIDs = [];
         this.noneCustomerIDs = [];
         this.closerCustomerIDs = [];
         this.paloozaCustomerIDs = [];
         this.floatCustomerIDs_papalouie = [];
         this.floatCustomerIDs_pizzeria = [];
         this.floatCustomerIDs_burgeria = [];
         this.floatCustomerIDs_tacomia = [];
         this.floatCustomerIDs_freezeria = [];
         this.floatCustomerIDs_pancakeria = [];
         this.floatCustomerIDs_wingeria = [];
         this.floatCustomerIDs_romano = [];
         this.floatCustomerIDs_hotdoggeria = [];
         this.floatCustomerIDs_cupcakeria = [];
         this.floatCustomerIDs_pastaria = [];
         this.floatCustomerIDs_donuteria = [];
         this.floatCustomerIDs_cheeseria = [];
         this.floatCustomerIDs_bakeria = [];
         this.floatCustomerIDs_sushiria = [];
         this.paradeOrder = ["foodini","sushiria","closer","pizzeria","gold","burgeria","silver","tacomia","bronze","freezeria","palooza","romano","pancakeria","wingeria","hotdoggeria","cupcakeria","pastaria","donuteria","cheeseria","bakeria","papalouie"];
         this.movingParts = [];
         this.movingPartsType = [];
         super();
         var _loc3_:ParadeScreen = this;
         _loc3_.gameObj = param1;
         _loc3_.fromButton = param2;
         _loc3_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:ParadeScreen = this;
         _loc1_.clip = new paradeScreenMC();
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         var _loc2_:Number = _loc1_.gameObj.var_127.getHolidayMonth();
         class_6.method_1("Month?: " + _loc2_);
         if(_loc2_ == 0)
         {
            _loc2_ = 13;
         }
         var _loc3_:Number = _loc2_ * 2 - 1;
         _loc1_.clip.bg.gotoAndStop(_loc3_);
         _loc1_.clip.bg.opaqueBackground = 16777215;
         _loc1_.clip.bg.cacheAsBitmap = true;
         _loc1_.clip.bg.mouseEnabled = false;
         _loc1_.clip.bg.mouseChildren = false;
         _loc1_.clip.fg.gotoAndStop(_loc3_);
         _loc1_.clip.fg.cacheAsBitmap = true;
         _loc1_.clip.fg.mouseEnabled = false;
         _loc1_.clip.fg.mouseChildren = false;
         _loc1_.workers = new Vector.<Worker>();
         _loc1_.setupCustomerGroups();
         _loc1_.releaseNextGroup();
         _loc1_.didStart = true;
         _loc1_.clip.backtogame_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickBackToGame);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         if(_loc1_.paradeOrder.indexOf("papalouie") > -1)
         {
            _loc1_.clip.message.visible = false;
         }
         else
         {
            _loc1_.clip.message.visible = true;
         }
         _loc1_.gameObj.var_128.switchMusic("title");
         if(_loc1_.fromButton == false)
         {
            _loc1_.gameObj.var_127.didShowParade = true;
         }
      }
      
      public function clickBackToGame(param1:MouseEvent) : void
      {
         var _loc2_:ParadeScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.fader.gotoAndPlay("fadeout");
         _loc2_.clip.backtogame_btn.visible = false;
      }
      
      public function updateScreen(param1:Event = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         var _loc2_:ParadeScreen = this;
         if(_loc2_.didStart)
         {
            _loc3_ = int(_loc2_.movingParts.length - 1);
            while(_loc3_ >= 0)
            {
               _loc4_ = _loc2_.movingParts[_loc3_];
               if(_loc2_.movingPartsType[_loc3_] == "car" || _loc2_.movingPartsType[_loc3_] == "carmain")
               {
                  _loc4_.x += _loc2_.carSpeed;
               }
               else
               {
                  _loc4_.x += _loc2_.walkSpeed;
               }
               if((_loc2_.movingPartsType[_loc3_] == "car" || _loc2_.movingPartsType[_loc3_] == "carmain") && _loc4_.x - _loc4_.width > 660)
               {
                  try
                  {
                     _loc2_.clearCustomer(_loc4_.customer0);
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     _loc2_.clearCustomer(_loc4_.customer1);
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     _loc2_.clearCustomer(_loc4_.customer2);
                  }
                  catch(err:Error)
                  {
                  }
                  try
                  {
                     _loc2_.clearCustomer(_loc4_.customer3);
                  }
                  catch(err:Error)
                  {
                  }
                  _loc2_.clip.holder.removeChild(_loc4_);
                  _loc2_.movingParts.splice(_loc3_,1);
                  _loc2_.movingPartsType.splice(_loc3_,1);
                  if(_loc2_.whichOrder == _loc2_.paradeOrder.length)
                  {
                     _loc2_.clip.fader.gotoAndPlay("fadeout");
                  }
               }
               else if((_loc2_.movingPartsType[_loc3_] == "customer" || _loc2_.movingPartsType[_loc3_] == "customermain") && _loc4_.x - _loc4_.width / 2 > 660)
               {
                  _loc2_.clearCustomer(_loc4_);
                  _loc2_.clip.holder.removeChild(_loc4_);
                  _loc2_.movingParts.splice(_loc3_,1);
                  _loc2_.movingPartsType.splice(_loc3_,1);
               }
               else if(_loc2_.movingPartsType[_loc3_] == "customermain" && _loc4_.x > 500)
               {
                  _loc2_.releaseNextGroup();
                  _loc2_.movingPartsType[_loc3_] = "customer";
               }
               else if(_loc2_.movingPartsType[_loc3_] == "customermain" && _loc2_.whichOrder == 0 && _loc4_.x > 320)
               {
                  _loc2_.releaseNextGroup();
                  _loc2_.movingPartsType[_loc3_] = "customer";
               }
               else if(_loc2_.movingPartsType[_loc3_] == "carmain" && _loc4_.x - _loc4_.width / 2 > 500)
               {
                  _loc2_.releaseNextGroup();
                  _loc2_.movingPartsType[_loc3_] = "car";
               }
               _loc3_--;
            }
            if(_loc2_.clip.fader.currentFrame == _loc2_.clip.fader.totalFrames)
            {
               _loc2_.didStart = false;
               if(_loc2_.fromButton)
               {
                  _loc2_.gameObj.method_118();
               }
               else
               {
                  _loc2_.gameObj.method_134();
               }
               _loc2_.gameObj.method_215();
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:ParadeScreen = this;
         _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.updateScreen);
         _loc1_.clip.backtogame_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickBackToGame);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.workers.length)
         {
            _loc1_.workers[_loc2_].destroy();
            _loc1_.workers[_loc2_] = null;
            _loc2_++;
         }
         _loc1_.workers = null;
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function releaseNextGroup() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc4_:MovieClip = null;
         var _loc5_:Class = null;
         var _loc6_:MovieClip = null;
         var _loc7_:Boolean = false;
         var _loc8_:Worker = null;
         var _loc9_:Worker = null;
         var _loc10_:Class = null;
         var _loc11_:MovieClip = null;
         var _loc12_:Array = null;
         var _loc13_:Boolean = false;
         var _loc14_:Number = NaN;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc17_:MovieClip = null;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Array = null;
         var _loc21_:MovieClip = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc1_:ParadeScreen = this;
         if(!(_loc1_.paradeOrder[_loc1_.whichOrder] == "gold" && _loc1_.goldSetsShown < _loc1_.goldCustomerIDs.length))
         {
            if(!(_loc1_.paradeOrder[_loc1_.whichOrder] == "silver" && _loc1_.silverSetsShown < _loc1_.silverCustomerIDs.length))
            {
               if(!(_loc1_.paradeOrder[_loc1_.whichOrder] == "bronze" && _loc1_.bronzeSetsShown < _loc1_.bronzeCustomerIDs.length))
               {
                  ++_loc1_.whichOrder;
               }
            }
         }
         if(_loc1_.whichOrder < _loc1_.paradeOrder.length)
         {
            _loc3_ = String(_loc1_.paradeOrder[_loc1_.whichOrder]);
            if(_loc3_ == "foodini")
            {
               _loc4_ = new customerParadeMC();
               _loc1_.buildCustomer(_loc1_.foodiniCustomerID,_loc4_);
               _loc4_.scaleX = _loc1_.customerScale * -1;
               _loc4_.scaleY = _loc1_.customerScale;
               _loc4_.x = _loc1_.startX;
               _loc4_.y = _loc1_.customerStartY;
               _loc4_.gotoAndPlay("walkbaton");
               _loc1_.clip.holder.addChild(_loc4_);
               _loc1_.movingParts.push(_loc4_);
               _loc1_.movingPartsType.push("customermain");
            }
            else if(_loc3_ == "sushiria")
            {
               _loc6_ = new (_loc5_ = getDefinitionByName("parade_car_" + _loc3_) as Class)() as MovieClip;
               _loc7_ = false;
               (_loc8_ = new Worker(_loc1_.gameObj,_loc6_.customer0,_loc1_.gameObj.workerData,0,0,1)).playAnimation("stand");
               _loc1_.workers.push(_loc8_);
               if(_loc1_.gameObj.var_127.didCreateWaiter)
               {
                  (_loc9_ = new Worker(_loc1_.gameObj,_loc6_.customer1,_loc1_.gameObj.var_143,0,0,1)).playAnimation("stand");
                  _loc1_.workers.push(_loc9_);
               }
               _loc6_.customer0.stop();
               _loc6_.customer1.stop();
               _loc6_.x = _loc1_.startX;
               _loc6_.y = _loc1_.carStartY;
               _loc1_.clip.holder.addChild(_loc6_);
               _loc1_.movingParts.push(_loc6_);
               _loc1_.movingPartsType.push("carmain");
            }
            else if(_loc3_ == "papalouie" || _loc3_ == "pizzeria" || _loc3_ == "burgeria" || _loc3_ == "tacomia" || _loc3_ == "freezeria" || _loc3_ == "pancakeria" || _loc3_ == "romano" || _loc3_ == "wingeria" || _loc3_ == "hotdoggeria" || _loc3_ == "cupcakeria" || _loc3_ == "pastaria" || _loc3_ == "donuteria" || _loc3_ == "cheeseria" || _loc3_ == "bakeria")
            {
               _loc11_ = new (_loc10_ = getDefinitionByName("parade_car_" + _loc3_) as Class)() as MovieClip;
               _loc12_ = _loc1_["floatCustomerIDs_" + _loc3_];
               _loc13_ = false;
               _loc2_ = 0;
               while(_loc2_ < _loc12_.length)
               {
                  _loc1_.buildCustomer(_loc12_[_loc2_],_loc11_["customer" + _loc2_]);
                  if(_loc3_ == "papalouie")
                  {
                     _loc11_["customer" + _loc2_].gotoAndPlay("standwave0");
                  }
                  else if(_loc3_ == "pizzeria")
                  {
                     _loc11_["customer" + _loc2_].gotoAndPlay("stand");
                  }
                  else if(Math.random() > 0.6 && (_loc2_ == 0 || _loc2_ >= 1 && _loc13_))
                  {
                     _loc11_["customer" + _loc2_].gotoAndPlay("stand");
                  }
                  else
                  {
                     _loc14_ = Math.round(Math.random() * 3);
                     _loc11_["customer" + _loc2_].gotoAndPlay("standwave" + _loc14_);
                     _loc13_ = true;
                  }
                  _loc2_++;
               }
               _loc11_.x = _loc1_.startX;
               _loc11_.y = _loc1_.carStartY;
               _loc1_.clip.holder.addChild(_loc11_);
               _loc1_.movingParts.push(_loc11_);
               _loc1_.movingPartsType.push("carmain");
            }
            else if(_loc3_ == "gold" || _loc3_ == "bronze" || _loc3_ == "silver")
            {
               _loc15_ = _loc1_[_loc3_ + "CustomerIDs"];
               _loc16_ = [];
               if(_loc3_ == "gold")
               {
                  _loc16_ = _loc15_[_loc1_.goldSetsShown];
               }
               else if(_loc3_ == "silver")
               {
                  _loc16_ = _loc15_[_loc1_.silverSetsShown];
               }
               else if(_loc3_ == "bronze")
               {
                  _loc16_ = _loc15_[_loc1_.bronzeSetsShown];
               }
               _loc2_ = 0;
               while(_loc2_ < _loc16_.length)
               {
                  _loc17_ = new customerParadeMC();
                  _loc1_.buildCustomer(_loc16_[_loc2_],_loc17_);
                  _loc17_.scaleX = _loc1_.customerScale * -1;
                  _loc17_.scaleY = _loc1_.customerScale;
                  _loc17_.x = _loc1_.startX;
                  _loc17_.y = _loc1_.customerStartY;
                  _loc18_ = Math.random();
                  _loc19_ = Math.random();
                  if(_loc2_ == 0 && (_loc3_ == "bronze" || _loc3_ == "silver" || _loc3_ == "gold" || _loc3_ == "palooza"))
                  {
                     _loc17_.gotoAndPlay("walkbanner");
                     _loc17_.flag.inside.gotoAndStop(_loc3_);
                  }
                  else if(_loc18_ > 0.7)
                  {
                     if(_loc19_ > 0.8)
                     {
                        _loc17_.gotoAndPlay("walkwave2");
                     }
                     else if(_loc19_ > 0.4)
                     {
                        _loc17_.gotoAndPlay("walkwave2_2");
                     }
                     else
                     {
                        _loc17_.gotoAndPlay("walkwave2_3");
                     }
                  }
                  else if(_loc18_ > 0.4)
                  {
                     if(_loc19_ > 0.8)
                     {
                        _loc17_.gotoAndPlay("walkwave");
                     }
                     else if(_loc19_ > 0.5)
                     {
                        _loc17_.gotoAndPlay("walkwave_2");
                     }
                     else
                     {
                        _loc17_.gotoAndPlay("walkwave_3");
                     }
                  }
                  else if(_loc19_ > 0.7)
                  {
                     _loc17_.gotoAndPlay("walk");
                  }
                  else if(_loc19_ > 0.4)
                  {
                     _loc17_.gotoAndPlay("walk_2");
                  }
                  else
                  {
                     _loc17_.gotoAndPlay("walk_3");
                  }
                  if(_loc2_ > 0)
                  {
                     if(_loc2_ % 2 == 0)
                     {
                        _loc17_.y += _loc1_.customerSpacingY;
                        _loc1_.clip.holder.addChild(_loc17_);
                     }
                     else
                     {
                        _loc17_.y -= _loc1_.customerSpacingY;
                        _loc1_.clip.holder.addChildAt(_loc17_,0);
                     }
                     _loc17_.y += Math.round(Math.random() * 12) - 6;
                     _loc17_.x -= 20 + (20 * _loc2_ + Math.floor(Math.random() * 10));
                  }
                  else
                  {
                     _loc1_.clip.holder.addChild(_loc17_);
                  }
                  _loc1_.movingParts.push(_loc17_);
                  if(_loc2_ == _loc16_.length - 1)
                  {
                     _loc1_.movingPartsType.push("customermain");
                  }
                  else
                  {
                     _loc1_.movingPartsType.push("customer");
                  }
                  _loc2_++;
               }
               if(_loc3_ == "gold")
               {
                  ++_loc1_.goldSetsShown;
               }
               else if(_loc3_ == "silver")
               {
                  ++_loc1_.silverSetsShown;
               }
               else if(_loc3_ == "bronze")
               {
                  ++_loc1_.bronzeSetsShown;
               }
            }
            else
            {
               _loc20_ = _loc1_[_loc3_ + "CustomerIDs"];
               _loc2_ = 0;
               while(_loc2_ < _loc20_.length)
               {
                  _loc21_ = new customerParadeMC();
                  _loc1_.buildCustomer(_loc20_[_loc2_],_loc21_);
                  _loc21_.scaleX = _loc1_.customerScale * -1;
                  _loc21_.scaleY = _loc1_.customerScale;
                  _loc21_.x = _loc1_.startX;
                  _loc21_.y = _loc1_.customerStartY;
                  _loc22_ = Math.random();
                  _loc23_ = Math.random();
                  if(_loc2_ == 0 && (_loc3_ == "bronze" || _loc3_ == "silver" || _loc3_ == "gold" || _loc3_ == "palooza"))
                  {
                     _loc21_.gotoAndPlay("walkbanner");
                     _loc21_.flag.inside.gotoAndStop(_loc3_);
                  }
                  else if(_loc22_ > 0.7)
                  {
                     if(_loc23_ > 0.8)
                     {
                        _loc21_.gotoAndPlay("walkwave2");
                     }
                     else if(_loc23_ > 0.4)
                     {
                        _loc21_.gotoAndPlay("walkwave2_2");
                     }
                     else
                     {
                        _loc21_.gotoAndPlay("walkwave2_3");
                     }
                  }
                  else if(_loc22_ > 0.4)
                  {
                     if(_loc23_ > 0.8)
                     {
                        _loc21_.gotoAndPlay("walkwave");
                     }
                     else if(_loc23_ > 0.5)
                     {
                        _loc21_.gotoAndPlay("walkwave_2");
                     }
                     else
                     {
                        _loc21_.gotoAndPlay("walkwave_3");
                     }
                  }
                  else if(_loc23_ > 0.7)
                  {
                     _loc21_.gotoAndPlay("walk");
                  }
                  else if(_loc23_ > 0.4)
                  {
                     _loc21_.gotoAndPlay("walk_2");
                  }
                  else
                  {
                     _loc21_.gotoAndPlay("walk_3");
                  }
                  if(_loc2_ > 0)
                  {
                     if(_loc2_ % 2 == 0)
                     {
                        _loc21_.y += _loc1_.customerSpacingY;
                        _loc1_.clip.holder.addChild(_loc21_);
                     }
                     else
                     {
                        _loc21_.y -= _loc1_.customerSpacingY;
                        _loc1_.clip.holder.addChildAt(_loc21_,0);
                     }
                     _loc21_.y += Math.round(Math.random() * 12) - 6;
                     _loc21_.x -= 20 + (20 * _loc2_ + Math.floor(Math.random() * 10));
                  }
                  else
                  {
                     _loc1_.clip.holder.addChild(_loc21_);
                  }
                  _loc1_.movingParts.push(_loc21_);
                  if(_loc2_ == _loc20_.length - 1)
                  {
                     _loc1_.movingPartsType.push("customermain");
                  }
                  else
                  {
                     _loc1_.movingPartsType.push("customer");
                  }
                  _loc2_++;
               }
            }
         }
      }
      
      public function setupCustomerGroups() : void
      {
         var _loc2_:Number = NaN;
         var _loc4_:String = null;
         var _loc1_:ParadeScreen = this;
         _loc1_.foodiniCustomerID = _loc1_.getCustomerIndex("Foodini");
         _loc1_.closerCustomerIDs = _loc1_.getMultipleCustomerIndex(["Jojo","Emmlette","Xolo","Quinn","Akari","Deano","Whiff"]);
         _loc1_.paloozaCustomerIDs = _loc1_.getMultipleCustomerIndex(["Kingsley","Hope","Yui","Steven","Elle"]);
         _loc1_.floatCustomerIDs_papalouie = _loc1_.getMultipleCustomerIndex(["PapaLouie"]);
         _loc1_.floatCustomerIDs_burgeria = _loc1_.getMultipleCustomerIndex(["Marty","Rita"]);
         _loc1_.floatCustomerIDs_pizzeria = _loc1_.getMultipleCustomerIndex(["Roy"]);
         _loc1_.floatCustomerIDs_tacomia = _loc1_.getMultipleCustomerIndex(["Mitch","Maggie"]);
         _loc1_.floatCustomerIDs_freezeria = _loc1_.getMultipleCustomerIndex(["Penny","Alberto"]);
         _loc1_.floatCustomerIDs_pancakeria = _loc1_.getMultipleCustomerIndex(["Cooper","Prudence"]);
         _loc1_.floatCustomerIDs_romano = _loc1_.getMultipleCustomerIndex(["Bruna Romano","Gino Romano","Little Edoardo","Carlo Romano"]);
         _loc1_.floatCustomerIDs_wingeria = _loc1_.getMultipleCustomerIndex(["Chuck","Mandi"]);
         _loc1_.floatCustomerIDs_hotdoggeria = _loc1_.getMultipleCustomerIndex(["Peggy","Taylor"]);
         _loc1_.floatCustomerIDs_cupcakeria = _loc1_.getMultipleCustomerIndex(["James","Willow"]);
         _loc1_.floatCustomerIDs_pastaria = _loc1_.getMultipleCustomerIndex(["Doan","Utah"]);
         _loc1_.floatCustomerIDs_donuteria = _loc1_.getMultipleCustomerIndex(["Scooter","Tony"]);
         _loc1_.floatCustomerIDs_cheeseria = _loc1_.getMultipleCustomerIndex(["Scarlett","Rudy"]);
         _loc1_.floatCustomerIDs_bakeria = _loc1_.getMultipleCustomerIndex(["Timm","Cecilia"]);
         _loc1_.noneCustomerIDs = _loc1_.getCustomerIndexWithAward(0);
         _loc1_.bronzeCustomerIDs = _loc1_.getCustomerIndexWithAward(1);
         _loc1_.silverCustomerIDs = _loc1_.getCustomerIndexWithAward(2);
         _loc1_.goldCustomerIDs = _loc1_.getCustomerIndexWithAward(3);
         if(_loc1_.goldCustomerIDs.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("gold"),1);
         }
         if(_loc1_.silverCustomerIDs.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("silver"),1);
         }
         if(_loc1_.bronzeCustomerIDs.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("bronze"),1);
         }
         _loc2_ = _loc1_.closerCustomerIDs.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.closerCustomerIDs[_loc2_]) == false)
            {
               _loc1_.closerCustomerIDs.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.closerCustomerIDs.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("closer"),1);
         }
         _loc2_ = _loc1_.paloozaCustomerIDs.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.paloozaCustomerIDs[_loc2_]) == false)
            {
               _loc1_.paloozaCustomerIDs.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.paloozaCustomerIDs.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("palooza"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_burgeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_burgeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_burgeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_burgeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("burgeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_pizzeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_pizzeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_pizzeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_pizzeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("pizzeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_tacomia.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_tacomia[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_tacomia.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_tacomia.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("tacomia"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_freezeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_freezeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_freezeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_freezeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("freezeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_pancakeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_pancakeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_pancakeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_pancakeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("pancakeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_romano.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_romano[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_romano.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_romano.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("romano"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_papalouie.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_papalouie[_loc2_],true) == false)
            {
               _loc1_.floatCustomerIDs_papalouie.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_papalouie.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("papalouie"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_wingeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_wingeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_wingeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_wingeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("wingeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_hotdoggeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_hotdoggeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_hotdoggeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_hotdoggeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("hotdoggeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_cupcakeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_cupcakeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_cupcakeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_cupcakeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("cupcakeria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_pastaria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_pastaria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_pastaria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_pastaria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("pastaria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_donuteria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_donuteria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_donuteria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_donuteria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("donuteria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_cheeseria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_cheeseria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_cheeseria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_cheeseria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("cheeseria"),1);
         }
         _loc2_ = _loc1_.floatCustomerIDs_bakeria.length - 1;
         while(_loc2_ >= 0)
         {
            if(_loc1_.hasServedCustomer(_loc1_.floatCustomerIDs_bakeria[_loc2_]) == false)
            {
               _loc1_.floatCustomerIDs_bakeria.splice(_loc2_,1);
            }
            _loc2_--;
         }
         if(_loc1_.floatCustomerIDs_bakeria.length == 0)
         {
            _loc1_.paradeOrder.splice(_loc1_.paradeOrder.indexOf("bakeria"),1);
         }
         var _loc3_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.paradeOrder.length)
         {
            if((_loc4_ = String(_loc1_.paradeOrder[_loc2_])) == "pizzeria" || _loc4_ == "burgeria" || _loc4_ == "tacomia" || _loc4_ == "freezeria" || _loc4_ == "wingeria" || _loc4_ == "hotdoggeria" || _loc4_ == "pancakeria" || _loc4_ == "cupcakeria" || _loc4_ == "romano" || _loc4_ == "pastaria" || _loc4_ == "donuteria" || _loc4_ == "cheeseria" || _loc4_ == "bakeria")
            {
               _loc3_++;
            }
            _loc2_++;
         }
         _loc1_.gameObj.var_127.seenFloatsInParade = _loc3_;
      }
      
      public function getCustomerIndexWithAward(param1:Number) : Array
      {
         var _loc2_:ParadeScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:CustomerData = _loc2_.gameObj.var_131;
         var _loc5_:Array;
         (_loc5_ = []).push([]);
         7;
         var _loc7_:int = 1;
         while(_loc7_ < _loc4_.getCustomerTotal())
         {
            if(_loc3_.getCustomerSeal(_loc7_) == param1 && !_loc2_.alreadyInGroup(_loc7_))
            {
               if(_loc5_[_loc5_.length - 1].length < 7)
               {
                  _loc5_[_loc5_.length - 1].push(_loc7_);
               }
               else
               {
                  _loc5_.push([_loc7_]);
               }
            }
            _loc7_++;
         }
         if(_loc5_.length == 1 && _loc5_[0].length == 0)
         {
            _loc5_ = [];
         }
         class_6.method_1("Award Level " + param1 + ": " + _loc5_.length + " sets.");
         return _loc5_;
      }
      
      public function hasServedCustomer(param1:Number, param2:Boolean = false) : Boolean
      {
         var _loc3_:ParadeScreen = this;
         var _loc4_:UserData = _loc3_.gameObj.var_127;
         var _loc5_:Boolean = true;
         if(param2 && _loc4_.customersUnlocked[param1] == 1)
         {
            _loc5_ = true;
         }
         else if(_loc4_.getCustomerTotalOrders(param1) == 0)
         {
            _loc5_ = false;
         }
         else
         {
            _loc5_ = true;
         }
         return _loc5_;
      }
      
      public function alreadyInGroup(param1:Number) : Boolean
      {
         var _loc2_:ParadeScreen = this;
         var _loc3_:Boolean = false;
         if(_loc2_.foodiniCustomerID == param1)
         {
            _loc3_ = true;
         }
         if(_loc2_.closerCustomerIDs.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.paloozaCustomerIDs.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_burgeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_freezeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_pancakeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_papalouie.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_pizzeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_tacomia.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_romano.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_wingeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_hotdoggeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_cupcakeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_pastaria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_donuteria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_cheeseria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         if(_loc2_.floatCustomerIDs_bakeria.indexOf(param1) > -1)
         {
            _loc3_ = true;
         }
         return _loc3_;
      }
      
      public function getCustomerIndex(param1:String) : Number
      {
         var _loc2_:ParadeScreen = this;
         return _loc2_.gameObj.var_131.getCustomerIndex(param1);
      }
      
      public function getMultipleCustomerIndex(param1:Array) : Array
      {
         var _loc2_:ParadeScreen = this;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_.push(_loc2_.getCustomerIndex(param1[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getCustomerClipName(param1:Number) : String
      {
         var _loc2_:ParadeScreen = this;
         return _loc2_.gameObj.var_131.getCustomerClipName(param1);
      }
      
      public function buildCustomer(param1:Number, param2:MovieClip) : void
      {
         var _loc3_:ParadeScreen = this;
         var _loc4_:String = _loc3_.getCustomerClipName(param1);
         _loc3_.gameObj.var_131.buildCustomer(_loc4_,param2);
      }
      
      public function clearCustomer(param1:MovieClip) : void
      {
         this;
         try
         {
            param1.stop();
            param1.head.removeChildAt(0);
            param1.eyes.removeChildAt(0);
            param1.mouth.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.body.removeChildAt(0);
            param1.neck.removeChildAt(0);
            param1.front_shoe.removeChildAt(0);
            param1.back_shoe.removeChildAt(0);
            param1.fronthand.removeChildAt(0);
            param1.backhand.removeChildAt(0);
            param1.front_upperarm.removeChildAt(0);
            param1.back_upperarm.removeChildAt(0);
            param1.front_forearm.removeChildAt(0);
            param1.back_forearm.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
         try
         {
            param1.back_hair.removeChildAt(0);
         }
         catch(err:Error)
         {
         }
      }
   }
}
