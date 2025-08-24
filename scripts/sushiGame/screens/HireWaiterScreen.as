package sushiGame.screens
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.ui.*;
   import package_4.class_5;
   import sushiGame.data.UserData;
   import sushiGame.data.WorkerData;
   import sushiGame.models.Worker;
   
   public class HireWaiterScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip;
      
      public var clip:MovieClip;
      
      public var isClosing:Boolean = false;
      
      public var currentMode:String = "slots";
      
      public var selectedCharacter:String = "marty";
      
      public var workerChuck:Worker = null;
      
      public var workerMandi:Worker = null;
      
      public var workerCustom1:Worker = null;
      
      public var workerCustom2:Worker = null;
      
      public var missingWidget:MovieClip;
      
      public var panelNames:Array;
      
      public var backgroundBitmap:Bitmap = null;
      
      public var diningClip:MovieClip = null;
      
      public function HireWaiterScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         this.panelNames = [];
         super();
         var _loc4_:HireWaiterScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:HireWaiterScreen = this;
         _loc1_.clip = new hireWaiterMC();
         _loc1_.setupPanelOptions();
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.animateScreen);
         _loc1_.clip.character.gotoAndStop(1);
         _loc1_.clip.continue_btn.addEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickContinue);
         _loc1_.clip.chooselabel.visible = false;
         _loc1_.diningClip = new giveOrderDiningMC();
         _loc1_.backgroundBitmap = _loc1_.createLobbyBackdropBitmap();
         _loc1_.diningClip.backdrop_holder.addChild(_loc1_.backgroundBitmap);
         _loc1_.backgroundBitmap.x = -24;
         _loc1_.backgroundBitmap.y = -40;
         _loc1_.diningClip.customername_txt.visible = false;
         _loc1_.diningClip.tipjar.visible = false;
         _loc1_.diningClip.stars.visible = false;
         _loc1_.diningClip.ticketmeter.visible = false;
         _loc1_.diningClip.bubbles.visible = false;
         _loc1_.diningClip.table1.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.diningClip.table2.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.diningClip.table3.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTop);
         _loc1_.diningClip.trim1.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.diningClip.trim2.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.diningClip.trim3.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.diningClip.trim4.transform.colorTransform = _loc1_.createColorTransform(_loc1_.gameObj.var_127.lobbyTrim);
         _loc1_.diningClip.coffeebuddy.visible = false;
         _loc1_.diningClip.coffee.visible = false;
         _loc1_.clip.info.holder.addChild(_loc1_.diningClip);
         _loc1_.gameObj.var_128.playMusicClip("customer_happy.wav");
      }
      
      public function setupPanelOptions() : void
      {
         var _loc1_:HireWaiterScreen = null;
         var _loc3_:MovieClip = null;
         var _loc4_:WorkerData = null;
         var _loc5_:WorkerData = null;
         var _loc6_:WorkerData = null;
         var _loc7_:WorkerData = null;
         _loc1_ = this;
         if(_loc1_.gameObj.var_127.whichCharacter == "marty")
         {
            _loc1_.panelNames.push("female","custom");
         }
         else if(_loc1_.gameObj.var_127.whichCharacter == "rita")
         {
            _loc1_.panelNames.push("male","custom");
         }
         else
         {
            _loc1_.panelNames.push("male","female","custom");
         }
         _loc1_.clip.character.marty_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPanelOne);
         _loc1_.clip.character.rita_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPanelTwo);
         _loc1_.clip.character.custom_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPanelThree);
         if(_loc1_.panelNames.length < 3)
         {
            _loc1_.clip.character.custom_panel.visible = false;
            _loc1_.clip.character.x = 227;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.panelNames.length)
         {
            if(_loc2_ == 0)
            {
               _loc3_ = _loc1_.clip.character.marty_panel;
            }
            else if(_loc2_ == 1)
            {
               _loc3_ = _loc1_.clip.character.rita_panel;
            }
            else
            {
               _loc3_ = _loc1_.clip.character.custom_panel;
            }
            if(_loc1_.panelNames[_loc2_] == "male")
            {
               _loc3_.name_txt.text = WorkerData.PREMADE_MALE_NAME;
               _loc3_.name_txt.visible = true;
               _loc3_.custom_txt.visible = false;
               (_loc4_ = new WorkerData()).setupPremadeMale();
               _loc1_.workerChuck = new Worker(_loc1_.gameObj,_loc3_,_loc4_,134,70,0.55,false,true);
               _loc1_.workerChuck.clip.stop();
            }
            else if(_loc1_.panelNames[_loc2_] == "female")
            {
               _loc3_.name_txt.text = WorkerData.PREMADE_FEMALE_NAME;
               _loc3_.name_txt.visible = true;
               _loc3_.custom_txt.visible = false;
               (_loc5_ = new WorkerData()).setupPremadeFemale();
               _loc1_.workerMandi = new Worker(_loc1_.gameObj,_loc3_,_loc5_,42,70,0.55);
               _loc1_.workerMandi.clip.stop();
            }
            else if(_loc1_.panelNames[_loc2_] == "custom")
            {
               _loc3_.name_txt.text = "Custom";
               _loc3_.name_txt.visible = false;
               _loc3_.custom_txt.visible = true;
               (_loc6_ = new WorkerData()).setupDefaults();
               _loc6_.setGender(WorkerData.GENDER_MALE);
               _loc6_.skinTone = 13537877;
               _loc6_.eyeStyle = 2;
               _loc6_.eyeDefaultExpression = 1;
               _loc6_.mouthDefaultExpression = 12;
               _loc6_.hairColor = 5718573;
               _loc6_.hair = "hair_messyfront2";
               _loc6_.facialhair = "goatee2";
               _loc6_.accd = "tint_glasses03:DG";
               _loc6_.eyeHeight = 2;
               _loc6_.eyeSpacing = 0;
               _loc6_.mouthHeight = -2;
               _loc6_.headHeight = -3;
               _loc6_.headForward = 6;
               _loc1_.workerCustom1 = new Worker(_loc1_.gameObj,_loc3_,_loc6_,92,70,0.55,false,true);
               _loc1_.workerCustom1.clip.stop();
               (_loc7_ = new WorkerData()).setupDefaults();
               _loc7_.setGender(WorkerData.GENDER_FEMALE);
               _loc7_.skinTone = 15511933;
               _loc7_.eyeStyle = 10;
               _loc7_.eyeDefaultExpression = 15;
               _loc7_.mouthDefaultExpression = 1;
               _loc7_.hairColor = 16044913;
               _loc7_.hair = "hair_waveM";
               _loc7_.eyeHeight = 4;
               _loc7_.mouthHeight = 3;
               _loc1_.workerCustom2 = new Worker(_loc1_.gameObj,_loc3_,_loc7_,83,70,0.55);
               _loc1_.workerCustom2.clip.stop();
            }
            _loc2_++;
         }
      }
      
      public function clickCustom(param1:MouseEvent) : void
      {
         var _loc2_:HireWaiterScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.selectedCharacter = "custom";
         _loc2_.gameObj.workerData.setupDefaults();
         _loc2_.clip.character.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
      }
      
      public function animateScreen(param1:Event) : void
      {
         var _loc2_:HireWaiterScreen = this;
         if(_loc2_.isClosing)
         {
            if(_loc2_.clip.character.currentFrame == _loc2_.clip.character.totalFrames)
            {
               _loc2_.closeHireWaiterScreen();
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:HireWaiterScreen = this;
         _loc1_.diningClip.backdrop_holder.removeChild(_loc1_.backgroundBitmap);
         _loc1_.backgroundBitmap.bitmapData.dispose();
         _loc1_.backgroundBitmap.bitmapData = null;
         _loc1_.backgroundBitmap = null;
         _loc1_.clip.info.holder.removeChild(_loc1_.diningClip);
         _loc1_.diningClip = null;
         _loc1_.clip.continue_btn.removeEventListener(MouseEvent.MOUSE_DOWN,_loc1_.clickContinue);
         if(_loc1_.workerChuck)
         {
            _loc1_.workerChuck.destroy();
            _loc1_.workerChuck = null;
         }
         if(_loc1_.workerMandi)
         {
            _loc1_.workerMandi.destroy();
            _loc1_.workerMandi = null;
         }
         if(_loc1_.workerCustom1)
         {
            _loc1_.workerCustom1.destroy();
            _loc1_.workerCustom1 = null;
         }
         if(_loc1_.workerCustom2)
         {
            _loc1_.workerCustom2.destroy();
            _loc1_.workerCustom2 = null;
         }
         if(_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.animateScreen);
         }
         _loc1_.clip.character.marty_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPanelOne);
         _loc1_.clip.character.rita_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPanelTwo);
         _loc1_.clip.character.custom_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickPanelThree);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function startClosingScreen() : void
      {
         var _loc1_:HireWaiterScreen = this;
         _loc1_.isClosing = true;
      }
      
      public function closeHireWaiterScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:HireWaiterScreen = this;
         _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.animateScreen);
         if(_loc2_.selectedCharacter == "custom")
         {
            _loc2_.gameObj.method_184(-1,true);
         }
         else
         {
            _loc2_.gameObj.method_134(true);
         }
         _loc2_.gameObj.method_280();
      }
      
      public function clickPanelOne(param1:MouseEvent) : void
      {
         var _loc2_:HireWaiterScreen = this;
         if(!_loc2_.isClosing)
         {
            _loc2_.chooseType(_loc2_.panelNames[0]);
         }
      }
      
      public function clickPanelTwo(param1:MouseEvent) : void
      {
         var _loc2_:HireWaiterScreen = this;
         if(!_loc2_.isClosing)
         {
            _loc2_.chooseType(_loc2_.panelNames[1]);
         }
      }
      
      public function clickPanelThree(param1:MouseEvent) : void
      {
         var _loc2_:HireWaiterScreen = this;
         if(!_loc2_.isClosing)
         {
            if(_loc2_.panelNames.length > 2)
            {
               _loc2_.chooseType(_loc2_.panelNames[2]);
            }
         }
      }
      
      public function chooseType(param1:String) : void
      {
         var _loc2_:HireWaiterScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(param1 == "male" || param1 == "female")
         {
            if(param1 == "male")
            {
               _loc2_.selectedCharacter = "marty";
               _loc2_.gameObj.var_143.setupPremadeMale();
               _loc2_.gameObj.var_127.setWaiter(WorkerData.PREMADE_MALE_NAME,"marty",_loc2_.gameObj.var_134.getSKUsForInventory("marty",WorkerData.GENDER_MALE,true));
            }
            else if(param1 == "female")
            {
               _loc2_.selectedCharacter = "rita";
               _loc2_.gameObj.var_143.setupPremadeFemale();
               _loc2_.gameObj.var_127.setWaiter(WorkerData.PREMADE_FEMALE_NAME,"rita",_loc2_.gameObj.var_134.getSKUsForInventory("rita",WorkerData.GENDER_FEMALE,true));
            }
         }
         else
         {
            _loc2_.selectedCharacter = "custom";
            _loc2_.gameObj.var_143.setupDefaults();
         }
         _loc2_.clip.character.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
      }
      
      public function clickContinue(param1:MouseEvent) : void
      {
         var _loc2_:HireWaiterScreen = this;
         _loc2_.clip.continue_btn.visible = false;
         _loc2_.clip.chooselabel.visible = true;
         _loc2_.clip.info.mouseEnabled = false;
         _loc2_.clip.info.mouseChildren = false;
         _loc2_.clip.fader.gotoAndPlay(17);
         _loc2_.clip.character.gotoAndPlay("show");
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      private function createLobbyBackdropBitmap() : Bitmap
      {
         var _loc4_:Number = NaN;
         var _loc1_:HireWaiterScreen = this;
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
      
      private function createColorTransform(param1:Number) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = ((param1 & 16711680) >>> 16) / 255;
         _loc2_.greenMultiplier = ((param1 & 65280) >>> 8) / 255;
         _loc2_.blueMultiplier = (param1 & 255) / 255;
         return _loc2_;
      }
   }
}
