package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Georgito_hair")]
   public dynamic class customer_Georgito_hair extends MovieClip
   {
       
      
      public function customer_Georgito_hair()
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
