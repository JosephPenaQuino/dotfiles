set prompt \033[01;31m\n\n#####################################> \033[0m

define make
    shell make
    python gdb.execute("file " + gdb.current_progspace().filename)
    # clear cache
    directory
end

