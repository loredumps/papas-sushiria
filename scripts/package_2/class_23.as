package package_2
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import flipline.api.class_18;
   import package_3.*;
   
   public class class_23
   {
       
      
      private var api:class_18;
      
      private var var_184:FileReference = null;
      
      private var var_154:MovieClip = null;
      
      private var saveData:Object;
      
      private var var_177:class_17;
      
      private var var_172:class_17;
      
      private var var_286:Function = null;
      
      private var var_312:String = "backup";
      
      private var var_326:String = "";
      
      private var var_173:FileReference = null;
      
      private var var_151:MovieClip = null;
      
      private var var_179:class_17;
      
      private var var_166:class_17;
      
      private var var_282:Function = null;
      
      private var var_313:Number = 0;
      
      private var var_265:String = "";
      
      private var var_291:String = "/";
      
      private var var_164:MovieClip = null;
      
      private var var_181:class_17;
      
      public function class_23(param1:class_18)
      {
         super();
         this.api = param1;
      }
      
      public function method_143(param1:Object, param2:String, param3:String, param4:Function) : void
      {
         var _loc5_:class_23;
         (_loc5_ = this).saveData = param1;
         _loc5_.var_286 = param4;
         _loc5_.var_326 = param2;
         _loc5_.var_312 = param3;
         if(_loc5_.var_154 != null)
         {
            if(_loc5_.var_154.parent)
            {
               _loc5_.var_154.parent.removeChild(_loc5_.var_154);
            }
            _loc5_.var_154 = null;
         }
         _loc5_.var_154 = new saveBackupMC();
         _loc5_.var_154.gotoAndStop(1);
         _loc5_.api.container.addChild(_loc5_.var_154);
         _loc5_.var_177 = new class_17(null,"Save...","large","button","clickSaveButton",null,false,false,false,null,false,140);
         _loc5_.var_177.x = (640 - _loc5_.var_177.width) / 2;
         _loc5_.var_177.y = 242;
         _loc5_.var_154.addChild(_loc5_.var_177);
         _loc5_.var_177.addEventListener("clickSaveButton",_loc5_.method_173);
         _loc5_.var_172 = new class_17(null,"CLOSE","small","button","clickSaveCloseButton",null,false,false,false,null,false,140);
         _loc5_.var_172.x = (640 - _loc5_.var_172.width) / 2;
         _loc5_.var_172.y = 291;
         _loc5_.var_154.addChild(_loc5_.var_172);
         _loc5_.var_172.addEventListener("clickSaveCloseButton",_loc5_.method_164);
      }
      
      private function method_164(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.method_147(param1);
      }
      
      private function method_173(param1:Event) : void
      {
         var byteArray:ByteArray;
         var ob:class_23 = null;
         var e:Event = param1;
         ob = this;
         ob.var_177.visible = false;
         ob.var_172.visible = false;
         ob.var_154.gotoAndStop("saving");
         ob.saveData.gameSKU = ob.var_326;
         byteArray = new ByteArray();
         byteArray.writeObject(ob.saveData);
         byteArray.compress();
         ob.var_184 = new FileReference();
         ob.var_184.addEventListener(Event.COMPLETE,ob.method_191);
         ob.var_184.addEventListener(Event.CANCEL,ob.method_147);
         ob.var_184.addEventListener(IOErrorEvent.IO_ERROR,ob.method_172);
         try
         {
            ob.var_184.save(byteArray,ob.var_312 + ".papa");
         }
         catch(err:Error)
         {
            ob.method_227(err);
         }
      }
      
      private function method_259() : void
      {
         var _loc1_:class_23 = this;
         if(_loc1_.var_184 != null)
         {
            _loc1_.var_184.removeEventListener(Event.COMPLETE,_loc1_.method_191);
            _loc1_.var_184.removeEventListener(Event.CANCEL,_loc1_.method_147);
            _loc1_.var_184.removeEventListener(IOErrorEvent.IO_ERROR,_loc1_.method_172);
            _loc1_.var_184 = null;
         }
         if(_loc1_.var_177)
         {
            _loc1_.var_177.removeEventListener("clickSaveButton",_loc1_.method_173);
            if(_loc1_.var_154)
            {
               _loc1_.var_154.removeChild(_loc1_.var_177);
            }
            _loc1_.var_177.destroy();
            _loc1_.var_177 = null;
         }
         if(_loc1_.var_172)
         {
            _loc1_.var_172.removeEventListener("clickSaveCloseButton",_loc1_.method_164);
            if(_loc1_.var_154)
            {
               _loc1_.var_154.removeChild(_loc1_.var_172);
            }
            _loc1_.var_172.destroy();
            _loc1_.var_172 = null;
         }
         if(_loc1_.var_154)
         {
            if(_loc1_.var_154.parent)
            {
               _loc1_.var_154.parent.removeChild(_loc1_.var_154);
            }
            _loc1_.var_154 = null;
         }
      }
      
      private function method_191(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_154.gotoAndStop("success");
         _loc2_.var_172.visible = true;
      }
      
      private function method_147(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.method_259();
         if(_loc2_.var_286 != null)
         {
            _loc2_.var_286();
         }
      }
      
      private function method_172(param1:IOErrorEvent) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_154.gotoAndStop("failure");
         trace("IO Error Saving: " + param1.text);
         _loc2_.var_172.visible = true;
      }
      
      private function method_227(param1:Error) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_154.gotoAndStop("failure");
         trace("Error Saving: " + param1.message);
         _loc2_.var_172.visible = true;
      }
      
      public function method_162(param1:Number, param2:String, param3:String, param4:Function = null) : void
      {
         var _loc5_:class_23;
         (_loc5_ = this).var_313 = param1;
         _loc5_.var_265 = param2;
         _loc5_.var_291 = param3;
         _loc5_.var_282 = param4;
         if(_loc5_.var_151 != null)
         {
            if(_loc5_.var_151.parent)
            {
               _loc5_.var_151.parent.removeChild(_loc5_.var_151);
            }
            _loc5_.var_151 = null;
         }
         _loc5_.var_151 = new loadBackupMC();
         _loc5_.var_151.gotoAndStop(1);
         _loc5_.api.container.addChild(_loc5_.var_151);
         _loc5_.var_179 = new class_17(null,"Load...","large","button","clickLoadButton",null,false,false,false,null,false,140);
         _loc5_.var_179.x = (640 - _loc5_.var_179.width) / 2;
         _loc5_.var_179.y = 242;
         _loc5_.var_151.addChild(_loc5_.var_179);
         _loc5_.var_179.addEventListener("clickLoadButton",_loc5_.method_188);
         _loc5_.var_166 = new class_17(null,"CLOSE","small","button","clickLoadCloseButton",null,false,false,false,null,false,140);
         _loc5_.var_166.x = (640 - _loc5_.var_166.width) / 2;
         _loc5_.var_166.y = 291;
         _loc5_.var_151.addChild(_loc5_.var_166);
         _loc5_.var_166.addEventListener("clickLoadCloseButton",_loc5_.method_178);
      }
      
      private function method_178(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.method_161(param1);
      }
      
      private function method_188(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_179.visible = false;
         _loc2_.var_166.visible = false;
         _loc2_.var_151.gotoAndStop("loading");
         _loc2_.var_173 = new FileReference();
         _loc2_.var_173.addEventListener(Event.SELECT,_loc2_.method_199);
         _loc2_.var_173.addEventListener(Event.CANCEL,_loc2_.method_161);
         var _loc3_:FileFilter = new FileFilter("Papa Backup Files","*.papa");
         _loc2_.var_173.browse([_loc3_]);
      }
      
      private function method_299() : void
      {
         var ob:class_23 = null;
         var data:ByteArray = null;
         var sourceObject:Object = null;
         var so:SharedObject = null;
         var i:String = null;
         ob = this;
         try
         {
            data = ob.var_173.data;
            data.uncompress();
            sourceObject = data.readObject();
            if(sourceObject.hasOwnProperty("gameSKU") && sourceObject.gameSKU == ob.var_265)
            {
               so = SharedObject.getLocal(ob.var_265 + ob.var_313,ob.var_291);
               for(i in sourceObject)
               {
                  so.data[i] = sourceObject[i];
               }
               so.flush(15360);
               sourceObject = null;
               ob.var_151.gotoAndStop("success");
               ob.var_166.visible = true;
            }
            else
            {
               sourceObject = null;
               ob.var_151.gotoAndStop("invalid");
               ob.var_166.visible = true;
            }
         }
         catch(err:Error)
         {
            trace("Error Restoring Data to a Save Slot!!");
            ob.method_290(err);
         }
      }
      
      private function method_199(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_173.addEventListener(Event.COMPLETE,_loc2_.method_176);
         _loc2_.var_173.addEventListener(IOErrorEvent.IO_ERROR,_loc2_.method_201);
         _loc2_.var_173.load();
      }
      
      private function method_240() : void
      {
         var _loc1_:class_23 = this;
         if(_loc1_.var_173 != null)
         {
            _loc1_.var_173.removeEventListener(Event.COMPLETE,_loc1_.method_176);
            _loc1_.var_173.removeEventListener(Event.SELECT,_loc1_.method_199);
            _loc1_.var_173.removeEventListener(Event.CANCEL,_loc1_.method_161);
            _loc1_.var_173.removeEventListener(IOErrorEvent.IO_ERROR,_loc1_.method_201);
            _loc1_.var_173 = null;
         }
         if(_loc1_.var_179)
         {
            _loc1_.var_179.removeEventListener("clickLoadButton",_loc1_.method_188);
            if(_loc1_.var_151)
            {
               _loc1_.var_151.removeChild(_loc1_.var_179);
            }
            _loc1_.var_179.destroy();
            _loc1_.var_179 = null;
         }
         if(_loc1_.var_166)
         {
            _loc1_.var_166.removeEventListener("clickLoadCloseButton",_loc1_.method_178);
            if(_loc1_.var_151)
            {
               _loc1_.var_151.removeChild(_loc1_.var_166);
            }
            _loc1_.var_166.destroy();
            _loc1_.var_166 = null;
         }
         if(_loc1_.var_151)
         {
            if(_loc1_.var_151.parent)
            {
               _loc1_.var_151.parent.removeChild(_loc1_.var_151);
            }
            _loc1_.var_151 = null;
         }
      }
      
      private function method_176(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.method_299();
      }
      
      private function method_161(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.method_240();
         if(_loc2_.var_282 != null)
         {
            _loc2_.var_282();
         }
      }
      
      private function method_201(param1:IOErrorEvent) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_151.gotoAndStop("failure");
         trace("IO Error Loading: " + param1.text);
         _loc2_.var_166.visible = true;
      }
      
      private function method_290(param1:Error) : void
      {
         var _loc2_:class_23 = this;
         _loc2_.var_151.gotoAndStop("failure");
         trace("Error Loading: " + param1.message);
         _loc2_.var_166.visible = true;
      }
      
      public function method_209(param1:Boolean = true) : void
      {
         var _loc2_:class_23 = this;
         if(_loc2_.var_164 != null)
         {
            if(_loc2_.var_164.parent)
            {
               _loc2_.var_164.parent.removeChild(_loc2_.var_164);
            }
            _loc2_.var_164 = null;
         }
         if(param1)
         {
            _loc2_.var_164 = new helpBackupMC();
         }
         else
         {
            _loc2_.var_164 = new helpNoBackupMC();
         }
         _loc2_.var_164.gotoAndStop(1);
         _loc2_.api.container.addChild(_loc2_.var_164);
         _loc2_.var_181 = new class_17(null,"OK","large","button","clickHelpCloseButton",null,false,false,false,null,false,140);
         _loc2_.var_181.x = (640 - _loc2_.var_181.width) / 2;
         _loc2_.var_181.y = 267;
         _loc2_.var_164.addChild(_loc2_.var_181);
         _loc2_.var_181.addEventListener("clickHelpCloseButton",_loc2_.method_196);
      }
      
      private function method_196(param1:Event) : void
      {
         var _loc2_:class_23 = this;
         if(_loc2_.var_181)
         {
            _loc2_.var_181.removeEventListener("clickHelpCloseButton",_loc2_.method_196);
            if(_loc2_.var_164)
            {
               _loc2_.var_164.removeChild(_loc2_.var_181);
            }
            _loc2_.var_181.destroy();
            _loc2_.var_181 = null;
         }
         if(_loc2_.var_164)
         {
            if(_loc2_.var_164.parent)
            {
               _loc2_.var_164.parent.removeChild(_loc2_.var_164);
            }
            _loc2_.var_164 = null;
         }
      }
   }
}
