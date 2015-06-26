#! /bin/sh
OS="FreeBSD"
ARCH="amd64"
BUILDTYPE="Debug"

CLEAN="/t:rebuild"

BINDIR="bin"
LOGDIR="${BINDIR}/Logs"
LOGFILE="${LOGDIR}/mscorlib_${OS}_${ARCH}_${BUILDTYPE}.log"

exec /usr/local/bin/mono --debug /usr/local/lib/mono/xbuild/12.0/bin/xbuild.exe build.proj \
	${CLEAN} /nologo /verbosity:minimal /fileloggerparameters:LogFile=${LOGFILE} \
	/p:OS=${OS} /p:__BuildOS=${OS} /p:BuildNugetPackage=false \
	/p:CLRRuntime=/usr/local/bin/mono \
	/p:SDK40ToolsPath=/usr/local/lib/mono/4.5/ \
	/p:GCC=gcc48 /p:UseMonoCompiler=true \
	/p:WindowsSdkDir=/usr/local/mingw32

