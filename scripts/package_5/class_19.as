package package_5
{
   import flipline.api.class_18;
   
   public class class_19
   {
       
      
      private var api:class_18;
      
      public var label:String;
      
      public var var_248:String;
      
      public var var_309:Boolean;
      
      public var var_319:String;
      
      public var var_305:Boolean;
      
      public var var_270:Boolean;
      
      public var var_278:String;
      
      public var var_293:Boolean = false;
      
      public var var_311:String = "small";
      
      public var var_333:String = "";
      
      public var var_211:String = "";
      
      public var var_316:Boolean = false;
      
      public var var_294:Boolean = false;
      
      public var var_303:String = "small";
      
      public var var_306:String = "";
      
      public var var_207:String = "";
      
      public var var_334:Boolean = false;
      
      public var var_295:Boolean = false;
      
      public var var_299:String = "small";
      
      public var var_300:String = "";
      
      public var var_209:String = "";
      
      public var var_331:Boolean = false;
      
      public var var_253:String = "";
      
      public var var_335:Boolean = false;
      
      public var var_301:String = "";
      
      public var var_327:Boolean = false;
      
      public var var_329:String = "";
      
      public var var_247:Boolean = false;
      
      public var var_271:Boolean = false;
      
      public var var_180:Boolean = false;
      
      public var var_284:Boolean = false;
      
      public var var_185:Array;
      
      public var var_149:class_26 = null;
      
      public function class_19(param1:class_18, param2:String, param3:String, param4:Boolean = false, param5:String = "", param6:Boolean = true, param7:String = "top left", param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         this.var_185 = [];
         super();
         this.api = param1;
         this.label = param2;
         this.var_248 = param3;
         this.var_309 = param4;
         this.var_319 = param5;
         this.var_305 = param6;
         this.var_278 = param7;
         this.var_270 = param8;
         this.var_247 = param9;
         this.var_271 = param10;
         this.var_180 = param11;
         this.var_284 = param12;
      }
      
      public function method_110(param1:Boolean = true, param2:String = "bottom left", param3:String = "http://www.flipline.com", param4:Boolean = false, param5:String = "small") : void
      {
         this.var_293 = param1;
         this.var_333 = param2;
         this.var_211 = param3;
         this.var_311 = param5;
         this.var_316 = param4;
      }
      
      public function method_129(param1:Boolean, param2:String, param3:String, param4:Boolean, param5:String) : void
      {
         this.var_294 = param1;
         this.var_306 = param2;
         this.var_207 = param3;
         this.var_334 = param4;
         this.var_303 = param5;
      }
      
      public function method_115(param1:Boolean, param2:String, param3:String, param4:String) : void
      {
         this.var_295 = param1;
         this.var_300 = param2;
         this.var_209 = param3;
         this.var_299 = param4;
      }
      
      public function method_283(param1:Boolean, param2:String) : void
      {
         this.var_331 = param1;
         this.var_253 = param2;
      }
      
      public function method_268(param1:Boolean, param2:String) : void
      {
         this.var_335 = param1;
         this.var_301 = param2;
      }
      
      public function method_213(param1:Boolean, param2:String) : void
      {
         this.var_327 = param1;
         this.var_329 = param2;
      }
      
      public function method_233(param1:String, param2:String, param3:Boolean, param4:Boolean, param5:String, param6:String, param7:String, param8:*, param9:Boolean, param10:Boolean) : void
      {
         var _loc11_:class_22 = new class_22(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.var_185.push(_loc11_);
      }
      
      public function method_113(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false, param5:Number = -1, param6:Boolean = false, param7:String = null) : void
      {
         var _loc8_:class_22 = new class_22(param1,"large",false,param3,"button",param2,"",null,param4,false,param5,param6,param7);
         this.var_185.push(_loc8_);
      }
      
      public function method_125(param1:String, param2:String, param3:Boolean = false, param4:String = null) : void
      {
         var _loc5_:class_22 = new class_22(param1,"small",param3,false,"button",param2,"",null,false,true,-1,false,param4);
         this.var_185.push(_loc5_);
      }
      
      public function method_108(param1:String, param2:String, param3:Boolean = false, param4:Number = -1, param5:String = null) : void
      {
         var _loc6_:class_22 = new class_22(param1,"small",false,false,"button",param2,"",null,param3,false,param4,false,param5);
         this.var_185.push(_loc6_);
      }
      
      public function method_171(param1:String, param2:String, param3:Boolean = false, param4:Number = -1, param5:String = null) : void
      {
         var _loc6_:class_22 = new class_22(param1,"small",false,false,"link","",param2,null,param3,false,param4,false,param5);
         this.var_185.push(_loc6_);
      }
      
      public function method_304(param1:String, param2:*, param3:Boolean = false, param4:String = null) : void
      {
         var _loc5_:class_22 = new class_22(param1,"small",false,false,"custom","","",param2,param3,false,-1,false,param4);
         this.var_185.push(_loc5_);
      }
      
      public function method_180(param1:Boolean = false) : void
      {
         this.var_149 = new class_26(this.api,param1);
      }
      
      public function method_228(param1:Boolean = true, param2:String = "", param3:Boolean = true, param4:String = "") : void
      {
         if(this.var_149)
         {
            this.var_149.method_258(param1,param2,param3,param4);
         }
      }
      
      public function method_119(param1:String = "") : void
      {
         if(this.var_149)
         {
            this.var_149.method_255(param1);
         }
      }
   }
}
