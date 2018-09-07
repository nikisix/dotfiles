function make --wraps make
  fish -c "
    while [ \$PWD != '/' ]; and [ ! -e 'Makefile' ]
      cd ..
    end
    command make $argv # Run make even without a Makefile to allow `make --help`, etc
  "
end
