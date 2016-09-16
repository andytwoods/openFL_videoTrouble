package;

import openfl.display.Sprite;
import openfl.events.NetStatusEvent;
import openfl.Lib;
import openfl.media.Video;
import openfl.net.NetConnection;
import openfl.net.NetStream;

/**
 * ...
 * @author Andy Woods
 */
class Main extends Sprite 
{

	var netStream: NetStream ;
	
	public function new() 
	{
		super();
		
		var netConnection = new NetConnection();
		netConnection.connect (null);

		netStream = new NetStream (netConnection);
		netStream.client = { }
		netStream.client.onMetaData = ns_onMetaData;
		netStream.client.onCuePoint = ns_onCuePoint;
		
		var video = new Video(640, 480);
		addChild(video);

		video.attachNetStream (netStream);
		
		netStream.play ('V5.mp4' );

	}
	
	function ns_onMetaData(item:Dynamic) {
    trace("metaData");
}
 
	function ns_onCuePoint(item:Dynamic) {
		trace("cuePoint");
		trace(item.name + "\t" + item.time);
	}

}
