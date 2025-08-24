package sushiGame.screens
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import package_2.class_6;
   import package_4.class_5;
   import sushiGame.data.UserData;
   import sushiGame.models.Worker;
   
   public class OutroScreen
   {
       
      
      public var gameObj:class_5;
      
      public var clip:MovieClip;
      
      public var didSkip:Boolean = false;
      
      public var replay:Boolean = false;
      
      public var worker:Worker = null;
      
      public var workerTurned:Worker = null;
      
      public var workerFlipped:Worker = null;
      
      public var server:Worker = null;
      
      public var completeFunction:Function = null;
      
      public function OutroScreen(param1:class_5, param2:Boolean = false, param3:Function = null)
      {
         super();
         var _loc4_:OutroScreen = this;
         class_6.method_1("Outro!");
         _loc4_.gameObj = param1;
         _loc4_.replay = param2;
         _loc4_.completeFunction = param3;
         _loc4_.setupScreen();
      }
      
      public function setupScreen() : void
      {
         var _loc1_:OutroScreen = this;
         var _loc2_:UserData = _loc1_.gameObj.var_127;
         _loc1_.clip = new outroMC();
         _loc1_.gameObj.var_150.addChild(_loc1_.clip);
         _loc1_.clip.x = 0;
         _loc1_.clip.y = 0;
         _loc1_.clip.addEventListener(Event.ENTER_FRAME,_loc1_.checkFrame);
         _loc1_.clip.gotoAndPlay(1);
         _loc1_.gameObj.var_128.switchMusic("build");
         _loc1_.worker = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.workerData,0,0,1);
         _loc1_.workerFlipped = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.workerData,0,0,1,false,true);
         _loc1_.workerTurned = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.workerData,0,0,1,true,false);
         _loc1_.server = new Worker(_loc1_.gameObj,_loc1_.clip,_loc1_.gameObj.var_143,0,0,1,false,true);
         _loc1_.worker.clip.visible = false;
         _loc1_.workerFlipped.clip.visible = false;
         _loc1_.workerTurned.clip.visible = false;
         _loc1_.server.clip.visible = false;
      }
      
      public function clickSkip(param1:MouseEvent) : void
      {
         var _loc2_:OutroScreen = this;
         _loc2_.didSkip = true;
         _loc2_.gameObj.var_128.playSound("buttonclick.wav");
         _loc2_.clip.gotoAndStop(_loc2_.clip.totalFrames);
      }
      
      public function checkFrame(param1:Event) : void
      {
         var _loc2_:OutroScreen = this;
         var _loc3_:UserData = _loc2_.gameObj.var_127;
         if(_loc2_.clip.currentFrame == 160)
         {
            _loc2_.clip.frame2.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -1.161;
            _loc2_.workerFlipped.clip.scaleY = 1.161;
            _loc2_.workerFlipped.clip.x = 273;
            _loc2_.workerFlipped.clip.y = 64.75;
            _loc2_.workerFlipped.clip.gotoAndStop("outro1");
            _loc2_.workerFlipped.animateModel();
            _loc2_.clip.frame2.holder.addChild(_loc2_.server.clip);
            _loc2_.server.clip.visible = true;
            _loc2_.server.clip.scaleX = -1.161;
            _loc2_.server.clip.scaleY = 1.161;
            _loc2_.server.clip.x = 34.25;
            _loc2_.server.clip.y = 112.8;
            _loc2_.server.clip.gotoAndStop("outro2");
            _loc2_.server.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 237)
         {
            _loc2_.clip.frame3.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -1.395;
            _loc2_.workerFlipped.clip.scaleY = 1.395;
            _loc2_.workerFlipped.clip.x = 287.8;
            _loc2_.workerFlipped.clip.y = 2.6;
            _loc2_.workerFlipped.clip.gotoAndStop("outro3");
            _loc2_.workerFlipped.animateModel();
            _loc2_.clip.frame3.holder.addChild(_loc2_.server.clip);
            _loc2_.server.clip.visible = true;
            _loc2_.server.clip.scaleX = -1.506;
            _loc2_.server.clip.scaleY = 1.506;
            _loc2_.server.clip.x = 152.9;
            _loc2_.server.clip.y = 50.65;
            _loc2_.server.clip.gotoAndStop("outro4");
            _loc2_.server.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 272)
         {
            _loc2_.clip.frame4.holder.addChild(_loc2_.workerFlipped.clip);
            _loc2_.workerFlipped.clip.visible = true;
            _loc2_.workerFlipped.clip.scaleX = -1.395;
            _loc2_.workerFlipped.clip.scaleY = 1.395;
            _loc2_.workerFlipped.clip.x = 287.8;
            _loc2_.workerFlipped.clip.y = 2.6;
            _loc2_.workerFlipped.clip.gotoAndStop("outro5");
            _loc2_.workerFlipped.animateModel();
            _loc2_.clip.frame4.holder.addChild(_loc2_.server.clip);
            _loc2_.server.clip.visible = true;
            _loc2_.server.clip.scaleX = -1.506;
            _loc2_.server.clip.scaleY = 1.506;
            _loc2_.server.clip.x = 152.9;
            _loc2_.server.clip.y = 50.65;
            _loc2_.server.clip.gotoAndStop("outro6");
            _loc2_.server.animateModel();
         }
         else if(_loc2_.clip.currentFrame == 404)
         {
            _loc2_.clip.frame6.holder.addChild(_loc2_.worker.clip);
            _loc2_.worker.clip.visible = true;
            _loc2_.worker.clip.scaleX = 1.303;
            _loc2_.worker.clip.scaleY = 1.303;
            _loc2_.worker.clip.x = 230.1;
            _loc2_.worker.clip.y = 49.3;
            _loc2_.worker.clip.gotoAndStop("outro7");
            _loc2_.worker.animateModel();
            _loc2_.clip.frame6.holder.addChild(_loc2_.server.clip);
            _loc2_.server.clip.visible = true;
            _loc2_.server.clip.scaleX = -1.303;
            _loc2_.server.clip.scaleY = 1.303;
            _loc2_.server.clip.x = 187.6;
            _loc2_.server.clip.y = 44;
            _loc2_.server.clip.gotoAndStop("outro8");
            _loc2_.server.animateModel();
         }
         if(_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
         {
            _loc2_.clip.removeEventListener(Event.ENTER_FRAME,_loc2_.checkFrame);
            if(!this.replay)
            {
               _loc2_.gameObj.method_177(false);
            }
            else
            {
               _loc2_.gameObj.var_128.switchMusic("none");
            }
            try
            {
               if(_loc2_.completeFunction != null)
               {
                  _loc2_.completeFunction();
               }
               _loc2_.completeFunction = null;
            }
            catch(err:Error)
            {
            }
            _loc2_.gameObj.method_261();
         }
         else if(_loc2_.clip.currentFrame == 308)
         {
            _loc2_.gameObj.var_128.switchMusic("bake");
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:OutroScreen = this;
         _loc1_.worker.destroy();
         _loc1_.worker = null;
         _loc1_.workerFlipped.destroy();
         _loc1_.workerFlipped = null;
         _loc1_.workerTurned.destroy();
         _loc1_.workerTurned = null;
         _loc1_.server.destroy();
         _loc1_.server = null;
         try
         {
            _loc1_.clip.removeEventListener(Event.ENTER_FRAME,_loc1_.checkFrame);
         }
         catch(err:Error)
         {
         }
         _loc1_.gameObj.var_150.removeChild(_loc1_.clip);
         _loc1_.clip = null;
      }
   }
}
