# Update submodules
git submodule update --init

# Copy library tables
cp libs/kicad-symbols/sym-lib-table .
cp libs/kicad-footprints/fp-lib-table .

# Copy footprint library
rm -rf libs/gen-kicad-footprints/
cp -r libs/kicad-footprints/ libs/gen-kicad-footprints/
# Delete repo-related files (anything except footprint libs)
find libs/gen-kicad-footprints/ -maxdepth 1 -type f ! -name '*.pretty' -delete

# Change Library Table Locations
sed -i "s|\${KICAD_SYMBOL_DIR}|$(pwd)/libs/kicad-symbols|g" sym-lib-table
sed -i "s|\${KISYSMOD}|$(pwd)/libs/gen-kicad-footprints|g" fp-lib-table

# Change 3D model path for footprints
for file in libs/gen-kicad-footprints/*.pretty/*; do
    sed -i "s|\${KISYS3DMOD}|$(pwd)/libs/kicad-packages3D|g" $file
done
