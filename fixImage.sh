#!/bin/bash

# change ![](media/20141204-java01.jpg)https://raw.githubusercontent.com/arthinking/arthinking.github.io/blog/source/_posts/images/20141204-java01.png
# to ![](https://raw.githubusercontent.com/arthinking/arthinking.github.io/blog/source/_posts/.../media/20141204-java01.jpg)

basePath=`echo "https://raw.githubusercontent.com/arthinking/arthinking.github.io/blog/source/_posts" | sed -e 's/\//\\\\\//g'`
echo "base path: " $basePath
postDir=/Users/arthinking/Dev/arthinking.github.io/source/_posts
echo "post directory: " $postDir
postLength=${#postDir}

traverseAllFiles() {
    hasProcess=0
    for file in $1/*
    do
	if [ -d "$file" ]; then
	    traverseAllFiles $file
	else
	    temp=$file
        name=${temp%.*}
        ext=${temp##*.}
	    if [ "$ext" == "md" ] && [ "$hasProcess" == "0" ]; then
	        hasProcess=1
	        fileName=`echo $temp | awk -F "/" '{print $NF}'`
	        dirPath=`echo $temp | awk -F '/[^/]*$' '{print $1}'`
	        relativePath=`echo "${dirPath:$postLength}" | sed -e 's/\//\\\\\//g'`
	        echo "=== 开始处理文件:"$relativePath
	        # find "$dirPath/" -name "*.md" -print0 | xargs -0 perl -pi -e "s/(\!\[\]\((media.*?jpg)\))/\!\[\]\(${basePath}${relativePath}\/\2\)/g"
	        find "$dirPath/" -name "*.md" -print0 | xargs -0 perl -pi -e "s/(media.*?jpg)/\!\[\]\(\2\)/g"
	    fi
	fi
    done
}



traverseAllFiles $postDir

