package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Iggy_hair")]
   public dynamic class customer_Iggy_hair extends MovieClip
   {
       
      
      public function customer_Iggy_hair()
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
