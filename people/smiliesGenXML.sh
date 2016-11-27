#!/bin/bash

# ------------------------------------------------------------------------------
# XenForo Smilie XML Generator
# ------------------------------------------------------------------------------
# @author Kitsune Solar
# @version 1.0.0
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# settings
# ------------------------------------------------------------------------------

# Имя генерируемого файла
csiFileGen="emoji.people.xml"

# ID категории смайликов
csiCatID="2"

# Название категории смайликов
csiCatTitle="People"

# Порядок отображения категории смайликов
csiCatDisplayOrder="10"

# Префикс для смайликов
sciSmPrefix="emoji_"

# Порядок отображения смайликов в категории
csiSmDisplayOrder="500"

# Включение / отключение отображения смайликов в редакторе
csiSmDisplayInEditor="1"

# Путь к директории со смайликами
csiSmImageURL="styles/default/xenforo/smilies.emoji/people"

# ---------------------------------< script >--------------------------------- #

cat > "${csiFileGen}" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<smilies_export>
  <smilie_categories>
    <smilie_category id="${csiCatID}" title="${csiCatTitle}" display_order="${csiCatDisplayOrder}"/>
  </smilie_categories>
  <smilies>
EOF

for i in *.svg; do cat >> "${csiFileGen}" <<EOF
    <smilie smilie_category_id="${csiCatID}" title="${i%.*}" display_order="${csiSmDisplayOrder}" display_in_editor="${csiSmDisplayInEditor}">
      <image_url>${csiSmImageURL}/${i}</image_url>
      <smilie_text>:${sciSmPrefix}${i%.*}:</smilie_text>
    </smilie>
EOF
done

cat >> "${csiFileGen}" <<EOF
  </smilies>
</smilies_export>
EOF

exit 0
