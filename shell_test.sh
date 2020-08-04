#声明
#!/bin/bash

#给脚本加执行权限chmod +x ./xxx.sh

#打印
echo "123"
#多行注释
:<<EOF
注释内容...
注释内容...
注释内容...
EOF

#声明变量
your_name="test"
#使用变量:使用一个定义过的变量，只要在变量名前面加美元符号即可
echo $your_name
echo ${your_name}
echo "This is a ${your_name}" #加花括号是为了帮助解释器识别变量的边界
#只读变量 readonly your_name
#删除变量 unset your_name

#变量类型
#1)局部变量:局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量
#2)环境变量:所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量
#3)shell变量:shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行

#Shell 字符串
your_name='runoob'
str='this is a string' #单引号字符串中的变量是无效的,且不可以出现转义字符
str="Hello, I know you are \"$your_name\"! \n" #双引号里可以出现转义字符
echo -e $str
#拼接字符串
your_name="runoob"
greeting="hello, ${your_name} !"
greeting_1="hello, "$your_name" !" #使用双引号拼接
greeting_2='hello, '$your_name' !' #使用单引号拼接
echo $greeting  $greeting_1 $greeting_2
#获取字符串长度
string="abcd123"
echo ${#string} #输出 4
#提取子字符串
echo ${string:1:4} #从下标1开始截取4个字符
#查找子字符串(有bug)
#string="runoob is a great site"
#echo `expr index "$string" io`  # 输出 4

#Shell 数组
array_name=(value0 value1 value2 value3) #用括号来表示数组，数组元素用"空格"符号分割开
array_name[0]=value0 #单独定义数组的各个分量
#读取数组
echo ${array_name[@]} #用@符号获取数组中的所有元素
#获取数组的长度
echo ${#array_name[@]} #用@或*

#Shell 传递参数
echo "执行的文件名：$0"; #执行脚本./test.sh 1 2 3
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo $# #传递到脚本的参数个数
echo $* #以一个单字符串显示所有向脚本传递的参数
echo $@ #与$*相同,但使用加引号时会有区别

#Shell 基本运算符
#算术运算符
val=`expr 23 + 2` #表达式和运算符之间要有空格
a=10
b=20
echo `expr $a - $b` # + - * / % 乘号(*)前边必须加反斜杠(\)才能实现乘法运算
#a=$b #赋值, == != 比较时都需要加$
#关系运算符 相等-eq 不相等-ne 左边的是否大于右边的-gt 是否小于右边的-lt 是否大于等于右边的-ge 是否小于等于右边的-le
if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
#布尔运算符 非! 或-o 与-a
#逻辑运算符 逻辑与&& 逻辑或||
#字符串运算符 两个字符串是否相等= 是否不等!= 长度是否为0-z 长度是否不为0-n 是否为空$
#文件测试运算符

#Shell printf 命令
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg #%s %c %d %f都是格式替代符,%-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来

#Shell 流程控制
#if else
a=10
b=20
if [ $a == $b ]
then
    echo "a = b"
elif [ $a -gt $b ]
then
    echo "a > b"
else
    echo "a < b"
fi
#for 循环
for value in 1 2 3 4 5
do
    echo "value: $value"
done
#while 语句
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
#死循环 while :    while true  for (( ; ; ))
#补充 Linux let 命令
#自加操作：let no++  自减操作：let no--   加法：let a=5+4
#until 循环
int=0
until [ $int -gt 10 ]
do
    echo $int
    let "int++"
done
#case 类似于switch语句
int=1
case $int in
1) echo 'select 1'
;;
2) echo 'select 2'
;;
esac
#跳出循环 break continue
int=1
while :
do
    echo $int
    let "int++"
    if [ $int == 2 ]
    then
        let "int++"
        continue;
    fi
    if [ $int == 5 ]
    then
        break;
    fi
done

#Shell 函数
function demoFun() { #function字符可隐藏
    echo "shell func"
    echo "arg1:$1"
    echo "arg2:$2"
    echo "arg3:$3"
    return 101
}
demoFun 1 2 3
echo "return value:$?" #打印返回值

#输出重定向
who > users #将命令的完整的输出重定向在用户文件中(users)
echo "菜鸟教程：www.runoob.com" >> users #使用>直接覆盖，使用>>在文件末尾追加
cat users #查看文件内容
#输入重定向
wc -l users #统计users文件的行数
wc -l < users #将输入重定向到users文件

#Shell 文件包含(操作执行外部脚本)
touch test2.sh
chmod +x test2.sh
./test2.sh
