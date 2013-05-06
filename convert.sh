#!/bin/bash

category=$1

for i in `ls ../mynotes/${category}`; do
 new=`echo $i | tr '_' '-'`;
 newfile="_posts/${new}.textile"
 cat <<EOF > ${newfile}
---
layout: post
category: ${category}
---
EOF

 cat ../mynotes/${category}/${i} >> ${newfile};
done
