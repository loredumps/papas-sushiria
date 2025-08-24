package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_1.class_1;
   import package_2.class_3;
   import package_4.class_5;
   import sushiGame.data.UserData;
   import sushiGame.data.WorkerData;
   import sushiGame.models.Worker;
   
   public class IntroScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var didSkip:Boolean = false;
      
      public var worker:Worker = null;
      
      public var workerFlipped:Worker = null;
      
      public var workerTurned:Worker = null;
      
      public var workerTurnedFlipped:Worker = null;
      
      public function IntroScreen(param1:class_5)
      {
         super();
         var _loc2_:IntroScreen = this;
         _loc2_.gameObj = param1;
         _loc2_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:IntroScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new introMC();
         _loc1_.gameObj.var_139.addChild(_loc1_.clip);
         _loc1_.clip.x = 0;
         _loc1_.clip.y = 0;
         var _loc3_:WorkerData = new WorkerData(_loc1_.gameObj.workerData.getDataToSave());
         if(_loc2_.whichCharacter == "marty")
         {
            _loc3_.shirt = "tint_polo_open:A-W";
            _loc3_.pants = "tint_pants_10:DU-BS";
            _loc3_.jacket = "";
            _loc3_.shoes = "tint_shoes7:KH-K-W";
            _loc3_.acca = "";
            _loc3_.accb = "tint_belt_1:K-GR";
            _loc3_.accd = "tint_glasses12:DG";
            _loc3_.hat = "";
         }
         else if(_loc2_.whichCharacter == "rita")
         {
            _loc3_.shirt = "tint_buttondowntucked:K-K";
            _loc3_.pants = "tint_skirt_1:W";
            _loc3_.jacket = "";
            _loc3_.shoes = "tint_shoes3:K-K-K";
            _loc3_.acca = "tint_necktie";
            _loc3_.accb = "tint_cloverbelt:K-W-GR";
            _loc3_.accc = "";
            _loc3_.accd = "";
            _loc3_.hat = "tint_checker_hairband:W-K";
         }
         else if(_loc3_.gender == WorkerData.GENDER_FEMALE)
         {
            _loc3_.shirt = "tint_buttondowntucked:T-W";
            _loc3_.pants = "tint_pants_1:K";
            _loc3_.jacket = "";
            _loc3_.shoes = "tint_shoes1:K-K-W";
            _loc3_.acca = "";
            _loc3_.accb = "tint_belt_1:K-GR";
            _loc3_.accc = "";
            _loc3_.hat = "";
         }
         else
         {
            _loc3_.shirt = "tint_polo_open:DU-W";
            _loc3_.pants = "tint_pants_1:K";
            _loc3_.jacket = "";
            _loc3_.shoes = "tint_shoes1:K-K-W";
            _loc3_.acca = "";
            _loc3_.accb = "tint_belt_1:K-GR";
            _loc3_.accc = "";
            _loc3_.hat = "";
         }
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip,_loc3_,0,0,1);
         _loc1_.workerFlipped = new Worker(_loc1_.gameObj,_loc1_.clip,_loc3_,0,0,1,false,true);
         _loc1_.workerTurned = new Worker(_loc1_.gameObj,_loc1_.clip,_loc3_,0,0,1,true);
         _loc1_.workerTurnedFlipped = new Worker(_loc1_.gameObj,_loc1_.clip,_loc3_,0,0,1,true,true);
         _loc1_.worker.clip.visible = false;
         _loc1_.workerFlipped.clip.visible = false;
         _loc1_.workerTurned.clip.visible = false;
         _loc1_.workerTurnedFlipped.clip.visible = false;
         _loc1_.clip.frame0.title_txt.text = String(_loc2_.myName + "\'s\nUnlucky Day");
         if(class_3.method_56() && class_1.method_82() == false)
         {
            _loc1_.clip.frame0.title_txt.text = String("Your\nUnlucky Day");
         }
         _loc1_.clip.frame0.title_txt.cacheAsBitmap = true;
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.checkFrame);
         _loc1_.clip.gotoAndPlay(1);
         _loc1_.clip.skip_btn.addEventListener(MouseEvent.CLICK,_loc1_.clickSkip);
         _loc1_.gameObj.var_128.switchMusic("other");
      }
      
      public function clickSkip(param1:MouseEvent) : void
      {
         var _loc2_:IntroScreen = this;
         _loc2_.didSkip = true;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.gotoAndStop(_loc2_.clip.totalFrames);
      }
      
      public function checkFrame(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc2_:IntroScreen = this;
         if(_loc2_.clip.currentFrame == 101)
         {
            _loc3_ = String(_loc2_.gameObj.var_127.myName).substr(0,1).toUpperCase() + String(_loc2_.gameObj.var_127.myName).substr(1);
            if(class_3.method_56() && class_1.method_82() == false)
            {
               _loc3_ = "Valued Customer";
            }
            if(_loc2_.clip)
            {
               if(_loc2_.clip.frame1)
               {
                  if(_loc2_.clip.frame1.flyer)
                  {
                     if(_loc2_.clip.frame1.flyer.name_txt)
                     {
                        _loc2_.clip.frame1.flyer.name_txt.text = "Dear " + _loc3_ + ",";
                        _loc2_.clip.frame1.flyer.name_txt.cacheAsBitmap = true;
                     }
                     else
                     {
                        trace(" --- NO name_txt");
                     }
                  }
                  else
                  {
                     trace(" --- NO flyer");
                  }
               }
               else
               {
                  trace(" --- NO frame1");
               }
            }
         }
         else if(_loc2_.clip.currentFrame == 360)
         {
            _loc2_.clip.frame2.holder.addChild(_loc2_.worker.clip);
            _loc2_.worker.clip.visible = true;
            _loc2_.worker.clip.scaleX = 2.07;
            _loc2_.worker.clip.scaleY = 2.07;
            _loc2_.worker.clip.x = 345.2;
            _loc2_.worker.clip.y = 5.8;
            _loc2_.worker.clip.gotoAndStop("intro1");
            _loc2_.worker.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 421)
         {
            _loc2_.clip.frame3.holder.addChild(_loc2_.workerTurnedFlipped.clip);
            _loc2_.workerTurnedFlipped.clip.visible = true;
            _loc2_.workerTurnedFlipped.clip.scaleX = -1.777;
            _loc2_.workerTurnedFlipped.clip.scaleY = 1.777;
            _loc2_.workerTurnedFlipped.clip.x = 699;
            _loc2_.workerTurnedFlipped.clip.y = 56.7;
            _loc2_.workerTurnedFlipped.clip.gotoAndStop("intro2");
            _loc2_.workerTurnedFlipped.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 482)
         {
            _loc2_.clip.frame4.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -1.616;
            _loc2_.workerFlipped.clip.scaleY = 1.616;
            _loc2_.workerFlipped.clip.x = 413;
            _loc2_.workerFlipped.clip.y = 172.7;
            _loc2_.workerFlipped.clip.gotoAndStop("intro3");
            _loc2_.workerFlipped.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 543)
         {
            _loc2_.clip.frame5.holder.addChild(_loc2_.worker.clip);
            _loc2_.worker.clip.visible = true;
            _loc2_.worker.clip.scaleX = 1.616;
            _loc2_.worker.clip.scaleY = 1.616;
            _loc2_.worker.clip.x = 377.7;
            _loc2_.worker.clip.y = 39.7;
            _loc2_.worker.clip.gotoAndStop("intro4");
            _loc2_.worker.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 604)
         {
            _loc2_.clip.frame6.holder.addChild(_loc2_.worker.clip);
            _loc2_.worker.clip.visible = true;
            _loc2_.worker.clip.scaleX = 1.616;
            _loc2_.worker.clip.scaleY = 1.616;
            _loc2_.worker.clip.x = 414.65;
            _loc2_.worker.clip.y = 36.75;
            _loc2_.worker.clip.gotoAndStop("intro5");
            _loc2_.worker.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 665)
         {
            _loc2_.clip.frame7.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -1.161;
            _loc2_.workerFlipped.clip.scaleY = 1.161;
            _loc2_.workerFlipped.clip.x = 489.05;
            _loc2_.workerFlipped.clip.y = 74.25;
            _loc2_.workerFlipped.clip.gotoAndStop("intro6");
            _loc2_.workerFlipped.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 787)
         {
            _loc2_.clip.frame9.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -1.616;
            _loc2_.workerFlipped.clip.scaleY = 1.616;
            _loc2_.workerFlipped.clip.x = 347.1;
            _loc2_.workerFlipped.clip.y = -15.1;
            _loc2_.workerFlipped.clip.gotoAndStop("intro7");
            _loc2_.workerFlipped.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 1010)
         {
            _loc2_.clip.frame12.holder.addChild(_loc2_.worker.clip);
            _loc2_.worker.clip.visible = true;
            _loc2_.worker.clip.scaleX = 1.718;
            _loc2_.worker.clip.scaleY = 1.718;
            _loc2_.worker.clip.x = 160.25;
            _loc2_.worker.clip.y = 39.75;
            _loc2_.worker.clip.gotoAndStop("intro8");
            _loc2_.worker.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 1132)
         {
            _loc2_.clip.frame14.holder.addChild(_loc2_.workerTurned.clip);
            _loc2_.workerTurned.clip.visible = true;
            _loc2_.workerTurned.clip.scaleX = 1.428;
            _loc2_.workerTurned.clip.scaleY = 1.428;
            _loc2_.workerTurned.clip.x = -39.35;
            _loc2_.workerTurned.clip.y = 114.4;
            _loc2_.workerTurned.clip.gotoAndStop("intro9");
            _loc2_.workerTurned.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 1203)
         {
            _loc2_.clip.frame15.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -2.112;
            _loc2_.workerFlipped.clip.scaleY = 2.112;
            _loc2_.workerFlipped.clip.x = 490.5;
            _loc2_.workerFlipped.clip.y = 23.55;
            _loc2_.workerFlipped.clip.gotoAndStop("intro10");
            _loc2_.workerFlipped.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 1341)
         {
            _loc2_.clip.frame17.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -2.112;
            _loc2_.workerFlipped.clip.scaleY = 2.112;
            _loc2_.workerFlipped.clip.x = 366.8;
            _loc2_.workerFlipped.clip.y = -40;
            _loc2_.workerFlipped.clip.gotoAndStop("intro11");
            _loc2_.workerFlipped.animateModel();
         }
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.checkFrame);
            _loc2_.gameObj.method_144();
            _loc2_.gameObj.method_286();
         }
         else if(_loc2_.clip.currentFrame == 421)
         {
            _loc2_.gameObj.var_128.switchMusic("build");
         }
         else if(_loc2_.clip.currentFrame == 726)
         {
            _loc2_.gameObj.var_128.switchMusic("bake");
            _loc2_.gameObj.var_128.playSound("minigame_burger_dropplate.wav");
         }
         else if(_loc2_.clip.currentFrame == 909)
         {
            _loc2_.gameObj.var_128.switchMusic("other");
         }
         else if(_loc2_.clip.currentFrame == 1203)
         {
            _loc2_.gameObj.var_128.switchMusic("bake");
         }
         else if(_loc2_.clip.currentFrame == 1402)
         {
            _loc2_.gameObj.var_128.switchMusic("none");
            _loc2_.gameObj.var_128.playMusicClip("endofday.wav");
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:IntroScreen = this;
         _loc1_.clip.skip_btn.removeEventListener(MouseEvent.CLICK,_loc1_.clickSkip);
         _loc1_.worker.destroy();
         _loc1_.workerTurned.destroy();
         _loc1_.workerFlipped.destroy();
         _loc1_.workerTurnedFlipped.destroy();
         _loc1_.worker = null;
         _loc1_.workerTurned = null;
         _loc1_.workerFlipped = null;
         _loc1_.workerTurnedFlipped = null;
         try
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.checkFrame);
         }
         catch(err:Error)
         {
         }
         _loc1_.gameObj.var_139.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
