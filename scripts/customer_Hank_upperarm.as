package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Hank_upperarm")]
   public dynamic class customer_Hank_upperarm extends MovieClip
   {
       
      
      public function customer_Hank_upperarm()
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
