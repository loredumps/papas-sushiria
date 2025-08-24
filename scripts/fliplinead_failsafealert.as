package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplinead_failsafealert")]
   public dynamic class fliplinead_failsafealert extends MovieClip
   {
       
      
      public function fliplinead_failsafealert()
      {
         super();
         addFrameScript(44,this.frame45,93,this.frame94);
      }
      
      internal function frame45() : *
      {
         stop();
         try
         {
            if(this.parent != null)
            {
               this.parent.removeChild(this);
            }
         }
         catch(err:Error)
         {
         }
      }
      
      internal function frame94() : *
      {
         stop();
         try
         {
            if(this.parent != null)
            {
               this.parent.removeChild(this);
            }
         }
         catch(err:Error)
         {
         }
      }
   }
}
