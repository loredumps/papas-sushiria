package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Sue_foot")]
   public dynamic class customer_Sue_foot extends MovieClip
   {
       
      
      public function customer_Sue_foot()
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
