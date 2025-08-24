package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Brody_hair")]
   public dynamic class customer_Brody_hair extends MovieClip
   {
       
      
      public function customer_Brody_hair()
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
