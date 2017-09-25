#configures
PATH_SOFTLINKS="/mnt/c/softlinks"
EXT_SOFTLINKS=".lnk"

#clear old softlinks
echo clear\ old\ softlinks....

rm $PATH_SOFTLINKS/*$EXT_SOFTLINKS

#create softlinks to paths in $PATH
echo create new softlinks....
IFS_OLD=$IFS
IFS=:

PATHS_IN_PATH=($PATH)

echo create\ new\ \$PATH\ to\ \$PATH_NEW....
i=0
PATH_NEW=""

for p in ${PATHS_IN_PATH[@]}
do
  if [[ $p =~ [\ ] ]]; then
    # echo -e "\t"$p' -> '$PATH_SOFTLINKS/link_$i.lnk
    ln -s "$p" $PATH_SOFTLINKS/link_$i$EXT_SOFTLINKS
    PATH_NEW="$PATH_NEW:$PATH_SOFTLINKS/link_$i$EXT_SOFTLINKS"
    i=`expr $i + 1`
  else
    PATH_NEW="$PATH_NEW:$p"
  fi
done

IFS=$IFS_OLD
PATH_NEW=${PATH_NEW:1}

echo \$PATH_NEW=$PATH_NEW

echo 'export'\ \$PATH\ to\ $PATH_SOFTLINKS/PATH.backup....
echo $PATH > $PATH_SOFTLINKS/PATH.backup

echo replace\ \$PATH with \$PATH_NEW, and the old value is set into \$OLDPATH
export OLDPATH=$PATH
export PATH=$PATH_NEW

echo ok
