iOS提交代码时候，不需要把pod文件一并提交。可以通过一下操作忽略pod文件：

1. 终端 cd到项目根目录。

2. 创建.gitignore -> touch .gitignore。

3. 打开.gitignore open .gitignore。

4. 忽略pod。

   ```
   Pods/
   Pods
   .DS_Store
   Podfile.lock
   /.DS_Store
   Podfile.lock
   /Podfile.lock
   ```

5. 保存。