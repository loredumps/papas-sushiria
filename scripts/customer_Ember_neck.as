package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="customer_Ember_neck")]
   public dynamic class customer_Ember_neck extends MovieClip
   {
       
      
      public function customer_Ember_neck()
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
