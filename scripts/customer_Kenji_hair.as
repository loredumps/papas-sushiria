package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Kenji_hair")]
   public dynamic class customer_Kenji_hair extends MovieClip
   {
       
      
      public function customer_Kenji_hair()
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
