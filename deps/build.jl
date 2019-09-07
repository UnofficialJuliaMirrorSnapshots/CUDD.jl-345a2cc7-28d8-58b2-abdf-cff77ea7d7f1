using Compat

if Compat.Sys.isunix()
    download("https://github.com/kozross/cudd/archive/v3.0.0.tar.gz", "cudd-3.0.0.tar.gz")
    run(`tar -zxvf cudd-3.0.0.tar.gz`)
    rm("cudd-3.0.0.tar.gz")
    cd("cudd-3.0.0/")

    run(`autoreconf -fi`)
    run(`./configure --enable-silent-rules --enable-shared --enable-obj`)
    run(`make -j$(length(Sys.cpu_info())) check`)

    # rename the shared library if it's ended with dylib...
    cd("cudd/.libs")
    if isfile("libcudd.dylib")
        run(`mv libcudd.dylib libcudd.so`)
    end
end
