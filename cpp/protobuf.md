## 

```cpp
// *.pb.h加上这段
#define PROTOBUF_NAMESPACE_OPEN \
  namespace google              \
  {                             \
    namespace protobuf          \
    {
#define PROTOBUF_NAMESPACE_CLOSE \
  }                              \
  }
#define PROTOBUF_NAMESPACE_ID google::protobuf
#define PROTOBUF_CONSTEXPR
#define PROTOBUF_ATTRIBUTE_REINITIALIZES
#define PROTOBUF_NODISCARD [[nodiscard]]
#define PROTOBUF_ALWAYS_INLINE
using namespace google;
```

```cpp
// port_def.inc文件MSVC 17 
// 这行#define PROTOBUF_CONSTEXPR constexpr
// 改成
#define PROTOBUF_CONSTEXPR
```