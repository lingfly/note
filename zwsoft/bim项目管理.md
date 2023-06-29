


## 0602改动

1. 创建项目
用is_template：1创建构建模板库和模型模板库

2. 查询项目
名称用返回结果中 "attrs": {"V_Name": "asdad"}

3. 模型/构件重命名
用/coll/model/rename接口

4. 模型/构件列表
名称用返回结果中 "attrs": {"V_Name": "asdad"}


## catalog

1. 构件定义库(bo)

2. 构件定义

    构件定义和构件模板 的 bo类型是同一个吗

3. 类别

   类别和构件定义用ro关联，构件定义是根节点，类别是构件定义的下一层

构件定义、构件模板、构件 都是bo，这三个bo的类型是同一个吗


## 权限控制

### 表达式
1. 是项目成员
`to[ProjectMgmtProduct].from.from[MemberOfProjectMgmt|to.name=context.user] == true`

### 清除占用

1. unreserve
2. 

## 搜索

模型：type=BmDbProduct
构件：type=BmDbFamilyTemplate,attribute=BmDbFamilyTemplate.IsSystem,val=0
系统构件：type=BmDbFamilyTemplate,attribute=BmDbFamilyTemplate.IsSystem,val=1
构件定义：type=BmDbFamilyDefinitonResource
构件模板：type=BmDbFamilyTemplate
模型模板：type=BmDbProduct

