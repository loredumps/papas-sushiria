package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Clair_hair")]
   public dynamic class customer_Clair_hair extends MovieClip
   {
       
      
      public function customer_Clair_hair()
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
