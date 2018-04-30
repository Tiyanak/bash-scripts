# Need to add xdotool to Envs (save xdotool.exe somewhere safe and add env path variable to xdotool)

usage() {
  echo "Usage:"
  echo "keyClicker.bat [-t TIME] [-k KEY]"
  exit 100
}

clickKey() {
	xdotool key $1
	echo "Clicked $1 at $(date)"
}

KEY=""
TIME_LONG=""

while getopts ":t:k:" optchar
do
  case "${optchar}" in
    t)
      KEY=${OPTARG}
      ;;
    k)
      TIME_LONG=${OPTARG}
      ;;
    *)
      echo "Unknown flag '${OPTARG}'"
      usage
      ;;
  esac
done

if [[ $KEY == "" ]]; then
  echo -n "Key: "
  read KEY
  echo ""
fi

if [[ $TIME_LONG == "" ]]; then
  echo -n "Time: "
  read TIME_LONG
  echo ""
fi

echo $KEY
echo $TIME_LONG

while [ 0 -eq 0 ]
do
	clickKey $KEY
	sleep $TIME_LONG
done

