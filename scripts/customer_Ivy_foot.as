package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Ivy_foot")]
   public dynamic class customer_Ivy_foot extends MovieClip
   {
       
      
      public function customer_Ivy_foot()
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
