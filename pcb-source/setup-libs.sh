# Update submodules
git submodule update --init

# Copy library tables
cp libs/kicad-symbols/sym-lib-table .
cp libs/kicad-footprints/fp-lib-table .

# Change Library Table Locations
sed -i "s|\${KICAD_SYMBOL_DIR}|$(pwd)/libs/kicad-symbols|g" sym-lib-table
sed -i "s|\${KISYSMOD}|$(pwd)/libs/kicad-footprints|g" fp-lib-table
