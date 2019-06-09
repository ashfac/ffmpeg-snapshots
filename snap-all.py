import os
import subprocess
import datetime
import time
import pytz

DEBUG = False

FRAME_RATE = "1/7"
IMAGES_PER_PASS = 3

SNAPS_DIRECTORY = "/media/usb/ffmpeg-snaps/"

SECS_IN_ONE_MINUTE = 60
PAUSE_INTERVAL_SEC = 7 * SECS_IN_ONE_MINUTE

PST_TIMEZONE = pytz.timezone('Asia/Karachi')

urls = [['aaj', 'https://cdn4.mjunoon.tv:8087/web/AAJNews-124/playlist.m3u8'],
		['ary', 'http://158.69.228.195:1935/newsmobile/myStream/playlist.m3u8'],
		['dawn', 'https://cdn4.mjunoon.tv:8087/web/DawnNews-152/playlist.m3u8'],
		['dunya', 'https://cdn5.mjunoon.tv:8087/web/DunyaNews-113/playlist.m3u8'],
		['hum', 'https://www.youtube.com/watch?v=GMNJAruCO5I'],
		['lahore', 'http://mlive.lahorenews.tv:1935/lahorelive/lnews_1/playlist.m3u8'],
		['ninetwo', 'http://92news.vdn.dstreamone.net/92newshd/92hd/playlist.m3u8']]
		
with open(os.devnull, 'w') as devnull:

	while True:
		current_time = datetime.datetime.now(PST_TIMEZONE);
		timestamp = str(current_time).replace(":", ".");
		timestamp = timestamp[:16]

		for i, item in enumerate(urls):
			channel = item[0]
			url = item[1]

			print('{}  {:9}{}'.format(timestamp, channel, url));

			try:
				if "youtube" in url:
					url = str(subprocess.check_output(["youtube-dl", "-f301", "--get-url", url]))

					if url.find("http") and url.find("m3u8") :
						url = url[url.find("http"): url.find("m3u8") + 4]

				filename = SNAPS_DIRECTORY + channel + "/" + timestamp

				if DEBUG:
					subprocess.run(["ffmpeg", "-user_agent", "Mozilla/5.0", "-i", url, "-vsync", "2", "-r", FRAME_RATE, "-frames:v", str(IMAGES_PER_PASS), filename + ".%02d.jpg"])
				else:
					subprocess.run(["ffmpeg", "-user_agent", "Mozilla/5.0", "-i", url, "-vsync", "2", "-r", FRAME_RATE, "-frames:v", str(IMAGES_PER_PASS), filename + ".%02d.jpg"], stdout=devnull, stderr=devnull)

			except subprocess.CalledProcessError as ex:
				print ("exception {} : {}".format(ex.returncode, ex.output))

		print("\n");
		timer = PAUSE_INTERVAL_SEC / SECS_IN_ONE_MINUTE
		while timer > 0:
			print(int(timer), end=" ", flush=True)
			time.sleep(SECS_IN_ONE_MINUTE)
			timer = timer - 1
		print("\n");
