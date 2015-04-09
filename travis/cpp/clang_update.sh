#!/bin/bash
while [[ $# > 1 ]]
do
key="$1"

case $key in
    -v|--version)
    CLANG_VERSION="$2"
    shift
    ;;
    -r|--repository)
	REPOSITORY="$2"
	shift
    ;;
    --libc++)
	BUILD_LIBCPP=true
	shift
	;;
	--libcpp-upstream)
	LIBCPP_UPSTREAM="$2"
	shift
	;;
    *)
    # unknown option
    ;;
esac
shift
done

if [ -z "${CLANG_VERSION}" ]; then
	CLANG_VERSION="3.5"
fi

if [ -z "${REPOSITORY}" ]; then
	REPOSITORY="h-rayflood/llvm"
fi

if [ -z "${LIBCPP_UPSTREAM}" ]; then
	LIBCPP_UPSTREAM="http://llvm.org/svn/llvm-project/libcxx/trunk"
fi

sudo add-apt-repository -y ppa:${REPOSITORY}
sudo apt-get update -qq
sudo apt-get install --allow-unauthenticated -qq clang-${CLANG_VERSION}

if [ "${BUILD_LIBCPP}"]; then
	cwd=$(pwd)
	export CXXFLAGS="-std=c++0x -stdlib=libc++"; fi
	svn co --quiet "${LIBCPP_UPSTREAM}" libcxx; fi
	cd libcxx/lib && bash buildit; fi
	sudo cp ./libc++.so.1.0 /usr/lib/; fi
	sudo mkdir /usr/include/c++/v1; fi
	cd .. && sudo cp -r include/* /usr/include/c++/v1/; fi
	cd /usr/lib && sudo ln -sf libc++.so.1.0 libc++.so; fi
	sudo ln -sf libc++.so.1.0 libc++.so.1 && cd $cwd
fi

sudo ln -s -v -f $(which clang++-${CLANG_VERSION}) /usr/bin/clang++
sudo ln -s -v -f $(which clang-${CLANG_VERSION}) /usr/bin/clangcc