package package_5
{
   import flipline.api.class_18;
   
   public class class_26
   {
       
      
      private var api:class_18;
      
      public var var_238:Boolean = false;
      
      public var var_268:Boolean = false;
      
      public var var_275:Boolean = false;
      
      public var var_246:String = "";
      
      public var var_239:String = "";
      
      public var var_237:Array;
      
      public function class_26(param1:class_18, param2:Boolean = false)
      {
         this.var_237 = [];
         super();
         this.api = param1;
         this.var_238 = param2;
      }
      
      public function method_258(param1:Boolean = true, param2:String = "", param3:Boolean = true, param4:String = "") : void
      {
         this.var_275 = param1;
         this.var_239 = param2;
         this.var_268 = param3;
         this.var_246 = param4;
      }
      
      public function method_255(param1:String) : void
      {
         this.var_237.push(param1);
      }
   }
}
