package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_kurikinton")]
   public dynamic class syrup_kurikinton extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_kurikinton()
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
