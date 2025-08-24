package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Wendy_foot")]
   public dynamic class customer_Wendy_foot extends MovieClip
   {
       
      
      public function customer_Wendy_foot()
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
