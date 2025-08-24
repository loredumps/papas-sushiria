package sushiGame.screens
{
   import fl.controls.TextInput;
   import flash.display.*;
   import flash.events.*;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.ui.*;
   import package_3.class_17;
   import package_3.class_4;
   import package_4.class_5;
   import sushiGame.data.UserData;
   import sushiGame.data.WorkerData;
   import sushiGame.models.Worker;
   
   public class SlotSelectScreen
   {
       
      
      public var gameObj:class_5;
      
      public var container:MovieClip;
      
      public var clip:MovieClip;
      
      public var selectedSlot:Number = 0;
      
      public var isClosing:Boolean = false;
      
      public var isNewSlot:Boolean = false;
      
      public var currentMode:String = "slots";
      
      public var nameContinueButton:class_17;
      
      public var nameBackButton:class_17;
      
      public var selectedCharacter:String = "marty";
      
      public var workerChuck:Worker = null;
      
      public var workerMandi:Worker = null;
      
      public var workerCustom1:Worker = null;
      
      public var workerCustom2:Worker = null;
      
      public var missingWidget:MovieClip;
      
      public var kernFormat:TextFormat = null;
      
      public function SlotSelectScreen(param1:class_5, param2:MovieClip, param3:Object = null)
      {
         super();
         var _loc4_:SlotSelectScreen;
         (_loc4_ = this).gameObj = param1;
         _loc4_.container = param2;
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc5_:MovieClip = null;
         var _loc1_:SlotSelectScreen = this;
         _loc1_.clip = new slotSelectMC();
         _loc1_.kernFormat = new TextFormat();
         _loc1_.kernFormat.kerning = true;
         var _loc2_:int = 1;
         while(_loc2_ <= 3)
         {
            (_loc5_ = _loc1_.clip.slots["slot" + _loc2_ + "MC"]).new_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickNewSlot);
            _loc5_.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickExistingSlot);
            _loc5_.delete_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickDeleteSlot);
            _loc5_.new_btn.tabEnabled = false;
            _loc5_.select_btn.tabEnabled = false;
            _loc5_.delete_btn.tabEnabled = false;
            _loc5_.confirmMC.yes_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickDeleteYes);
            _loc5_.confirmMC.no_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickDeleteNo);
            _loc5_.confirmMC.yes_btn.tabEnabled = false;
            _loc5_.confirmMC.no_btn.tabEnabled = false;
            _loc5_.savebackup_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickSaveBackup);
            _loc5_.loadbackup_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickLoadBackup);
            _loc5_.savebackup_btn.tabEnabled = false;
            _loc5_.loadbackup_btn.tabEnabled = false;
            _loc5_.confirmMC.visible = false;
            _loc2_++;
         }
         _loc1_.nameBackButton = new class_17(null,"< BACK","small","button","clickNameCancel",null,false,false,false,null,false,112);
         _loc1_.nameBackButton.x = 0;
         _loc1_.nameBackButton.y = 75;
         _loc1_.nameContinueButton = new class_17(null,"CONTINUE >","small","button","clickNameOK",null,false,false,false,null,false,112);
         _loc1_.nameContinueButton.x = 181;
         _loc1_.nameContinueButton.y = 75;
         _loc1_.clip.entername.input_holder.addChild(_loc1_.nameBackButton);
         _loc1_.clip.entername.input_holder.addChild(_loc1_.nameContinueButton);
         _loc1_.nameContinueButton.addEventListener("clickNameOK",_loc1_.clickEnterNameOK);
         _loc1_.nameBackButton.addEventListener("clickNameCancel",_loc1_.clickEnterNameCancel);
         _loc1_.clip.character.marty_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickMarty);
         _loc1_.clip.character.rita_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickRita);
         _loc1_.clip.character.custom_panel.select_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickCustom);
         _loc1_.clip.character.marty_panel.name_txt.text = WorkerData.PREMADE_MALE_NAME;
         _loc1_.clip.character.marty_panel.name_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.character.marty_panel.name_txt.visible = true;
         _loc1_.clip.character.marty_panel.custom_txt.visible = false;
         _loc1_.clip.character.rita_panel.name_txt.text = WorkerData.PREMADE_FEMALE_NAME;
         _loc1_.clip.character.rita_panel.name_txt.setTextFormat(_loc1_.kernFormat);
         _loc1_.clip.character.rita_panel.name_txt.visible = true;
         _loc1_.clip.character.rita_panel.custom_txt.visible = false;
         _loc1_.clip.character.custom_panel.name_txt.text = "Custom";
         _loc1_.clip.character.custom_panel.name_txt.visible = false;
         _loc1_.clip.character.custom_panel.custom_txt.visible = true;
         var _loc3_:TextFormat = new TextFormat();
         _loc3_.font = "Arial";
         _loc3_.size = 24;
         _loc3_.bold = true;
         _loc3_.align = TextFormatAlign.CENTER;
         var _loc4_:TextInput = _loc1_.clip.entername.input_holder.input_txt;
         _loc1_.clip.entername.input_holder.input_txt.setStyle("textFormat",_loc3_);
         _loc1_.clip.entername.input_holder.input_txt.maxChars = 16;
         _loc1_.clip.entername.input_holder.input_txt.restrict = "0-9A-Za-z \'\\-";
         _loc1_.container.addEventListener("clickBack",_loc1_.clickBack);
         _loc1_.container.addChild(_loc1_.clip);
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.animateScreen);
         _loc1_.clip.addEventListener(KeyboardEvent.KEY_DOWN,_loc1_.keyListener);
         _loc1_.clip.entername.gotoAndStop(1);
         _loc1_.clip.slots.gotoAndStop(1);
         _loc1_.clip.character.gotoAndStop(1);
         _loc1_.missingWidget = _loc1_.clip.missing;
         _loc1_.gameObj.addChild(_loc1_.missingWidget);
         _loc1_.missingWidget.visible = false;
         _loc1_.missingWidget.mouseEnabled = true;
         _loc1_.missingWidget.mouseChildren = true;
         _loc1_.missingWidget.buttonMode = true;
         _loc1_.missingWidget.useHandCursor = true;
         _loc1_.missingWidget.addEventListener(MouseEvent.CLICK,_loc1_.clickMissingWidget);
         _loc1_.showSlots();
         class_4.method_79(_loc1_.gameObj,6,387,480);
      }
      
      public function keyListener(param1:KeyboardEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         if(_loc2_.currentMode == "entername" && param1.keyCode == Keyboard.ENTER)
         {
            _loc2_.clickEnterNameOK();
         }
      }
      
      public function clickBack(param1:Event) : void
      {
         var _loc2_:SlotSelectScreen = this;
         class_4.method_99();
         _loc2_.gameObj.var_130.api.method_106("SplashScreen");
         _loc2_.gameObj.var_130.api.method_107("SlotSelect");
      }
      
      public function getSlotData() : void
      {
         var _loc2_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:MovieClip = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc1_:SlotSelectScreen = this;
         var _loc3_:Boolean = true;
         var _loc4_:int = 1;
         while(_loc4_ <= 3)
         {
            _loc5_ = _loc1_.gameObj.var_127.loadLabelsForSlot(_loc4_);
            _loc6_ = _loc1_.clip.slots["slot" + _loc4_ + "MC"];
            if(_loc5_)
            {
               _loc6_.name_txt.text = String(_loc5_.name);
               _loc6_.textclip.visible = true;
               _loc6_.textclip.rank_txt.text = _loc5_.rank;
               _loc6_.textclip.rank_title.text = _loc5_.title;
               _loc6_.select_btn.visible = true;
               _loc6_.new_btn.visible = false;
               _loc6_.delete_btn.visible = true;
               _loc7_ = 0;
               _loc8_ = 0;
               _loc2_ = 1;
               while(_loc2_ < _loc5_.gold.length)
               {
                  if(_loc5_.gold[_loc2_] >= 3)
                  {
                     _loc7_++;
                  }
                  _loc8_++;
                  _loc2_++;
               }
               _loc6_.textclip.gold_txt.text = _loc7_;
               _loc6_.textclip.gold_txt.setTextFormat(_loc1_.kernFormat);
               _loc6_.textclip.goldslash.x = _loc6_.textclip.gold_txt.x + _loc6_.textclip.gold_txt.textWidth + 4;
               _loc6_.textclip.gold_txt.text += "  " + _loc8_;
               _loc9_ = 0;
               _loc10_ = _loc1_.gameObj.var_136.badges.length;
               _loc2_ = 0;
               while(_loc2_ < _loc5_.stickers.length)
               {
                  if(_loc5_.stickers[_loc2_] == 1)
                  {
                     _loc9_++;
                  }
                  _loc2_++;
               }
               _loc6_.textclip.stickers_txt.text = _loc9_;
               _loc6_.textclip.stickers_txt.setTextFormat(_loc1_.kernFormat);
               _loc6_.textclip.stickerslash.x = _loc6_.textclip.stickers_txt.x + _loc6_.textclip.stickers_txt.textWidth + 4;
               _loc6_.textclip.stickers_txt.text += "  " + _loc10_;
               if(_loc1_.gameObj.var_130.method_130())
               {
                  _loc6_.savebackup_btn.visible = true;
                  _loc6_.loadbackup_btn.visible = false;
               }
               else
               {
                  _loc6_.savebackup_btn.visible = false;
                  _loc6_.loadbackup_btn.visible = false;
               }
               _loc6_.textclip.gold_txt.setTextFormat(_loc1_.kernFormat);
               _loc6_.textclip.stickers_txt.setTextFormat(_loc1_.kernFormat);
               _loc6_.name_txt.setTextFormat(_loc1_.kernFormat);
               _loc6_.textclip.rank_txt.setTextFormat(_loc1_.kernFormat);
               _loc6_.textclip.rank_title.setTextFormat(_loc1_.kernFormat);
               _loc3_ = false;
            }
            else
            {
               _loc6_.name_txt.text = "Empty Slot";
               _loc6_.textclip.visible = false;
               _loc6_.new_btn.visible = true;
               _loc6_.select_btn.visible = false;
               _loc6_.delete_btn.visible = false;
               _loc6_.name_txt.setTextFormat(_loc1_.kernFormat);
               if(_loc1_.gameObj.var_130.method_130())
               {
                  _loc6_.savebackup_btn.visible = false;
                  _loc6_.loadbackup_btn.visible = true;
               }
               else
               {
                  _loc6_.savebackup_btn.visible = false;
                  _loc6_.loadbackup_btn.visible = false;
               }
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            _loc1_.missingWidget.visible = true;
         }
         else
         {
            _loc1_.missingWidget.visible = false;
         }
      }
      
      public function clickNewSlot(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = 0;
         if(param1.currentTarget == _loc2_.clip.slots.slot1MC.new_btn)
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot2MC.new_btn)
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot3MC.new_btn)
         {
            _loc4_ = 3;
         }
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.selectedSlot = _loc4_;
         _loc2_.isNewSlot = true;
         _loc2_.showCharacter();
         _loc2_.gameObj.var_130.method_117("start");
      }
      
      public function clickExistingSlot(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = 0;
         if(param1.currentTarget == _loc2_.clip.slots.slot1MC.select_btn)
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot2MC.select_btn)
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot3MC.select_btn)
         {
            _loc4_ = 3;
         }
         _loc3_.loadData(_loc4_);
         _loc2_.isNewSlot = false;
         _loc2_.gameObj.var_128.playSound("dropticket.wav");
         _loc2_.clip.slots.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
         _loc2_.gameObj.var_130.method_117("start");
      }
      
      public function clickSaveBackup(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = 0;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(param1.currentTarget == _loc2_.clip.slots.slot1MC.savebackup_btn)
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot2MC.savebackup_btn)
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot3MC.savebackup_btn)
         {
            _loc4_ = 3;
         }
         if(_loc4_ != 0)
         {
            _loc2_.gameObj.var_130.api.method_143(_loc3_.loadSlotDataForBackup(_loc4_),_loc3_.saveSlotPrefix,"papassushiria_backup_" + _loc4_,null);
         }
      }
      
      public function clickLoadBackup(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = 0;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         if(param1.currentTarget == _loc2_.clip.slots.slot1MC.loadbackup_btn)
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot2MC.loadbackup_btn)
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot3MC.loadbackup_btn)
         {
            _loc4_ = 3;
         }
         if(_loc4_ != 0)
         {
            _loc2_.gameObj.var_130.api.method_162(_loc4_,_loc3_.saveSlotPrefix,"/",_loc2_.showSlots);
         }
      }
      
      public function clickMissingWidget(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.gameObj.var_130.api.method_257(_loc2_.gameObj.var_130.method_130());
      }
      
      public function clickDeleteSlot(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         0;
         if(param1.currentTarget == _loc2_.clip.slots.slot1MC.delete_btn)
         {
            _loc2_.clip.slots.slot1MC.confirmMC.visible = true;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot2MC.delete_btn)
         {
            _loc2_.clip.slots.slot2MC.confirmMC.visible = true;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot3MC.delete_btn)
         {
            _loc2_.clip.slots.slot3MC.confirmMC.visible = true;
         }
      }
      
      public function clickDeleteYes(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         var _loc4_:Number = 0;
         if(param1.currentTarget == _loc2_.clip.slots.slot1MC.confirmMC.yes_btn)
         {
            _loc4_ = 1;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot2MC.confirmMC.yes_btn)
         {
            _loc4_ = 2;
         }
         else if(param1.currentTarget == _loc2_.clip.slots.slot3MC.confirmMC.yes_btn)
         {
            _loc4_ = 3;
         }
         if(_loc4_ > 0)
         {
            _loc2_.gameObj.var_128.playSound("droptopping.wav");
            _loc3_.eraseSlot(_loc4_);
            _loc2_.showSlots();
         }
         else
         {
            trace("Unknown Target: " + param1.currentTarget);
         }
      }
      
      public function clickDeleteNo(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.clip.slots.slot1MC.confirmMC.visible = false;
         _loc2_.clip.slots.slot2MC.confirmMC.visible = false;
         _loc2_.clip.slots.slot3MC.confirmMC.visible = false;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
      }
      
      public function clickEnterNameOK(param1:Event = null) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.gameObj.var_127.createNewSlot(_loc2_.selectedSlot,_loc2_.clip.entername.input_holder.input_txt.text,_loc2_.selectedCharacter);
         _loc2_.clip.entername.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
      }
      
      public function clickEnterNameCancel(param1:Event = null) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.showSlots();
      }
      
      public function clickMarty(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.selectedCharacter = "marty";
         _loc2_.gameObj.var_127.createNewSlot(_loc2_.selectedSlot,WorkerData.PREMADE_MALE_NAME,_loc2_.selectedCharacter);
         _loc2_.clip.character.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
      }
      
      public function clickRita(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.selectedCharacter = "rita";
         _loc2_.gameObj.var_127.createNewSlot(_loc2_.selectedSlot,WorkerData.PREMADE_FEMALE_NAME,_loc2_.selectedCharacter);
         _loc2_.clip.character.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
      }
      
      public function clickCustom(param1:MouseEvent) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.selectedCharacter = "custom";
         _loc2_.gameObj.workerData.setupDefaults();
         _loc2_.clip.character.gotoAndPlay("hide");
         _loc2_.startClosingScreen();
      }
      
      public function showSlots() : void
      {
         var _loc1_:SlotSelectScreen = this;
         _loc1_.currentMode = "slots";
         _loc1_.clip.slots.slot1MC.confirmMC.visible = false;
         _loc1_.clip.slots.slot2MC.confirmMC.visible = false;
         _loc1_.clip.slots.slot3MC.confirmMC.visible = false;
         _loc1_.getSlotData();
         if(_loc1_.clip.entername.currentFrame > 1 && _loc1_.clip.entername.currentFrame < _loc1_.clip.entername.totalFrames)
         {
            _loc1_.clip.entername.gotoAndPlay("hide");
         }
         if(_loc1_.clip.character.currentFrame > 1 && _loc1_.clip.character.currentFrame < _loc1_.clip.character.totalFrames)
         {
            _loc1_.clip.character.gotoAndPlay("hide");
         }
         _loc1_.gameObj.var_128.playSound("trayslide.wav");
         _loc1_.clip.slots.gotoAndPlay("show");
      }
      
      public function showCharacter() : void
      {
         var _loc1_:SlotSelectScreen = this;
         _loc1_.currentMode = "character";
         var _loc2_:WorkerData = new WorkerData();
         _loc2_.setupPremadeMale();
         _loc1_.workerChuck = new Worker(_loc1_.gameObj,_loc1_.clip.character.marty_panel,_loc2_,134,70,0.55,false,true);
         _loc1_.workerChuck.clip.stop();
         var _loc3_:WorkerData = new WorkerData();
         _loc3_.setupPremadeFemale();
         _loc1_.workerMandi = new Worker(_loc1_.gameObj,_loc1_.clip.character.rita_panel,_loc3_,42,70,0.55);
         _loc1_.workerMandi.clip.stop();
         var _loc4_:WorkerData;
         (_loc4_ = new WorkerData()).setupDefaults();
         _loc4_.setGender(WorkerData.GENDER_MALE);
         _loc4_.skinTone = 13537877;
         _loc4_.eyeStyle = 2;
         _loc4_.eyeDefaultExpression = 1;
         _loc4_.mouthDefaultExpression = 12;
         _loc4_.hairColor = 5718573;
         _loc4_.hair = "hair_messyfront2";
         _loc4_.facialhair = "goatee2";
         _loc4_.accd = "tint_glasses03:DG";
         _loc4_.eyeHeight = 2;
         _loc4_.eyeSpacing = 0;
         _loc4_.mouthHeight = -2;
         _loc4_.headHeight = -3;
         _loc4_.headForward = 6;
         _loc1_.workerCustom1 = new Worker(_loc1_.gameObj,_loc1_.clip.character.custom_panel,_loc4_,92,70,0.55,false,true);
         _loc1_.workerCustom1.clip.stop();
         var _loc5_:WorkerData;
         (_loc5_ = new WorkerData()).setupDefaults();
         _loc5_.setGender(WorkerData.GENDER_FEMALE);
         _loc5_.skinTone = 15511933;
         _loc5_.eyeStyle = 10;
         _loc5_.eyeDefaultExpression = 15;
         _loc5_.mouthDefaultExpression = 1;
         _loc5_.hairColor = 16239685;
         _loc5_.hair = "hair_waveM";
         _loc5_.bangs = "hairparts_b_clip";
         _loc5_.eyeHeight = 4;
         _loc5_.mouthHeight = 3;
         _loc1_.workerCustom2 = new Worker(_loc1_.gameObj,_loc1_.clip.character.custom_panel,_loc5_,83,70,0.55);
         _loc1_.workerCustom2.clip.stop();
         if(_loc1_.clip.entername.currentFrame > 1 && _loc1_.clip.entername.currentFrame < _loc1_.clip.entername.totalFrames)
         {
            _loc1_.clip.entername.gotoAndPlay("hide");
         }
         if(_loc1_.clip.slots.currentFrame > 1 && _loc1_.clip.slots.currentFrame < _loc1_.clip.slots.totalFrames)
         {
            _loc1_.clip.slots.gotoAndPlay("hide");
         }
         _loc1_.clip.character.gotoAndPlay("show");
         _loc1_.gameObj.var_130.api.method_133("CHOOSE YOUR CHARACTER");
      }
      
      public function showEnterName() : void
      {
         var _loc1_:SlotSelectScreen = this;
         _loc1_.currentMode = "entername";
         _loc1_.clip.entername.input_holder.input_txt.text = "";
         _loc1_.clip.entername.input_holder.input_txt.setFocus();
         if(_loc1_.clip.slots.currentFrame > 1 && _loc1_.clip.slots.currentFrame < _loc1_.clip.slots.totalFrames)
         {
            _loc1_.clip.slots.gotoAndPlay("hide");
         }
         if(_loc1_.clip.character.currentFrame > 1 && _loc1_.clip.character.currentFrame < _loc1_.clip.character.totalFrames)
         {
            _loc1_.clip.character.gotoAndPlay("hide");
         }
         _loc1_.clip.entername.gotoAndPlay("show");
         _loc1_.gameObj.var_130.api.method_133("ENTER YOUR NAME");
      }
      
      public function animateScreen(param1:Event) : void
      {
         var _loc2_:SlotSelectScreen = this;
         if(_loc2_.isClosing)
         {
            if(_loc2_.currentMode == "character" && _loc2_.clip.character.currentFrame == _loc2_.clip.character.totalFrames)
            {
               _loc2_.closeSlotSelectScreen();
            }
            else if(_loc2_.currentMode == "slots" && _loc2_.clip.slots.currentFrame == _loc2_.clip.slots.totalFrames)
            {
               _loc2_.closeSlotSelectScreen();
            }
         }
      }
      
      public function clickStart(param1:Event) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.clip.iris.gotoAndPlay("irisout");
         _loc2_.gameObj.var_130.api.method_126("SlotSelectScreen");
      }
      
      public function destroy() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:SlotSelectScreen = this;
         _loc1_.kernFormat = null;
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
         _loc1_.missingWidget.removeEventListener(MouseEvent.CLICK,_loc1_.clickMissingWidget);
         _loc1_.missingWidget.parent.removeChild(_loc1_.missingWidget);
         _loc1_.missingWidget = null;
         if(_loc1_.clip.hasEventListener(Event.ENTER_FRAME))
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.animateScreen);
         }
         _loc1_.container.removeEventListener("clickBack",_loc1_.clickBack);
         var _loc2_:int = 1;
         while(_loc2_ <= 3)
         {
            _loc3_ = _loc1_.clip.slots["slot" + _loc2_ + "MC"];
            _loc3_.new_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickNewSlot);
            _loc3_.select_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickExistingSlot);
            _loc3_.delete_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickDeleteSlot);
            _loc3_.confirmMC.yes_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickDeleteYes);
            _loc3_.confirmMC.no_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickDeleteNo);
            _loc3_.savebackup_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickSaveBackup);
            _loc3_.loadbackup_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickLoadBackup);
            _loc2_++;
         }
         _loc1_.clip.entername.input_holder.removeChild(_loc1_.nameContinueButton);
         _loc1_.clip.entername.input_holder.removeChild(_loc1_.nameBackButton);
         _loc1_.nameContinueButton.removeEventListener("clickNameOK",_loc1_.clickEnterNameOK);
         _loc1_.nameBackButton.removeEventListener("clickNameCancel",_loc1_.clickEnterNameCancel);
         _loc1_.nameContinueButton.destroy();
         _loc1_.nameBackButton.destroy();
         _loc1_.nameContinueButton = null;
         _loc1_.nameBackButton = null;
         _loc1_.clip.character.marty_panel.select_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickMarty);
         _loc1_.clip.character.rita_panel.select_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickRita);
         _loc1_.clip.removeEventListener(KeyboardEvent.KEY_DOWN,_loc1_.keyListener);
         _loc1_.container.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
      
      public function startClosingScreen() : void
      {
         var _loc1_:SlotSelectScreen = this;
         _loc1_.isClosing = true;
         _loc1_.missingWidget.visible = false;
         _loc1_.gameObj.var_130.api.method_126();
         class_4.method_99();
      }
      
      public function closeSlotSelectScreen(param1:MouseEvent = null) : void
      {
         var _loc2_:SlotSelectScreen = this;
         _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.animateScreen);
         if(_loc2_.isNewSlot && _loc2_.selectedCharacter == "custom")
         {
            _loc2_.gameObj.method_184(_loc2_.selectedSlot);
         }
         else if(_loc2_.isNewSlot && _loc2_.gameObj.var_127.currentDay == 1)
         {
            _loc2_.gameObj.method_198();
         }
         else
         {
            _loc2_.gameObj.method_144();
         }
         _loc2_.gameObj.var_130.api.method_107("SlotSelect");
      }
   }
}
