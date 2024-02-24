import argparse
import time
import subprocess

sink_name='alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo'

def set_alarm(alarm_time, alarm_sound):
    alarm_datetime = time.strptime(alarm_time, "%H:%M")
    while True:
        current_datetime = time.localtime()
        if current_datetime.tm_hour == alarm_datetime.tm_hour and current_datetime.tm_min == alarm_datetime.tm_min:
            print(f"Alarm! It's {alarm_time}. Playing {alarm_sound}.")
            play_sound(alarm_sound)
            break
        else:
            time_difference = time.mktime(alarm_datetime) - time.mktime(current_datetime)
            hours, remainder = divmod(time_difference, 3600)
            minutes, _ = divmod(remainder, 60)
            print(f"Time remaining: {int(hours)} hours and {int(minutes)} minutes", end='\r')
        time.sleep(1)  # Check every second

def play_sound(sound_file):
    try:
        # Set the output to the speakers
        subprocess.run(["pacmd","set-default-sink",sink_name], check=True)

        # Unmute the speakers
        subprocess.run(["pactl","set-sink-mute",sink_name,"0"], check=True)

        # Set the output volume
        subprocess.run(["pactl","set-sink-volume",sink_name,"85%"], check=True)

        while True:
            subprocess.run(["mpv", sound_file], check=True)
    except subprocess.CalledProcessError:
        print("Error: Failed to play the sound file.")
    except KeyboardInterrupt:
        exit()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Set an alarm and play a sound file.")
    parser.add_argument("alarm_time", help="Specify the alarm time in 24-hour format (e.g., 00:00)")
    parser.add_argument("alarm_sound", help="Path to the sound file to be played when the alarm triggers")

    args = parser.parse_args()

    try:
        # Validate the time format
        time.strptime(args.alarm_time, "%H:%M")
    except ValueError:
        print("Error: Invalid time format. Please use HH:MM (24-hour format).")
        exit(1)

    set_alarm(args.alarm_time, args.alarm_sound)
