#!/bin/sh
# Собирает index.html для хостинга из kastadent.html — файла, из которого публикуется артефакт.
# Артефакт сам оборачивает страницу в doctype/head, обычному хостингу это нужно дописать.
awk '
BEGIN{
  print "<!doctype html>";
  print "<html lang=\"ru\">";
  print "<head>";
  print "<meta charset=\"utf-8\">";
  print "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, viewport-fit=cover\">";
  print "<meta name=\"description\" content=\"Стоматология Кастадент в Краснодаре: лечение и имплантация зубов, виниры, ортодонтия. Ул. Архитектора Ишунина, 3.\">";
}
{ print }
/fonts\.googleapis\.com/ && !done { print "</head>"; print "<body>"; done=1 }
END{ print "</body>"; print "</html>" }
' kastadent.html > index.html
echo "index.html собран: $(wc -c < index.html) байт"
