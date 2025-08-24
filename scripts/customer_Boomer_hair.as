package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Boomer_hair")]
   public dynamic class customer_Boomer_hair extends MovieClip
   {
       
      
      public function customer_Boomer_hair()
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
