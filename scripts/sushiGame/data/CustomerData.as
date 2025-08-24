package sushiGame.data
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getTimer;
   import package_2.class_14;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.customers.*;
   
   public class CustomerData
   {
       
      
      private var gameObj:class_5;
      
      private var customersIncluded:Array;
      
      public var colorLabels:Array;
      
      public var colorValues:Array;
      
      private var customerDataFiles:Array;
      
      private var randomSeed:Number = 1020304;
      
      public var thumbBMP:BitmapData = null;
      
      public var thumbGender:String = "???";
      
      public var verifyTypes:Array;
      
      public var verifyAmounts:Array;
      
      public var verifyAmountsClosers:Array;
      
      public function CustomerData(param1:class_5)
      {
         this.customersIncluded = [CustomerJojo,CustomerEmmlette,CustomerWhiff,CustomerAkari,CustomerDeano,CustomerQuinn,CustomerXolo,CustomerChuck,CustomerWally,CustomerHackyZak,CustomerLisa,CustomerYui,CustomerBrunaRomano,CustomerElle,CustomerKingsley,CustomerRhonda,CustomerConnor,CustomerVicky,CustomerPerri,CustomerChester,CustomerRudy,CustomerJanana,CustomerOlga,CustomerGinoRomano,CustomerShannon,CustomerBrody,CustomerDukeGotcha,CustomerVincent,CustomerHope,CustomerIggy,CustomerBertha,CustomerSteven,CustomerTony,CustomerAllan,CustomerMary,CustomerFoodini,CustomerSue,CustomerClair,CustomerCarloRomano,CustomerSkyler,CustomerPeggy,CustomerGremmie,CustomerHugo,CustomerZoe,CustomerOlivia,CustomerJoy,CustomerTohru,CustomerMandi,CustomerAustin,CustomerKayla,CustomerKoilee,CustomerMaggie,CustomerSasha,CustomerKenji,CustomerFranco,CustomerCletus,CustomerUtah,CustomerAlberto,CustomerNevada,CustomerRobby,CustomerKahuna,CustomerMarty,CustomerRico,CustomerBoomer,CustomerEmber,CustomerScooter,CustomerPrudence,CustomerPenny,CustomerCecilia,CustomerTimm,CustomerNick,CustomerJohnny,CustomerHank,CustomerCooper,CustomerTrishna,CustomerJames,CustomerWillow,CustomerWendy,CustomerProfessorFitz,CustomerGeorgito,CustomerSargeFan,CustomerSienna,CustomerTaylor,CustomerPinchHitwell,CustomerEdna,CustomerRadlynn,CustomerSanta,CustomerCherissa,CustomerRita,CustomerJulep,CustomerMitch,CustomerXandra,CustomerIvy,CustomerBigPauly,CustomerLittleEdoardo,CustomerWylanB,CustomerScarlett,CustomerGreg,CustomerRoy,CustomerYippy,CustomerMindy,CustomerCrystal,CustomerMayorMallow,CustomerDoan,CustomerCaptainCori,CustomerPapaLouie];
         this.colorLabels = ["lime","seafoam","emerald","forest","lightred","deepred","midred","fire","brown","yelloworange","yellow","skyblue","midblue","dustyblue","bluepurple","purple","pink","flipline"];
         this.colorValues = [10603339,6208144,4375367,3964525,14641005,9647414,13319485,13272125,11492667,14072678,14533770,8501969,3567559,5006465,7298746,9991368,14778294,8955711];
         this.customerDataFiles = [];
         this.verifyTypes = [];
         this.verifyAmounts = [];
         this.verifyAmountsClosers = [];
         super();
         var _loc2_:CustomerData = this;
         _loc2_.gameObj = param1;
         _loc2_.setupCustomerData();
      }
      
      public function setupCustomerData() : void
      {
         var _loc3_:Class = null;
         var _loc4_:CustomerDataFile = null;
         var _loc1_:CustomerData = this;
         _loc1_.customerDataFiles = [];
         _loc1_.customerDataFiles.push(new CustomerDataFile());
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.customersIncluded.length)
         {
            _loc3_ = _loc1_.customersIncluded[_loc2_];
            _loc4_ = new _loc3_();
            _loc1_.customerDataFiles.push(_loc4_);
            _loc2_++;
         }
      }
      
      public function generateCustomerBitmap() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:BitmapData = null;
         var _loc9_:MovieClip = null;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:String = null;
         var _loc13_:Class = null;
         var _loc14_:MovieClip = null;
         var _loc15_:Class = null;
         var _loc16_:MovieClip = null;
         var _loc17_:Class = null;
         var _loc18_:MovieClip = null;
         var _loc19_:Rectangle = null;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Class = null;
         var _loc28_:MovieClip = null;
         var _loc29_:Class = null;
         var _loc30_:MovieClip = null;
         var _loc31_:Rectangle = null;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Rectangle = null;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc1_:CustomerData = this;
         var _loc2_:Number = getTimer();
         1;
         if(_loc1_.thumbBMP == null || _loc1_.thumbGender != _loc1_.gameObj.workerData.gender)
         {
            if(_loc1_.thumbBMP != null)
            {
               _loc1_.thumbBMP.dispose();
               _loc1_.thumbBMP = null;
            }
            _loc1_.thumbGender = _loc1_.gameObj.workerData.gender;
            _loc4_ = _loc1_.customersIncluded.length;
            _loc5_ = 47;
            _loc6_ = 47;
            _loc7_ = 0;
            _loc1_.thumbBMP = new BitmapData(_loc5_ * _loc4_,_loc6_,true,0);
            _loc8_ = new BitmapData(_loc5_,_loc6_,true,0);
            _loc10_ = 0;
            while(_loc10_ < _loc4_)
            {
               _loc9_ = null;
               _loc9_ = new customerThumbMC();
               _loc12_ = _loc1_.getCustomerClipName(_loc10_ + 1);
               (_loc14_ = new (_loc13_ = getDefinitionByName("customer_" + _loc12_ + "_head") as Class)()).name = "clip";
               _loc14_.gotoAndStop(1);
               _loc9_.head.addChild(_loc14_);
               (_loc16_ = new (_loc15_ = getDefinitionByName("customer_" + _loc12_ + "_eyes") as Class)()).name = "clip";
               _loc16_.gotoAndStop(1);
               _loc9_.eyes.addChild(_loc16_);
               (_loc18_ = new (_loc17_ = getDefinitionByName("customer_" + _loc12_ + "_mouth") as Class)()).name = "clip";
               _loc18_.gotoAndStop(1);
               _loc9_.mouth.addChild(_loc18_);
               try
               {
                  (_loc28_ = new (_loc27_ = getDefinitionByName("customer_" + _loc12_ + "_hair") as Class)()).gotoAndStop(1);
                  _loc28_.name = "clip";
                  _loc9_.hair.addChild(_loc28_);
               }
               catch(err:Error)
               {
               }
               try
               {
                  (_loc30_ = new (_loc29_ = getDefinitionByName("customer_" + _loc12_ + "_back_hair") as Class)()).gotoAndStop(1);
                  _loc30_.name = "clip";
                  _loc9_.back_hair.addChild(_loc30_);
               }
               catch(err:Error)
               {
               }
               _loc9_.gotoAndStop(1);
               try
               {
                  _loc30_.scaleX = 0.0001;
                  _loc30_.scaleY = 0.0001;
               }
               catch(err:Error)
               {
               }
               _loc19_ = _loc9_.getBounds(_loc9_);
               _loc20_ = 14;
               _loc21_ = _loc5_ - _loc20_;
               _loc22_ = _loc6_ - _loc20_;
               if(1 == 1)
               {
                  _loc20_ = 4;
                  _loc21_ = _loc5_ - _loc20_;
                  _loc22_ = _loc6_ - _loc20_;
                  _loc23_ = _loc21_ / _loc19_.width;
                  _loc24_ = _loc22_ / _loc19_.height;
                  _loc25_ = 0.3;
                  _loc26_ = Math.max(_loc25_,Math.min(_loc23_,_loc24_));
                  _loc9_.scaleX = _loc26_;
                  _loc9_.scaleY = _loc26_;
               }
               else if(1 == 2)
               {
                  _loc20_ = 14;
                  _loc21_ = _loc5_ - _loc20_;
                  _loc22_ = _loc6_ - _loc20_;
                  _loc31_ = _loc9_.head.getChildAt(0).getBounds(_loc9_.head.getChildAt(0));
                  _loc23_ = _loc21_ / _loc31_.width;
                  _loc24_ = _loc22_ / _loc31_.height;
                  _loc25_ = 0.25;
                  _loc26_ = Math.max(_loc25_,Math.min(_loc23_,_loc24_));
                  _loc9_.scaleX = _loc26_;
                  _loc9_.scaleY = _loc26_;
                  _loc32_ = (_loc9_.head.x + _loc31_.x + _loc31_.width / 2) * _loc26_;
                  _loc33_ = (_loc9_.head.y + _loc31_.y + _loc31_.height / 2) * _loc26_;
                  _loc34_ = 22;
                  _loc35_ = 24;
                  _loc9_.x = _loc34_ - _loc32_;
                  _loc9_.y = _loc35_ - _loc33_;
                  if(_loc26_ == _loc25_)
                  {
                     class_6.method_1(">> " + _loc12_ + " was too big.");
                  }
               }
               if(_loc26_ == _loc25_)
               {
                  _loc36_ = _loc9_.head.getChildAt(0).getBounds(_loc9_.head.getChildAt(0));
                  _loc37_ = (_loc9_.head.x + _loc36_.x + _loc36_.width / 2) * _loc26_;
                  _loc38_ = (_loc9_.head.y + _loc36_.y + _loc36_.height / 2) * _loc26_;
                  _loc39_ = _loc5_ / 2 - _loc37_;
                  _loc40_ = _loc6_ / 2 - _loc38_;
                  _loc9_.x = _loc39_;
                  _loc9_.y = _loc40_;
               }
               else
               {
                  _loc41_ = (_loc19_.x + _loc19_.width / 2) * _loc26_;
                  _loc42_ = (_loc19_.y + _loc19_.height / 2) * _loc26_;
                  _loc43_ = _loc5_ / 2 - _loc41_;
                  _loc44_ = _loc6_ / 2 - _loc42_;
                  _loc9_.x = _loc43_;
                  _loc9_.y = _loc44_;
               }
               try
               {
                  _loc30_.scaleX = 1;
                  _loc30_.scaleY = 1;
               }
               catch(err:Error)
               {
               }
               _loc8_.fillRect(_loc8_.rect,0);
               _loc8_.draw(_loc9_,_loc9_.transform.matrix,_loc9_.transform.colorTransform);
               this.thumbBMP.copyPixels(_loc8_,_loc8_.rect,new Point(_loc10_ * _loc5_,0),null,null,true);
               _loc10_++;
            }
            _loc8_.dispose();
            _loc8_ = null;
            _loc9_ = null;
            _loc11_ = getTimer() - _loc2_;
            class_6.info("Generate Customer Thumbs: " + _loc11_ + " ms. (" + _loc4_ + " Customers)");
         }
         else
         {
            class_6.info("using old customer thumbs.");
         }
      }
      
      public function getCustomerBitmap(param1:Number, param2:Boolean = false) : BitmapData
      {
         var _loc3_:CustomerData = this;
         47;
         47;
         var _loc6_:BitmapData = new BitmapData(47,47,true,0);
         var _loc7_:Number = (param1 - 1) * 47;
         0;
         if(param2)
         {
            _loc6_.dispose();
            _loc6_ = null;
         }
         else
         {
            _loc6_.copyPixels(_loc3_.thumbBMP,new Rectangle(_loc7_,0,47,47),new Point(0,0),null,null,true);
         }
         return _loc6_;
      }
      
      public function addVerifyItems(param1:Array, param2:Boolean) : void
      {
         var _loc5_:Number = NaN;
         var _loc3_:CustomerData = this;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if((_loc5_ = _loc3_.verifyTypes.indexOf(param1[_loc4_])) == -1)
            {
               _loc3_.verifyTypes.push(param1[_loc4_]);
               _loc3_.verifyAmounts.push(0);
               _loc3_.verifyAmountsClosers.push(0);
               _loc5_ = _loc3_.verifyTypes.indexOf(param1[_loc4_]);
            }
            _loc3_.verifyAmounts[_loc5_] += 1;
            if(param2)
            {
               _loc3_.verifyAmountsClosers[_loc5_] += 1;
            }
            _loc4_++;
         }
      }
      
      public function outputTallies() : void
      {
         var _loc2_:int = 0;
         var _loc3_:CustomerDataFile = null;
         var _loc1_:CustomerData = this;
         class_6.method_1(" ---- ---- VERIFY ORDERS ---- ----");
         _loc1_.verifyAmounts = [];
         _loc1_.verifyAmountsClosers = [];
         _loc1_.verifyTypes = [];
         _loc2_ = 2;
         while(_loc2_ < _loc1_.customerDataFiles.length)
         {
            _loc3_ = _loc1_.customerDataFiles[_loc2_];
            _loc3_.verifyOrder(_loc1_);
            _loc2_++;
         }
         class_6.method_1(" ---- ---- ---- DONE ---- ---- ----");
         class_6.method_1("");
      }
      
      public function getCustomerOrder(param1:Number) : Array
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         var _loc4_:Array = [];
         if(param1 == 1)
         {
            _loc4_ = _loc2_.getFoodCriticOrder().getOrderAsArray();
         }
         else if(Boolean(_loc2_.gameObj.var_133) && _loc2_.gameObj.var_133.isOrderingSpecial(param1))
         {
            class_6.method_1("Get a SPECIAL order for customer " + param1);
            _loc4_ = _loc2_.getSpecialOrder(param1).getOrderAsArray();
         }
         else
         {
            _loc4_ = _loc2_.getAvailableOrder(param1).getOrderAsArray();
         }
         return _loc4_;
      }
      
      public function getCustomerOrderForGiving(param1:Number) : Array
      {
         var _loc2_:CustomerData = this;
         var _loc3_:Array = [];
         if(Boolean(_loc2_.gameObj.var_133) && _loc2_.gameObj.var_133.isOrderingSpecial(param1))
         {
            _loc3_ = _loc2_.getSpecialOrder(param1).getOrderAsGivingArray();
         }
         else
         {
            _loc3_ = _loc2_.getCustomerOrder(param1);
         }
         return _loc3_;
      }
      
      public function getCustomerCompleteOrder(param1:Number) : Array
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         var _loc4_:CustomerOrder = _loc3_.getCustomerOrder(_loc2_.gameObj.var_127.getMonth(),_loc2_.gameObj.var_127.isNewYear());
         var _loc5_:Array = [];
         if(param1 == 1)
         {
            _loc5_ = _loc2_.getFoodCriticOrder().getOrderAsArray();
         }
         else
         {
            _loc5_ = _loc4_.getOrderAsArray();
         }
         return _loc5_;
      }
      
      public function getCustomerCompleteOrderData(param1:Number) : CustomerOrder
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.getCustomerOrder(_loc2_.gameObj.var_127.getMonth(),_loc2_.gameObj.var_127.isNewYear());
      }
      
      public function getFoodCriticOrder(param1:Number = -1) : CustomerOrder
      {
         var _loc4_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:String = null;
         var _loc35_:Number = NaN;
         var _loc36_:String = null;
         var _loc2_:CustomerData = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         _loc2_.setRandomSeed(_loc3_.currentDay);
         if(param1 > -1)
         {
            _loc2_.setRandomSeed(param1);
         }
         var _loc5_:CustomerOrder = new CustomerOrder();
         var _loc6_:Number;
         if((_loc6_ = _loc3_.getMonth()) == GameData.STARTER_MONTH && !_loc3_.isNewYear())
         {
            _loc6_ = 0;
         }
         var _loc7_:Array = FoodData.getPaper(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc8_:Array = FoodData.getRice(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc9_:Array = FoodData.getFillings(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc10_:Array = FoodData.getDrops(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc11_:Array = FoodData.getShakers(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc12_:Array = FoodData.getSauces(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc13_:Array = FoodData.getTeas(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc14_:Array = FoodData.getBubbles(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc15_:Array = [];
         var _loc16_:Array = [];
         var _loc17_:Array = [];
         var _loc18_:Array = [];
         var _loc19_:Array = [];
         var _loc20_:Array = [];
         var _loc21_:Array = [];
         var _loc22_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc7_.length)
         {
            if(_loc7_[_loc4_] != null && _loc3_.hasTopping(_loc7_[_loc4_]))
            {
               _loc15_.push(_loc7_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc8_.length)
         {
            if(_loc8_[_loc4_] != null && _loc3_.hasTopping(_loc8_[_loc4_]))
            {
               _loc16_.push(_loc8_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc9_.length)
         {
            if(_loc9_[_loc4_] != null && _loc3_.hasTopping(_loc9_[_loc4_]))
            {
               _loc17_.push(_loc9_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc10_.length)
         {
            if(_loc10_[_loc4_] != null && _loc3_.hasTopping(_loc10_[_loc4_]))
            {
               _loc18_.push(_loc10_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc11_.length)
         {
            if(_loc11_[_loc4_] != null && _loc3_.hasTopping(_loc11_[_loc4_]))
            {
               _loc19_.push(_loc11_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc12_.length)
         {
            if(_loc12_[_loc4_] != null && _loc3_.hasTopping(_loc12_[_loc4_]))
            {
               _loc20_.push(_loc12_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc13_.length)
         {
            if(_loc13_[_loc4_] != null && _loc3_.hasTopping(_loc13_[_loc4_]))
            {
               _loc21_.push(_loc13_[_loc4_]);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc14_.length)
         {
            if(_loc14_[_loc4_] != null && _loc3_.hasTopping(_loc14_[_loc4_]))
            {
               _loc22_.push(_loc14_[_loc4_]);
            }
            _loc4_++;
         }
         var _loc23_:String = _loc2_.getRandom(_loc15_);
         var _loc24_:String = _loc2_.getRandom(_loc16_);
         var _loc25_:String = _loc2_.getRandom(_loc21_);
         var _loc26_:String = _loc2_.getRandom(_loc22_);
         var _loc27_:Boolean = false;
         if(_loc2_.randomize() < 0.5)
         {
            _loc27_ = true;
         }
         var _loc28_:Array = [];
         var _loc29_:Number = _loc2_.randomize();
         if(_loc17_.length == 1 || _loc29_ < 0.33)
         {
            _loc30_ = Math.floor(_loc2_.randomize() * _loc17_.length);
            _loc31_ = String(_loc17_[_loc30_]);
            _loc28_.push(_loc31_);
            _loc17_.splice(_loc30_,1);
         }
         else if(_loc17_.length == 2 || _loc29_ < 0.66)
         {
            _loc30_ = Math.floor(_loc2_.randomize() * _loc17_.length);
            _loc31_ = String(_loc17_[_loc30_]);
            _loc28_.push(_loc31_);
            _loc17_.splice(_loc30_,1);
            _loc30_ = Math.floor(_loc2_.randomize() * _loc17_.length);
            _loc31_ = String(_loc17_[_loc30_]);
            _loc28_.push(_loc31_);
            _loc17_.splice(_loc30_,1);
         }
         else
         {
            _loc30_ = Math.floor(_loc2_.randomize() * _loc17_.length);
            _loc31_ = String(_loc17_[_loc30_]);
            _loc28_.push(_loc31_);
            _loc17_.splice(_loc30_,1);
            _loc30_ = Math.floor(_loc2_.randomize() * _loc17_.length);
            _loc31_ = String(_loc17_[_loc30_]);
            _loc28_.push(_loc31_);
            _loc17_.splice(_loc30_,1);
            _loc30_ = Math.floor(_loc2_.randomize() * _loc17_.length);
            _loc31_ = String(_loc17_[_loc30_]);
            _loc28_.push(_loc31_);
            _loc17_.splice(_loc30_,1);
         }
         var _loc32_:Array = [];
         var _loc33_:Number = _loc2_.randomize();
         var _loc34_:Number = _loc2_.randomize();
         var _loc37_:Number;
         if((_loc37_ = (_loc37_ = (_loc37_ = (_loc37_ = 0) + _loc18_.length) + _loc20_.length) + _loc19_.length) == 1 || _loc33_ < 0.3)
         {
            if(_loc34_ < 0.3 && _loc18_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc18_.length);
               _loc36_ = String(_loc18_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc18_.splice(_loc35_,1);
            }
            else if(_loc34_ < 0.6 && _loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            else if(_loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc18_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc18_.length);
               _loc36_ = String(_loc18_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc18_.splice(_loc35_,1);
            }
         }
         else if(_loc37_ == 2 || _loc33_ < 0.6)
         {
            if(_loc34_ < 0.5 && _loc18_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc18_.length);
               _loc36_ = String(_loc18_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc18_.splice(_loc35_,1);
            }
            else if(_loc34_ < 0.75 && _loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            else if(_loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            if(_loc34_ > 0.25 && _loc34_ < 0.75 && _loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            else if(_loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
         }
         else
         {
            if(_loc34_ < 0.8 && _loc18_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc18_.length);
               _loc36_ = String(_loc18_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc18_.splice(_loc35_,1);
            }
            else if(_loc34_ < 0.9 && _loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            else if(_loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            if(_loc34_ > 0.25 && _loc34_ < 0.75 && _loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            else if(_loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            if(_loc34_ > 0.45 && _loc34_ < 0.95 && _loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
            else if(_loc20_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc20_.length);
               _loc36_ = String(_loc20_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc20_.splice(_loc35_,1);
            }
            else if(_loc19_.length > 0)
            {
               _loc35_ = Math.floor(_loc2_.randomize() * _loc19_.length);
               _loc36_ = String(_loc19_[_loc35_]);
               _loc32_.push(_loc36_);
               _loc19_.splice(_loc35_,1);
            }
         }
         _loc5_.setPaper(_loc23_);
         _loc5_.setRice(_loc24_,_loc27_);
         _loc5_.setTea(_loc25_,_loc26_);
         _loc4_ = 0;
         while(_loc4_ < _loc28_.length)
         {
            _loc5_.addFillings(_loc28_[_loc4_]);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc32_.length)
         {
            _loc5_.addToppings(_loc32_[_loc4_]);
            _loc4_++;
         }
         var _loc38_:String = "Food Critic Order: " + _loc5_.output();
         class_6.info(_loc38_);
         return _loc5_;
      }
      
      public function getSpecialOrder(param1:Number, param2:Number = -1) : CustomerOrder
      {
         var _loc5_:int = 0;
         var _loc3_:CustomerData = this;
         var _loc4_:GameData = _loc3_.gameObj.var_132;
         var _loc6_:CustomerOrder = _loc3_.getAvailableOrder(param1);
         var _loc7_:CustomerOrder = new CustomerOrder();
         var _loc8_:SpecialItem = _loc4_.getSpecial(_loc3_.gameObj.var_127.currentSpecial);
         if(param2 != -1)
         {
            _loc8_ = _loc4_.getSpecial(param2);
         }
         if(_loc8_ != null)
         {
            _loc7_.setPaper(_loc8_.ingredients[0]);
            _loc7_.setRice(_loc8_.ingredients[1],_loc8_.ingredients[2]);
            _loc5_ = 3;
            while(_loc5_ < _loc8_.ingredients.length)
            {
               if(_loc8_.ingredients[_loc5_] is Array && _loc8_.ingredients[_loc5_].length == 2)
               {
                  _loc7_.addFillings(_loc8_.ingredients[_loc5_][0]);
               }
               else if(_loc8_.ingredients[_loc5_] is String)
               {
                  _loc7_.addToppings(_loc8_.ingredients[_loc5_]);
               }
               _loc5_++;
            }
            _loc7_.setTea(_loc6_.teaType,_loc6_.bubbleType);
            _loc7_.isSpecial = true;
         }
         else
         {
            class_6.error("Error getting the Special Order for " + param1 + " (Special = " + _loc3_.gameObj.var_127.currentSpecial + "). Use default order instead.");
            _loc7_ = _loc6_;
         }
         return _loc7_;
      }
      
      public function getAvailableOrder(param1:Number) : CustomerOrder
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc2_:CustomerData = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc6_:CustomerDataFile;
         var _loc7_:CustomerOrder = (_loc6_ = _loc2_.customerDataFiles[param1]).getCustomerOrder(_loc3_.getMonth(),_loc3_.isNewYear());
         var _loc8_:CustomerOrder = _loc6_.getCustomerOrder(0,false);
         var _loc9_:CustomerOrder = new CustomerOrder(_loc7_.month);
         var _loc10_:String = _loc7_.paperType;
         if(_loc3_.hasTopping(_loc7_.paperType) == false)
         {
            _loc10_ = FoodData.PAPER_NORI;
         }
         var _loc11_:String = _loc7_.riceType;
         if(_loc3_.hasTopping(_loc7_.riceType) == false)
         {
            _loc11_ = FoodData.RICE_WHITE;
         }
         var _loc12_:String = _loc7_.teaType;
         if(_loc3_.hasTopping(_loc12_) == false && _loc7_.month > 0)
         {
            _loc12_ = _loc8_.teaType;
         }
         if(_loc3_.hasTopping(_loc12_) == false)
         {
            if(_loc12_ == FoodData.TEA_CHOCOLATE)
            {
               _loc12_ = FoodData.TEA_ALMOND;
            }
            else if(_loc12_ == FoodData.TEA_BLUEBERRY)
            {
               _loc12_ = FoodData.TEA_STRAWBERRY;
            }
            else if(_loc12_ == FoodData.TEA_PINACOLADA)
            {
               _loc12_ = FoodData.TEA_ALMOND;
            }
            else if(_loc12_ == FoodData.TEA_TANGERINE && _loc3_.hasTopping(FoodData.TEA_PINACOLADA))
            {
               _loc12_ = FoodData.TEA_PINACOLADA;
            }
            else if(_loc12_ == FoodData.TEA_TANGERINE && !_loc3_.hasTopping(FoodData.TEA_PINACOLADA))
            {
               _loc12_ = FoodData.TEA_ALMOND;
            }
            else if(_loc12_ == FoodData.TEA_TARO && _loc3_.hasTopping(FoodData.TEA_BLUEBERRY))
            {
               _loc12_ = FoodData.TEA_BLUEBERRY;
            }
            else if(_loc12_ == FoodData.TEA_TARO && !_loc3_.hasTopping(FoodData.TEA_BLUEBERRY))
            {
               _loc12_ = FoodData.TEA_STRAWBERRY;
            }
            else if(_loc12_ == FoodData.TEA_HONEYDEW && _loc3_.hasTopping(FoodData.TEA_BLUEBERRY))
            {
               _loc12_ = FoodData.TEA_BLUEBERRY;
            }
            else if(_loc12_ == FoodData.TEA_HONEYDEW && !_loc3_.hasTopping(FoodData.TEA_BLUEBERRY))
            {
               _loc12_ = FoodData.TEA_STRAWBERRY;
            }
            else
            {
               _loc12_ = FoodData.TEA_CHAI;
            }
         }
         var _loc13_:String = _loc8_.bubbleType;
         if(_loc3_.hasTopping(_loc13_) == false)
         {
            if(_loc13_ == FoodData.BUBBLE_WATERMELON)
            {
               _loc13_ = FoodData.BUBBLE_TAPIOCA;
            }
            else if(_loc13_ == FoodData.BUBBLE_CHERRY)
            {
               if(_loc3_.hasTopping(FoodData.BUBBLE_WATERMELON))
               {
                  _loc13_ = FoodData.BUBBLE_WATERMELON;
               }
               else
               {
                  _loc13_ = FoodData.BUBBLE_TAPIOCA;
               }
            }
            else if(_loc13_ == FoodData.BUBBLE_PAWPAW)
            {
               _loc13_ = FoodData.BUBBLE_LYCHEE;
            }
            else if(_loc13_ == FoodData.BUBBLE_SUGARPLUM)
            {
               if(_loc3_.hasTopping(FoodData.BUBBLE_CHERRY))
               {
                  _loc13_ = FoodData.BUBBLE_CHERRY;
               }
               else
               {
                  _loc13_ = FoodData.BUBBLE_TAPIOCA;
               }
            }
            else if(_loc13_ == FoodData.BUBBLE_COTTONCANDY)
            {
               if(_loc3_.hasTopping(FoodData.BUBBLE_WATERMELON))
               {
                  _loc13_ = FoodData.BUBBLE_WATERMELON;
               }
               else
               {
                  _loc13_ = FoodData.BUBBLE_TAPIOCA;
               }
            }
            else if(_loc13_ == FoodData.BUBBLE_KIWI)
            {
               _loc13_ = FoodData.BUBBLE_MANGO;
            }
            else if(_loc13_ == FoodData.BUBBLE_HUCKLEBERRY)
            {
               if(_loc3_.hasTopping(FoodData.BUBBLE_SUGARPLUM))
               {
                  _loc13_ = FoodData.BUBBLE_SUGARPLUM;
               }
               else
               {
                  _loc13_ = FoodData.BUBBLE_TAPIOCA;
               }
            }
            else
            {
               _loc13_ = FoodData.BUBBLE_TAPIOCA;
            }
         }
         var _loc14_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc7_.fillings.length)
         {
            if(_loc3_.hasTopping(_loc7_.fillings[_loc4_]))
            {
               _loc14_.push(_loc7_.fillings[_loc4_]);
            }
            _loc4_++;
         }
         if(_loc14_.length == 0)
         {
            _loc14_.push(FoodData.FILLING_TUNA);
         }
         var _loc15_:String = null;
         _loc4_ = _loc14_.length - 1;
         while(_loc4_ >= 0)
         {
            if(_loc14_[_loc4_] == _loc15_)
            {
               class_6.method_1("((Found a double-filling caused by a gap.  Cut one out instead.))");
               _loc14_.splice(_loc4_,1);
            }
            else
            {
               _loc15_ = String(_loc14_[_loc4_]);
            }
            _loc4_--;
         }
         var _loc16_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc7_.toppings.length)
         {
            if(_loc3_.hasTopping(_loc7_.toppings[_loc4_]))
            {
               _loc16_.push(_loc7_.toppings[_loc4_]);
            }
            _loc4_++;
         }
         if(_loc16_.length == 0)
         {
            _loc16_.push(FoodData.SAUCE_TERIYAKI);
         }
         var _loc17_:String = null;
         _loc4_ = _loc16_.length - 1;
         while(_loc4_ >= 0)
         {
            if(_loc16_[_loc4_] == _loc17_)
            {
               class_6.method_1("((Found a double-topping caused by a gap. Cut one out instead.))");
               _loc16_.splice(_loc4_,1);
            }
            else
            {
               _loc17_ = String(_loc16_[_loc4_]);
            }
            _loc4_--;
         }
         _loc9_.setPaper(_loc10_);
         _loc9_.setRice(_loc11_,_loc7_.isFlipped);
         _loc4_ = 0;
         while(_loc4_ < _loc14_.length)
         {
            _loc9_.addFillings(_loc14_[_loc4_]);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc16_.length)
         {
            _loc9_.addToppings(_loc16_[_loc4_]);
            _loc4_++;
         }
         _loc9_.setTea(_loc12_,_loc13_);
         return _loc9_;
      }
      
      public function getCustomerIndex(param1:String) : Number
      {
         var _loc2_:CustomerData = this;
         var _loc3_:Number = -1;
         var _loc4_:int = 1;
         while(_loc4_ < _loc2_.customerDataFiles.length)
         {
            if(_loc2_.customerDataFiles[_loc4_].customerName == param1 || _loc2_.customerDataFiles[_loc4_].customerClipName == param1)
            {
               _loc3_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getCustomerName(param1:Number, param2:Boolean = false) : String
      {
         var _loc3_:CustomerData = this;
         var _loc4_:CustomerDataFile;
         if((_loc4_ = _loc3_.customerDataFiles[param1]).customerName == "Joy")
         {
            if(_loc3_.gameObj.var_127.isWearingAlternate(param1) && param2 == true)
            {
               return "Ninjoy";
            }
            return "Joy";
         }
         return _loc4_.customerName;
      }
      
      public function getCustomerClipName(param1:Number) : String
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         if(_loc3_.customerName == "DoanOrUtah")
         {
            if(Boolean(_loc2_.gameObj.workerData) && _loc2_.gameObj.workerData.gender == WorkerData.GENDER_MALE)
            {
               return "Utah";
            }
            return "Doan";
         }
         return _loc3_.customerClipName;
      }
      
      public function getCustomerOrderData(param1:Number, param2:Number = -1) : CustomerOrder
      {
         var _loc3_:CustomerData = this;
         var _loc4_:CustomerDataFile = _loc3_.customerDataFiles[param1];
         if(param1 == 1)
         {
            return _loc3_.getFoodCriticOrder();
         }
         if(param2 != -1)
         {
            class_6.method_1("Checking for a SECRET SPECIAL ORDER (" + param2 + ")");
            return _loc3_.getSpecialOrder(param1,param2);
         }
         if(Boolean(_loc3_.gameObj.var_133) && _loc3_.gameObj.var_133.isOrderingSpecial(param1))
         {
            class_6.method_1("Get a SPECIAL order data for customer " + param1);
            return _loc3_.getSpecialOrder(param1);
         }
         return _loc3_.getAvailableOrder(param1);
      }
      
      public function getCustomerFirstGame(param1:Number) : String
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         if(_loc3_.customerName == "DoanOrUtah")
         {
            if(_loc2_.gameObj.workerData.gender == WorkerData.GENDER_MALE)
            {
               return "Papa\'s Freezeria";
            }
            return "Papa\'s Burgeria";
         }
         return _loc3_.customerFirstGame;
      }
      
      public function getCustomerStickerAmount(param1:Number) : Number
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         var _loc4_:Number = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.stickers.length)
         {
            if(_loc2_.gameObj.var_127.hasBadge(_loc2_.gameObj.var_136.getChallengeIndexForSticker(_loc3_.stickers[_loc5_])))
            {
               _loc4_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getCustomerFlipdeckNumber(param1:Number) : Number
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.flipdeckNumber;
      }
      
      public function getCustomerStickers(param1:Number) : Array
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.stickers;
      }
      
      public function getCustomerSecretSpecialIndex(param1:Number) : Number
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.secretSpecialIndex;
      }
      
      public function getCustomerColor(param1:Number) : String
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.thumbColor;
      }
      
      public function getCustomerColorValue(param1:Number) : Number
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         var _loc4_:String = _loc3_.thumbColor;
         if(_loc3_.houseColor != null)
         {
            _loc4_ = _loc3_.houseColor;
         }
         var _loc5_:Number;
         if((_loc5_ = _loc2_.colorLabels.indexOf(_loc4_)) > -1 && _loc5_ < _loc2_.colorValues.length)
         {
            return _loc2_.colorValues[_loc5_];
         }
         return _loc2_.colorValues[0];
      }
      
      public function getCustomerInPool(param1:Number) : Boolean
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         if(_loc3_.notInPool)
         {
            return false;
         }
         return true;
      }
      
      public function getCustomerInApartment(param1:Number) : Boolean
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         if(_loc3_.livesInApartment)
         {
            return true;
         }
         return false;
      }
      
      public function getCustomerAlternateHandExtra(param1:Number) : String
      {
         var _loc4_:CustomerDataFile = null;
         var _loc2_:CustomerData = this;
         var _loc3_:String = null;
         try
         {
            _loc3_ = (_loc4_ = _loc2_.customerDataFiles[param1]).alternateHandExtra;
         }
         catch(err:Error)
         {
         }
         return _loc3_;
      }
      
      public function getCustomerHolidayHandExtra(param1:Number, param2:Number = -1) : String
      {
         var _loc5_:CustomerDataFile = null;
         var _loc3_:CustomerData = this;
         var _loc4_:String = null;
         try
         {
            _loc5_ = _loc3_.customerDataFiles[param1];
            if(param2 == -1 || param2 == _loc5_.holidayOutfit)
            {
               _loc4_ = _loc5_.holidayHandExtra;
            }
         }
         catch(err:Error)
         {
         }
         return _loc4_;
      }
      
      public function getCustomerHolidayOutfitMonth(param1:Number) : Number
      {
         var _loc4_:CustomerDataFile = null;
         var _loc5_:CustomerDataFile = null;
         var _loc2_:CustomerData = this;
         var _loc3_:Number = 0;
         try
         {
            if(_loc2_.getCustomerName(param1) == "DoanOrUtah")
            {
               _loc3_ = (_loc4_ = _loc2_.customerDataFiles[_loc2_.getCustomerIndex("DoanOrUtah")]).holidayOutfit;
            }
            else
            {
               _loc3_ = (_loc5_ = _loc2_.customerDataFiles[param1]).holidayOutfit;
            }
         }
         catch(err:Error)
         {
         }
         return _loc3_;
      }
      
      public function getCustomerHolidayOutfitPart(param1:String, param2:Number, param3:String) : Boolean
      {
         var _loc6_:CustomerDataFile = null;
         var _loc7_:CustomerDataFile = null;
         var _loc4_:CustomerData = this;
         var _loc5_:Boolean = false;
         try
         {
            if(param1 == "DoanOrUtah")
            {
               if((_loc6_ = _loc4_.customerDataFiles[_loc4_.getCustomerIndex("DoanOrUtah")]).holidayOutfit == param2)
               {
                  if(param3 == "eyes" && _loc6_.hasHolidayEyes)
                  {
                     _loc5_ = true;
                  }
                  else if(param3 == "mouth" && _loc6_.hasHolidayMouth)
                  {
                     _loc5_ = true;
                  }
                  else if((param3 == "hand" || param3 == "hand2") && _loc6_.hasHolidayHands)
                  {
                     _loc5_ = true;
                  }
                  else if(param3 == "foot" && _loc6_.hasHolidayShoes)
                  {
                     _loc5_ = true;
                  }
               }
            }
            else if((_loc7_ = _loc4_.customerDataFiles[_loc4_.getCustomerIndex(param1)]).holidayOutfit == param2)
            {
               if(param3 == "eyes" && _loc7_.hasHolidayEyes)
               {
                  _loc5_ = true;
               }
               else if(param3 == "mouth" && _loc7_.hasHolidayMouth)
               {
                  _loc5_ = true;
               }
               else if((param3 == "hand" || param3 == "hand2") && _loc7_.hasHolidayHands)
               {
                  _loc5_ = true;
               }
               else if(param3 == "foot" && _loc7_.hasHolidayShoes)
               {
                  _loc5_ = true;
               }
            }
         }
         catch(err:Error)
         {
         }
         return _loc5_;
      }
      
      public function getCustomerAlternateOutfitPart(param1:String, param2:String) : Boolean
      {
         var _loc5_:CustomerDataFile = null;
         var _loc6_:CustomerDataFile = null;
         var _loc3_:CustomerData = this;
         var _loc4_:Boolean = false;
         try
         {
            if(param1 == "DoanOrUtah")
            {
               _loc5_ = _loc3_.customerDataFiles[_loc3_.getCustomerIndex("DoanOrUtah")];
               if(param2 == "eyes" && _loc5_.hasAlternateEyes)
               {
                  _loc4_ = true;
               }
               else if(param2 == "mouth" && _loc5_.hasAlternateMouth)
               {
                  _loc4_ = true;
               }
               else if((param2 == "hand" || param2 == "hand2") && _loc5_.hasAlternateHands)
               {
                  _loc4_ = true;
               }
               else if(param2 == "foot" && _loc5_.hasAlternateShoes)
               {
                  _loc4_ = true;
               }
            }
            else
            {
               _loc6_ = _loc3_.customerDataFiles[_loc3_.getCustomerIndex(param1)];
               if(param2 == "eyes" && _loc6_.hasAlternateEyes)
               {
                  _loc4_ = true;
               }
               else if(param2 == "mouth" && _loc6_.hasAlternateMouth)
               {
                  _loc4_ = true;
               }
               else if((param2 == "hand" || param2 == "hand2") && _loc6_.hasAlternateHands)
               {
                  _loc4_ = true;
               }
               else if(param2 == "foot" && _loc6_.hasAlternateShoes)
               {
                  _loc4_ = true;
               }
            }
         }
         catch(err:Error)
         {
         }
         return _loc4_;
      }
      
      public function getCustomerPart(param1:String, param2:String, param3:Number = 0) : MovieClip
      {
         var _loc4_:CustomerData = this;
         var _loc5_:Class = getDefinitionByName("customer_" + param1 + "_" + param2) as Class;
         if(_loc4_.getCustomerHolidayOutfitPart(param1,param3,param2) == true)
         {
            _loc5_ = getDefinitionByName("customer_" + param1 + "_" + param2 + "_holiday") as Class;
         }
         return new _loc5_() as MovieClip;
      }
      
      public function getCustomerAnimatedPart(param1:String, param2:String, param3:Number = 0, param4:Boolean = false, param5:Boolean = false) : MovieClip
      {
         var _loc6_:CustomerData = this;
         var _loc7_:* = null;
         if(param4 === true && _loc6_.getCustomerAlternateOutfitPart(param1,param2) == true)
         {
            _loc7_ = "customer_" + param1 + "_" + param2 + "_alt";
         }
         else if(param5 === true && param3 > 0 && _loc6_.getCustomerHolidayOutfitPart(param1,param3,param2) == true)
         {
            _loc7_ = "customer_" + param1 + "_" + param2 + "_holiday";
         }
         else
         {
            _loc7_ = "customer_" + param1 + "_" + param2;
         }
         return class_14.method_103(_loc7_,false,false);
      }
      
      public function buildCustomer(param1:String, param2:MovieClip, param3:Boolean = false, param4:Boolean = false) : void
      {
         var bodyMC:MovieClip;
         var headMC:MovieClip;
         var eyesMC:MovieClip;
         var mouthMC:MovieClip;
         var neckMC:MovieClip;
         var hairMC:MovieClip;
         var backhairMC:MovieClip;
         var frontshoeMC:MovieClip;
         var backshoeMC:MovieClip;
         var fronthandMC:MovieClip;
         var backhandMC:MovieClip;
         var frontupperarmMC:MovieClip;
         var backupperarmMC:MovieClip;
         var frontforearmMC:MovieClip;
         var backforearmMC:MovieClip;
         var targetFrame:Number;
         var customerName:String = param1;
         var model:MovieClip = param2;
         var forceHoliday:Boolean = param3;
         var justHead:Boolean = param4;
         var data:CustomerData = this;
         var holiday:Number = data.gameObj.var_127.getHolidayMonth();
         var index:Number = data.getCustomerIndex(customerName);
         var shouldWearHoliday:Boolean = false;
         var shouldWearAlternate:Boolean = false;
         if(forceHoliday || holiday > 0 && data.getCustomerHolidayOutfitMonth(index) == holiday && data.gameObj.var_127.canWearHoliday(index))
         {
            shouldWearHoliday = true;
            holiday = data.getCustomerHolidayOutfitMonth(index);
         }
         else if(data.gameObj.var_127.isWearingAlternate(index))
         {
            shouldWearAlternate = true;
         }
         bodyMC = class_14.method_103("customer_" + customerName + "_body",false,false);
         model.body.addChild(bodyMC);
         headMC = class_14.method_103("customer_" + customerName + "_head",false,false);
         model.head.addChild(headMC);
         eyesMC = data.getCustomerAnimatedPart(customerName,"eyes",holiday,shouldWearAlternate,shouldWearHoliday);
         model.eyes.addChild(eyesMC);
         mouthMC = data.getCustomerAnimatedPart(customerName,"mouth",holiday,shouldWearAlternate,shouldWearHoliday);
         model.mouth.addChild(mouthMC);
         neckMC = class_14.method_103("customer_" + customerName + "_neck",false,false);
         model.neck.addChild(neckMC);
         hairMC = null;
         backhairMC = null;
         try
         {
            hairMC = class_14.method_103("customer_" + customerName + "_hair",false,false);
            model.hair.addChild(hairMC);
         }
         catch(err:Error)
         {
            hairMC = null;
         }
         try
         {
            backhairMC = class_14.method_103("customer_" + customerName + "_back_hair",false,false);
            model.back_hair.addChild(backhairMC);
         }
         catch(err:Error)
         {
            backhairMC = null;
         }
         frontshoeMC = data.getCustomerAnimatedPart(customerName,"foot",holiday,shouldWearAlternate,shouldWearHoliday);
         model.front_shoe.addChild(frontshoeMC);
         backshoeMC = data.getCustomerAnimatedPart(customerName,"foot",holiday,shouldWearAlternate,shouldWearHoliday);
         model.back_shoe.addChild(backshoeMC);
         fronthandMC = data.getCustomerAnimatedPart(customerName,"hand",holiday,shouldWearAlternate,shouldWearHoliday);
         model.fronthand.addChild(fronthandMC);
         backhandMC = data.getCustomerAnimatedPart(customerName,"hand2",holiday,shouldWearAlternate,shouldWearHoliday);
         model.backhand.addChild(backhandMC);
         frontupperarmMC = class_14.method_103("customer_" + customerName + "_upperarm",false,false);
         model.front_upperarm.addChild(frontupperarmMC);
         backupperarmMC = class_14.method_103("customer_" + customerName + "_upperarm",false,false);
         model.back_upperarm.addChild(backupperarmMC);
         frontforearmMC = class_14.method_103("customer_" + customerName + "_forearm",false,false);
         model.front_forearm.addChild(frontforearmMC);
         backforearmMC = class_14.method_103("customer_" + customerName + "_forearm",false,false);
         model.back_forearm.addChild(backforearmMC);
         targetFrame = 1;
         if(shouldWearAlternate)
         {
            targetFrame = 2;
         }
         else if(shouldWearHoliday)
         {
            targetFrame = 3;
         }
         if(bodyMC.totalFrames >= targetFrame)
         {
            bodyMC.gotoAndStop(targetFrame);
         }
         else
         {
            bodyMC.gotoAndStop(1);
         }
         if(headMC.totalFrames >= targetFrame)
         {
            headMC.gotoAndStop(targetFrame);
         }
         else
         {
            headMC.gotoAndStop(1);
         }
         if(neckMC.totalFrames >= targetFrame)
         {
            neckMC.gotoAndStop(targetFrame);
         }
         else
         {
            neckMC.gotoAndStop(1);
         }
         if(frontupperarmMC.totalFrames >= targetFrame)
         {
            frontupperarmMC.gotoAndStop(targetFrame);
         }
         else
         {
            frontupperarmMC.gotoAndStop(1);
         }
         if(backupperarmMC.totalFrames >= targetFrame)
         {
            backupperarmMC.gotoAndStop(targetFrame);
         }
         else
         {
            backupperarmMC.gotoAndStop(1);
         }
         if(frontforearmMC.totalFrames >= targetFrame)
         {
            frontforearmMC.gotoAndStop(targetFrame);
         }
         else
         {
            frontforearmMC.gotoAndStop(1);
         }
         if(backforearmMC.totalFrames >= targetFrame)
         {
            backforearmMC.gotoAndStop(targetFrame);
            if(targetFrame == 2 && customerName == "Taylor")
            {
               backforearmMC.gotoAndStop(1);
            }
         }
         else
         {
            backforearmMC.gotoAndStop(1);
         }
         if(hairMC != null)
         {
            if(hairMC.totalFrames >= targetFrame)
            {
               hairMC.gotoAndStop(targetFrame);
            }
            else
            {
               hairMC.gotoAndStop(1);
            }
         }
         if(backhairMC != null)
         {
            if(backhairMC.totalFrames >= targetFrame)
            {
               backhairMC.gotoAndStop(targetFrame);
            }
            else
            {
               backhairMC.gotoAndStop(1);
            }
         }
         if(justHead)
         {
            frontshoeMC.visible = false;
            backshoeMC.visible = false;
            bodyMC.visible = false;
            fronthandMC.visible = false;
            backhandMC.visible = false;
            frontupperarmMC.visible = false;
            backupperarmMC.visible = false;
            frontforearmMC.visible = false;
            backforearmMC.visible = false;
            neckMC.visible = false;
         }
      }
      
      public function getCustomerTotal() : Number
      {
         var _loc1_:CustomerData = this;
         return _loc1_.customerDataFiles.length - 1;
      }
      
      private function getToppingRealName(param1:String) : String
      {
         var _loc2_:CustomerData = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:String = "???";
         var _loc5_:Number;
         if((_loc5_ = _loc3_.toppingIndexes.indexOf(param1)) > -1)
         {
            _loc4_ = String(_loc3_.toppingNames[_loc5_]);
         }
         return _loc4_;
      }
      
      public function getCustomerFavoriteHoliday(param1:Number) : Number
      {
         var _loc5_:int = 0;
         var _loc2_:CustomerData = this;
         var _loc3_:Number = 13;
         var _loc4_:CustomerDataFile;
         if((_loc4_ = _loc2_.customerDataFiles[param1]).isCloser)
         {
            _loc3_ = 13;
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.customerOrders.length)
            {
               if(_loc4_.customerOrders[_loc5_].month > 0)
               {
                  _loc3_ = _loc4_.customerOrders[_loc5_].month;
                  break;
               }
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function getCustomerToppingString(param1:Number) : String
      {
         var _loc2_:CustomerData = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:* = "";
         var _loc5_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         var _loc8_:CustomerOrder = _loc2_.getAvailableOrder(param1);
         _loc4_ = _loc2_.getToppingRealName(_loc8_.paperType) + " and " + _loc2_.getToppingRealName(_loc8_.riceType) + " Sushi";
         if(_loc2_.getCustomerName(param1) == "Jojo")
         {
            _loc4_ = "Different every time!";
         }
         return _loc4_;
      }
      
      public function isCloser(param1:Number) : Boolean
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.isCloser;
      }
      
      public function isHuge(param1:Number) : Boolean
      {
         var _loc2_:CustomerData = this;
         var _loc3_:CustomerDataFile = _loc2_.customerDataFiles[param1];
         return _loc3_.isHuge;
      }
      
      public function customersHaveTopping(param1:*, param2:String) : Boolean
      {
         var _loc4_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc3_:CustomerData = this;
         var _loc5_:Boolean = false;
         if(param1 is Number)
         {
            _loc4_ = [param1];
         }
         else if(param1 is Array)
         {
            _loc4_ = param1;
         }
         else
         {
            _loc4_ = [];
         }
         if(_loc4_.length > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               _loc7_ = _loc3_.getCustomerOrder(_loc4_[_loc6_]);
               _loc8_ = 0;
               while(_loc8_ < _loc7_.length)
               {
                  if(_loc7_[_loc8_][0] == param2)
                  {
                     _loc5_ = true;
                     break;
                  }
                  _loc8_++;
               }
               _loc6_++;
            }
         }
         return _loc5_;
      }
      
      public function getCustomerWithTopping(param1:String, param2:Array) : Number
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc3_:CustomerData = this;
         var _loc4_:Number = -1;
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            _loc6_ = _loc3_.getCustomerOrder(param2[_loc5_]);
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               if(_loc6_[_loc7_][0] == param1)
               {
                  _loc4_ = Number(param2[_loc5_]);
                  break;
               }
               _loc7_++;
            }
            if(_loc4_ > -1)
            {
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function customersHaveHolidayOrder(param1:*, param2:Number) : Boolean
      {
         var _loc4_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:CustomerOrder = null;
         var _loc3_:CustomerData = this;
         var _loc5_:Boolean = false;
         if(param1 is Number)
         {
            _loc4_ = [param1];
         }
         else if(param1 is Array)
         {
            _loc4_ = param1;
         }
         else
         {
            _loc4_ = [];
         }
         if(_loc4_.length > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if((_loc7_ = _loc3_.getCustomerOrderData(_loc4_[_loc6_])).month == param2)
               {
                  _loc5_ = true;
                  break;
               }
               _loc6_++;
            }
         }
         return _loc5_;
      }
      
      public function getCustomerWithHolidayOrder(param1:Number, param2:Array) : Number
      {
         var _loc6_:CustomerOrder = null;
         var _loc3_:CustomerData = this;
         var _loc4_:Number = -1;
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            if((_loc6_ = _loc3_.getCustomerOrderData(param2[_loc5_])).month == param1)
            {
               _loc4_ = Number(param2[_loc5_]);
               break;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getCustomersWithHolidayOrder(param1:Number, param2:Array) : Array
      {
         var _loc6_:CustomerOrder = null;
         var _loc3_:CustomerData = this;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            if((_loc6_ = _loc3_.getCustomerOrderData(param2[_loc5_])).month == param1)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getCustomersForSpecial(param1:Number = -1) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:SpecialItem = null;
         var _loc15_:CustomerOrder = null;
         var _loc16_:CustomerOrder = null;
         var _loc17_:Number = NaN;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Number = NaN;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         var _loc23_:Object = null;
         var _loc2_:CustomerData = this;
         var _loc3_:Array = [];
         var _loc7_:Number = getTimer();
         var _loc8_:Array = _loc2_.gameObj.var_127.getCustomerPool(int.MAX_VALUE);
         var _loc9_:Number = _loc2_.gameObj.var_127.currentSpecial;
         if(param1 != -1)
         {
            _loc9_ = param1;
         }
         if(_loc9_ > -1)
         {
            _loc13_ = [];
            _loc14_ = _loc2_.gameObj.var_132.getSpecial(_loc9_);
            _loc15_ = _loc2_.getSpecialOrder(25,_loc9_);
            _loc17_ = 0;
            class_6.method_1("Trying to match Special: " + _loc15_.output());
            _loc4_ = 0;
            while(_loc4_ < _loc8_.length)
            {
               _loc17_ = 0;
               if(!((_loc16_ = _loc2_.getAvailableOrder(_loc8_[_loc4_])).month != 0 && _loc2_.gameObj.var_127.getHolidayMonth() == _loc16_.month))
               {
                  if(_loc16_.paperType == _loc15_.paperType)
                  {
                     _loc17_++;
                     class_6.method_1("(MATCH PAPER)");
                     if(_loc14_.dominantIngredients.indexOf(_loc15_.paperType) > -1)
                     {
                        _loc17_++;
                     }
                  }
                  if(_loc16_.riceType == _loc15_.riceType)
                  {
                     _loc17_++;
                     class_6.method_1("(MATCH RICE)");
                     if(_loc14_.dominantIngredients.indexOf(_loc15_.riceType) > -1)
                     {
                        _loc17_++;
                     }
                  }
                  _loc19_ = [];
                  _loc5_ = 0;
                  while(_loc5_ < _loc15_.fillings.length)
                  {
                     _loc21_ = [];
                     _loc6_ = 0;
                     while(_loc6_ < _loc16_.fillings.length)
                     {
                        _loc21_.push(_loc16_.fillings[_loc6_]);
                        _loc6_++;
                     }
                     if(_loc21_.indexOf(_loc15_.fillings[_loc5_]) > -1 && _loc19_.indexOf(_loc15_.fillings[_loc5_]) == -1)
                     {
                        _loc17_++;
                        class_6.method_1("(MATCH FILLING)");
                        if(_loc14_.dominantIngredients.indexOf(_loc15_.fillings[_loc5_]) > -1)
                        {
                           _loc17_++;
                        }
                        _loc19_.push(_loc15_.fillings[_loc5_]);
                     }
                     _loc5_++;
                  }
                  _loc18_ = [];
                  _loc5_ = 0;
                  while(_loc5_ < _loc15_.toppings.length)
                  {
                     _loc22_ = [];
                     _loc6_ = 0;
                     while(_loc6_ < _loc16_.toppings.length)
                     {
                        _loc22_.push(_loc16_.toppings[_loc6_]);
                        _loc6_++;
                     }
                     if(_loc22_.indexOf(_loc15_.toppings[_loc5_]) > -1 && _loc18_.indexOf(_loc15_.toppings[_loc5_]) == -1)
                     {
                        _loc17_++;
                        class_6.method_1("(MATCH TOPPING)");
                        if(_loc14_.dominantIngredients.indexOf(_loc15_.toppings[_loc5_]) > -1)
                        {
                           _loc17_++;
                        }
                        _loc18_.push(_loc15_.toppings[_loc5_]);
                     }
                     _loc5_++;
                  }
                  if(_loc17_ > 0)
                  {
                     (_loc23_ = new Object()).customer = _loc8_[_loc4_];
                     _loc23_.matches = _loc17_;
                     _loc13_.push(_loc23_);
                  }
               }
               _loc4_++;
            }
            _loc13_.sortOn("matches",Array.NUMERIC | Array.DESCENDING);
            _loc20_ = 8;
            _loc4_ = 0;
            while(_loc4_ < _loc20_)
            {
               if(_loc13_.length > _loc4_)
               {
                  _loc3_.push(_loc13_[_loc4_].customer);
               }
               _loc4_++;
            }
         }
         var _loc10_:Number = getTimer() - _loc7_;
         var _loc11_:* = "";
         var _loc12_:int = 0;
         while(_loc12_ < _loc3_.length)
         {
            _loc11_ += _loc2_.getCustomerName(_loc3_[_loc12_]);
            if(_loc12_ < _loc3_.length - 1)
            {
               _loc11_ += ", ";
            }
            _loc12_++;
         }
         class_6.method_1(" -- " + _loc14_.title + ": " + _loc11_);
         return _loc3_;
      }
      
      public function getCustomerLineupForMenu() : Vector.<int>
      {
         var _loc4_:int = 0;
         var _loc6_:CustomerDataFile = null;
         var _loc7_:UnlockData = null;
         var _loc8_:Number = NaN;
         var _loc1_:CustomerData = this;
         var _loc2_:Vector.<int> = new Vector.<int>();
         var _loc3_:UserData = _loc1_.gameObj.var_127;
         var _loc5_:Array = [];
         _loc4_ = 1;
         while(_loc4_ < _loc3_.customersUnlocked.length)
         {
            _loc6_ = _loc1_.customerDataFiles[_loc4_];
            _loc7_ = _loc1_.gameObj.var_132.getUnlockByTag(_loc6_.customerName);
            _loc8_ = _loc4_;
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.rank;
            }
            _loc8_ += _loc4_ / 300;
            _loc5_.push({
               "num":_loc4_,
               "rank":_loc8_
            });
            _loc4_++;
         }
         _loc5_.sortOn("rank",Array.NUMERIC);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            if(_loc3_.customersUnlocked[_loc5_[_loc4_].num] == 0 || _loc3_.customerVisits[_loc5_[_loc4_].num] == 0)
            {
               _loc2_.push(_loc5_[_loc4_].num);
            }
            else
            {
               _loc2_.unshift(_loc5_[_loc4_].num);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getNumCustomersUnlocked() : Number
      {
         var _loc1_:CustomerData = this;
         var _loc2_:Number = 0;
         var _loc3_:UserData = _loc1_.gameObj.var_127;
         var _loc4_:int = 1;
         while(_loc4_ < _loc3_.customersUnlocked.length)
         {
            if(!(_loc3_.customersUnlocked[_loc4_] == 0 || _loc3_.customerVisits[_loc4_] == 0))
            {
               _loc2_++;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function anyCustomersHaveGiftBox() : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc1_:CustomerData = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         var _loc3_:Boolean = false;
         var _loc4_:Number = getTimer();
         var _loc5_:Number = 0;
         if(!(_loc2_.hasTrained("stickeropenmenu") && _loc2_.hasTrained("stickeropencustomers")))
         {
            class_6.method_1("    (((Checking if any customers have a gift box available)))");
            _loc6_ = 1;
            while(_loc6_ < _loc2_.customersUnlocked.length)
            {
               if((_loc5_ = _loc1_.getCustomerStickerAmount(_loc6_)) >= 3 && _loc2_.hasAlternateOutfit(_loc6_) == false && _loc2_.customersUnlocked[_loc6_] == 1 && (_loc2_.customerFirstVisit[_loc6_] > 1 || _loc2_.customerVisits[_loc6_] > 0))
               {
                  _loc3_ = true;
                  break;
               }
               _loc6_++;
            }
            _loc7_ = getTimer() - _loc4_;
            class_6.method_1("     (((Took " + _loc7_ + " ms.)))");
         }
         return _loc3_;
      }
      
      public function getCustomersForMenu(param1:String) : Array
      {
         var _loc8_:Number = NaN;
         var _loc2_:CustomerData = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:Number = 0;
         var _loc7_:int = 1;
         while(_loc7_ < _loc3_.customersUnlocked.length)
         {
            if((_loc8_ = _loc3_.getCustomerFirstDay(_loc7_)) == 0)
            {
               _loc8_ = int.MAX_VALUE;
            }
            if((_loc6_ = _loc2_.getCustomerStickerAmount(_loc7_)) >= 3 && _loc3_.hasAlternateOutfit(_loc7_) == false)
            {
               _loc6_++;
            }
            if(_loc3_.customersUnlocked[_loc7_] == 1 && (_loc3_.customerFirstVisit[_loc7_] > 1 || _loc3_.customerVisits[_loc7_] > 0))
            {
               _loc4_.push({
                  "idx":_loc7_,
                  "name":_loc2_.getCustomerName(_loc7_),
                  "day":_loc8_,
                  "stars":_loc3_.getCustomerSeal(_loc7_) * 5 + _loc3_.getCustomerStars(_loc7_),
                  "stickers":_loc6_,
                  "alt":_loc3_.hasAlternateOutfit(_loc7_)
               });
            }
            else
            {
               _loc5_.push({
                  "idx":_loc7_,
                  "name":_loc2_.getCustomerName(_loc7_),
                  "day":_loc8_,
                  "stars":_loc3_.getCustomerSeal(_loc7_) * 5 + _loc3_.getCustomerStars(_loc7_),
                  "stickers":_loc6_,
                  "alt":_loc3_.hasAlternateOutfit(_loc7_)
               });
            }
            _loc7_++;
         }
         if(param1 == "abc")
         {
            _loc4_.sortOn("name");
         }
         else if(param1 == "new")
         {
            _loc4_.sortOn("day",Array.NUMERIC | Array.DESCENDING);
         }
         else if(param1 == "stars")
         {
            _loc4_.sortOn("stars",Array.NUMERIC | Array.DESCENDING);
         }
         else if(param1 == "stickers")
         {
            _loc4_.sortOn("stickers",Array.NUMERIC | Array.DESCENDING);
         }
         return _loc4_.concat(_loc5_);
      }
      
      public function randomize(param1:Boolean = true) : Number
      {
         var _loc2_:CustomerData = this;
         if(param1)
         {
            return (_loc2_.randomSeed = _loc2_.randomSeed * 16807 % 2147483647) / 2147483647 + 2.33e-10;
         }
         return Math.random();
      }
      
      public function setRandomSeed(param1:Number) : void
      {
         var _loc2_:CustomerData = this;
         _loc2_.randomSeed = param1;
         _loc2_.randomize();
      }
      
      public function getRandom(param1:Array) : *
      {
         var _loc2_:CustomerData = this;
         if(param1 != null && param1.length > 0)
         {
            return param1[Math.floor(_loc2_.randomize() * param1.length)];
         }
         return null;
      }
   }
}
