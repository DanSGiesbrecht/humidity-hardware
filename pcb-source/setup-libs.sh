# KiCad Library Setup Tool
#
# Tested with: KiCad 5.15
# Simple Setup Tool, to allow "plug-and-play" setup of projects,
# without the need to modify KiCad environment variables.

printf "
 _   ___ _____           _ 
| | / (_)  __ \         | |
| |/ / _| /  \/ __ _  __| |
|    \| | |    / _  |/ _  |
| |\  \ | \__/\ (_| | (_| |
\_| \_/_|\____/\__,_|\__,_|

Library Setup Tool
Copyright \x00\xC2\xA9 2020 Daniel Giesbrecht\n\n"

os_path=$(pwd)
unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)    machine=Linux;;
    Darwin*)   machine=Mac;;
    CYGWIN*)   machine=Cygwin;;
    MINGW*)    machine=Mingw;;
    *)         machine=UNKNOWN
esac

if [ $machine = Cygwin ] || [ $machine = Mingw ]; then
    printf ">>> Using Windows-style filepaths\n\n"
    os_path=$(sed 's|^.||g' <<< "$os_path")       # trim the first '/'
    os_path=$(sed 's|^.|&:|g' <<< "$os_path")     # add ':' after the drive letter (for Windows)
elif [ $machine = UNKNOWN ]; then
    printf ">>> Unsure which filepath to use for: "
    echo $(uname)
    printf "\n"
    exit
fi

# Update submodules
printf "Updating submodules...\n"
git submodule update --init

# Copy library tables
printf "Moving library tables...\n"
cp libs/kicad-symbols/sym-lib-table .
cp libs/kicad-footprints/fp-lib-table .

# Copy footprint library
printf "Generating footprint library...\n"
rm -rf libs/gen-kicad-footprints/
cp -r libs/kicad-footprints/ libs/gen-kicad-footprints/
# Delete repo-related files (anything except footprint libs)
find libs/gen-kicad-footprints/ -maxdepth 1 -type f ! -name '*.pretty' -delete

# Change Library Table Paths
printf "Updating library tables...\n"
sed -i "s|\${KICAD_SYMBOL_DIR}|$os_path/libs/kicad-symbols|g" sym-lib-table
sed -i "s|\${KISYSMOD}|$os_path/libs/gen-kicad-footprints|g" fp-lib-table

# Change 3D model path for footprints
printf "Updating 3D model paths...\n"
var=0
for file in libs/gen-kicad-footprints/*.pretty/*; do
    if [[ $((var % 2)) = 0 ]]; then
        sed -i "s|\${KISYS3DMOD}|$os_path/libs/kicad-packages3D|g" $file &
    else
        sed -i "s|\${KISYS3DMOD}|$os_path/libs/kicad-packages3D|g" $file
    fi
    var=$((var+1))
done
printf "\nDONE"
