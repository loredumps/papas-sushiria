package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Rico_hair")]
   public dynamic class customer_Rico_hair extends MovieClip
   {
       
      
      public function customer_Rico_hair()
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
