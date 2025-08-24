package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Scooter_upperarm")]
   public dynamic class customer_Scooter_upperarm extends MovieClip
   {
       
      
      public function customer_Scooter_upperarm()
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
