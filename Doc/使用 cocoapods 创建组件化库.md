FAB的数据是存在本地数据库的，因此我们自然想到用一个组件来管理所有的数据。

组件的名字叫：FABDataCenter

1、创建组件库

使用 `cocoapods` 创建组件化库：FABDataCenter

```
pod lib create FABDataCenter
```

接下来将会让你选择组件的相关配置：

```
To get you started we need to ask a few questions, this should only take a minute.

If this is your first time we recommend running through with the guide: 
 - https://guides.cocoapods.org/making/using-pod-lib-create.html
 ( hold cmd and double click links to open in a browser. )


What platform do you want to use?? [ iOS / macOS ]
 > iOS

What language do you want to use?? [ Swift / ObjC ]
 > Objc

Would you like to include a demo application with your library? [ Yes / No ]
 > Yes

Which testing frameworks will you use? [ Specta / Kiwi / None ]
 > None

Would you like to do view based testing? [ Yes / No ]
 > No

What is your class prefix?
 > FAB

```

至此，已经在本地创建了组件化库！

2、配置文件 `.podspec`

项目中找到FABDataCenter.podspec文件，FABDataCenter.podspec的默认内容如下所示：

```
Pod::Spec.new do |s|
  s.name             = 'FABDataCenter'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FABDataCenter.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sculg/FABDataCenter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sculg' => 'sculisong@163.com' }
  s.source           = { :git => 'https://github.com/sculg/FABDataCenter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'FABDataCenter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FABDataCenter' => ['FABDataCenter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

```

修改配置：

```
因为我的私有仓库是放在gitlab上，因此
s.homepage         = 'https://github.com/sculg/FABDataCenter'
改为：
s.homepage         = 'https://gitlab.com/sculg/FABDataCenter'

s.source           = { :git => 'https://github.com/sculg/FABDataCenter.git', :tag => s.version.to_s }
改为：
s.source           = { :git => 'https://gitlab.com/sculg/FABDataCenter.git', :tag => s.version.to_s }

```

配置依赖库：

```
s.dependency 'LKDBHelper', '~> 2.3' //数据库相关
s.dependency 'FABCoreSDK'//组件相关
```



3、在组件库添加文件

注意添加文件的路径，这里我添加了两个文件夹，分别用于储存数据模型和manger单例。

![添加文件](%E4%BD%BF%E7%94%A8%20cocoapods%20%E5%88%9B%E5%BB%BA%E7%BB%84%E4%BB%B6%E5%8C%96%E5%BA%93.assets/%E6%B7%BB%E5%8A%A0%E6%96%87%E4%BB%B6.jpg)



执行 `pod install` ,将 增加的文件夹 更新至 `pods` 组件库中。



4、组件库上传至远程 Git 仓库

我已经在gitlab创建了一个空的项目FABDataCenter，刚才命令行创建的也是git仓库，现在通过如下命令需要将本地仓库与远程仓库关联起来。

```csharp
git remote add origin https://gitlab.com/sculg/FABDataCenter.git
```

关联起来之后，就可以提交代码到远端了：

```
git add .
git commit -m 'init'
git push
```

接下来就是打tag了：

```
/// 新建tag,这里的tag要和FABDataCenter.podspec相同：
git tag 0.1.2
/// 推送tag到远程
git push
```

接下来就是验证 `podspec` 文件：

```
pod spec lint --sources='https://github.com/CocoaPods/Specs.git,https://gitlab.com/fab12/FABSpec.git' --use-libraries --allow-warnings
```

验证成功之后，就是推到远端：

```
pod repo push FABSpec FABDataCenter.podspec --sources='https://github.com/CocoaPods/Specs.git,https://gitlab.com/fab12/FABSpec.git' --use-libraries --allow-warnings

```

验证该组件是否可以用：

```
pod search FABDataCenter
结果如下：

-> FABDataCenter (0.1.2)
   A short description of FABDataCenter.
   pod 'FABDataCenter', '~> 0.1.2'
   - Homepage: https://gitlab.com/sculg/FABDataCenter
   - Source:   https://gitlab.com/sculg/FABDataCenter.git
   - Versions: 0.1.2, 0.1.1 [FABSpec repo]

```

接下来就可以在主工程的Podfile文件中使用了：

```
pod 'FABDataCenter', :path=> '../FABDataCenter'
```



参考：https://www.jianshu.com/p/a61f204026da

