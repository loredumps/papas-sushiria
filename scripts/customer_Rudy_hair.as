package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Rudy_hair")]
   public dynamic class customer_Rudy_hair extends MovieClip
   {
       
      
      public function customer_Rudy_hair()
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
