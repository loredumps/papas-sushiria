package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Skyler_hair")]
   public dynamic class customer_Skyler_hair extends MovieClip
   {
       
      
      public function customer_Skyler_hair()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
