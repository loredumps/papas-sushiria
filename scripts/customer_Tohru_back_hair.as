package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Tohru_back_hair")]
   public dynamic class customer_Tohru_back_hair extends MovieClip
   {
       
      
      public function customer_Tohru_back_hair()
      {
         super();
         addFrameScript(1,this.frame2);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}
