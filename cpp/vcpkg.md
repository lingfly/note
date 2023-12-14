#

## vcpkg

### 安装

```sh
git clone https://github.com/microsoft/vcpkg

.\bootstrap-vcpkg.bat
```

#### vs

```sh
# 集成到vs
vcpkg integrate install
```

### 使用

```sh
vcpkg list

vcpkg search protobuf

vcpkg install protobuf

vcpkg install protobuf:x64-windows
```


## cmake

### 安装

路径： https://cmake.org/download/

### 使用

```sh
# 1. 
cmake . 

# or
cmake . -G "MinGW Makefiles"

# or
cmake . -B build -G "MinGW Makefiles"


# 2.
make

# or
mingw32-make.exe

```

