iOS提交代码时候，不需要把pod文件一并提交。可以通过一下操作忽略pod文件：

1. 终端 cd到项目根目录。

2. 创建.gitignore -> touch .gitignore。

3. 打开.gitignore open .gitignore。

4. 忽略pod。

   ```
   # Xcode
   .DS_Store
   build
   report.xml
   *.pbxuser
   !default.pbxuser
   *.mode1v3
   !default.mode1v3
   *.mode2v3
   !default.mode2v3
   *.perspectivev3
   !default.perspectivev3
   xcuserdata
   *.moved-aside
   DerivedData
   .idea/
   *.hmap
   *.xccheckout
   *.xcworkspace
   !default.xcworkspace
   #CocoaPods
   Pods
   Podfile.lock
   xcschemes
   ```

5. 保存。

参考：iOS .gitignore 配置文件 https://www.jianshu.com/p/238086418384

