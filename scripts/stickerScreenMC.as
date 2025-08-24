package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="stickerScreenMC")]
   public dynamic class stickerScreenMC extends MovieClip
   {
       
      
      public var down_btn:SimpleButton;
      
      public var drag_btn:MovieClip;
      
      public var fader:MovieClip;
      
      public var holder:MovieClip;
      
      public var panelholder:MovieClip;
      
      public var panelmask:MovieClip;
      
      public var percent_txt:TextField;
      
      public var sort_abc:MovieClip;
      
      public var sort_earned:MovieClip;
      
      public var sort_need:MovieClip;
      
      public var tally_txt:TextField;
      
      public var up_btn:SimpleButton;
      
      public function stickerScreenMC()
      {
         super();
      }
   }
}
