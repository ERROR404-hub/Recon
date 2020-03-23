---
output:
  html_document:
    df_print: paged
  pdf_document: default
---

<center>
![](/home/jager/Рабочий стол/RStudio_lab/gerb.jpg)
<br>
<font size="5">МИНОБРНАУКИ РОССИИ</font><br><br>
<font size="4">Федеральное государственное бюджетное
образовательное учреждение высшего образования</font><br>
<font size="5">**«МИРЭА – РОССИЙСКИЙ ТЕХНОЛОГИЧЕСКИЙ УНИВЕРСИТЕТ»**</font><br><br>
<font size="4">Лабораторная работа по дисциплине:<br>
«Программные средства оперативно-аналитического поиска»<br><br>
Тема: Сбор информации о компаниях<br><br><br><br><br><br><br>
<div style="text-align: right">*Выполнил:*
                               студент 4 курса,<br>
                               специальности 10.05.05,<br>
                               группы ББСО-02-16,<br>
                               Прибылов И.А.<br>
                               *Проверил:*
                               Захарчук И.И.<br>
</div>
<br><br><br><br><br><br><br>
Москва, 2020</font>
<br><br><br>

<div style="text-align: left">
<table>
  <caption>
    **Цель работы:**
  </caption>
  <col width="1000">
  <tr>
    <td class="tr1">**Собрать информацию о компаниях из списка S&P 500**</td>
  </tr>
</table>
<table>
  <caption>
    **Исходные данные:**
  </caption>
  <tr>
    <td class="tr1">&nbsp;**1) OS Kali Linux**&nbsp;&nbsp; ![](/home/jager/Рабочий стол/RStudio_lab/iso.ico) [[kali-linux-2020]](https://www.kali.org/downloads/)</td>
  </tr>
  <tr>
    <td class="tr1">&nbsp;**2) Цели:**</td>
  </tr>
  <tr>
    <td class="tr2">* [*Progressive Corporation*](https://www.progressive.com/) - американская страховая компания;</td>
  </tr>
  <tr>
    <td class="tr2">* [*Analog Devices Inc.*](https://www.analog.com/en/index.html) - крупная американская компания, производитель интегральных микросхем для решения задач преобразования сигналов;</td>
  </tr>
  <tr>
    <td class="tr2">* [*Allstate Corporation*](https://www.allstate.com/) - американская страховая компания;</td>
  </tr>
  <tr>
    <td class="tr2">* [*SunTrust Banks Inc.*](https://suntrustng.com/) - американская банковская холдинговая компания;</td>
  </tr>
  <tr>
    <td class="tr2">* [*Sherwin-Willams Company*](https://www.sherwin-williams.com/) - крупнейший в мире производитель лакокрасочных материалов.</td>
  </tr>
</table>
<table>
  <caption>
    **Инструменты:**
  </caption>
  <tr>
    <td class="tr1">**В ходе поиска информации мы будем использовать следующий инструментарий:**</td>
  </tr>
  <tr>
    <td class="tr2">* [*2ip.ru*](2ip.ru) - портал сетевых сервисов;</td>
  </tr>
  <tr>
    <td class="tr2">* [*reg.ru*](https://www.reg.ru) - регистратор доменных имён;</td>
  </tr>
  <tr>
    <td class="tr2">* [Linkonavt.ru](https://linkonavt.ru/services/sitetechnologies) - определение используемых web-приложений;</td>
  </tr>
  <tr>
    <td class="tr2">* [*Nmap*](https://nmap.org/) - свободная утилита, предназначенная для разнообразного настраиваемого сканирования IP-сетей с любым количеством объектов, определения состояния объектов сканируемой сети (портов и соответствующих им служб).</td>
  </tr>
</table>

```{css echo=FALSE}
table {
  font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
  border-collapse: collapse;
  color: #68646;
}
caption {
  padding: 12px;
  color: white;
  background: #8FD4C1;
  font-size: 18px;
  text-align: left;
  font-weight: normal;
  width: 1000px;
}
td {
  padding: 5px;
  vertical-align: top;
}
tr {
  
  font-size: 15px;
}
.tr1 {background: #F0FFF0;}
.tr2 {background: #FFFAFA;}
.tr3 {background: #FFFAFA; border: 1px solid maroon;}
.tr4 {background: #F0FFF0; border: 1px solid maroon;}
```
<table>
  <caption>
    **План выполнения работы:**
  </caption>
  <col width="1000">
  <tr>
    <td class="tr1">&nbsp;**1) С помощью сервиса 2ip.ru определим следующие признаки:**<span style='padding-right:424px;'></span></td>
  </tr>
  <tr>
    <td class="tr2">* *IP-адрес;*</td>
  </tr>
  <tr>
    <td class="tr2">* *Местоположение;*</td>
  </tr>
  <tr>
    <td class="tr2">* *Телефонные номера;*</td>
  </tr>
  <tr>
    <td class="tr2">* *Электронные адреса e-mail.*</td>
  </tr>
  <tr>
    <td class="tr1">&nbsp;**2) Просканируем порты, используя операционную систему Linux, выполнив команду:**
  <br><br>
```{}
nmap <домен_компании>/<ip_адрес> -p <номер_порта>
```
  </td>
  </tr>
  <tr>
    <td class="tr1">&nbsp;**3) При помощи сервиса REG.ru определим кто занимается хостингом данной компании;**</td>
  </tr>
  <tr>
    <td class="tr1">&nbsp;**4) Используем Linkonavt.ru, чтобы определить web-приложения по домену.**<br></td>
  </tr>
</table>
<table>
  <caption>
  **Progressive Corporation:**
  </caption>
  <col width="31">
  <tr>
    <td class="tr4">**№**</td>
    <td class="tr4">**Признак**</td>
    <td class="tr4">**Значение**</td>
  </tr>
  <col width="159">
  <tr>
    <td class="tr4">**1**</td>
    <td class="tr3">Сайт</td>
    <td class="tr3">[https://www.progressive.com/](https://www.progressive.com/)</td>
  </tr>
  <col width="810">
  <tr>
    <td class="tr4">**2**</td>
    <td class="tr3">IP-адрес</td>
    <td class="tr3">*170.218.212.32*<br>**United States**</td>
  </tr>
  <tr>
    <td class="tr4">**3**</td>
    <td class="tr3">Местонахождение</td>
    <td class="tr3">**Address:** 300 NORTH COMMONS BLVD<br>
**City:** MAYFIELD VILLAGE<br>
**StateProv:** OH<br>
**PostalCode:** 44143<br>
**Country:** US</td>
  </tr>
  <tr>
    <td class="tr4">**4**</td>
    <td class="tr3">Телефон</td>
    <td class="tr3">Organisation: +1-877-669-6862 US<br>Tech (Chumley, Scott): +1-440-603-3028 US
    <br>Tech (Goodwin, James A.): +1-440-395-0088 US</td>
  </tr>
  <tr>
    <td class="tr4">**5**</td>
    <td class="tr3">E-mail</td>
    <td class="tr3">Organisation: ntoc@progressive.com<br>Tech (Chumley, Scott): schumle1@progressive.com
    <br>Tech (Goodwin, James A.): steven_iannetta@progressive.com<br>
    Network Operations: arin_poc@progressive.com</td>
  </tr>
  <tr>
    <td class="tr4">**6**</td>
    <td class="tr3">Порты</td>
    <td class="tr3">All 1000 scanned ports on *170.218.212.32* are filtered</td>
  </tr>
  <tr>
    <td class="tr4">**7**</td>
    <td class="tr3">Хостинг</td>
    <td class="tr3">Name Server: ns1.progressive.com<br>
Name Server: ns7.progressive.com<br>
Name Server: ns5.progressive.com<br>
Name Server: ns3.progressive.com<br>
Регистратор: CSC CORPORATE DOMAINS, INC.</td>
  </tr>
  <tr>
    <td class="tr4">**8**</td>
    <td class="tr3">Web-технологии</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/web1.png)</td>
  </tr>
</table>
<table>
  <caption>
  **Analog Devices Inc.:**
  </caption>
  <col width="31">
 <tr>
    <td class="tr4">**1**</td>
    <td class="tr4">Сайт</td>
    <td class="tr4">https://www.analog.com/</td>
  </tr>
  <col width="159">
  <tr>
    <td class="tr4">**2**</td>
    <td class="tr3">IP-адрес</td>
    <td class="tr3">*137.71.173.128*<br>**United States**</td>
  </tr>
  <col width="810">
  <tr>
    <td class="tr4">**3**</td>
    <td class="tr3">Местонахождение</td>
    <td class="tr3">**Address:** Two Technology Way<br>
**City:** Norwood<br>
**StateProv:** MA<br>
**PostalCode:** 02062<br>
**Country:** US</td>
  </tr>
  <tr>
    <td class="tr4">**4**</td>
    <td class="tr3">Телефон</td>
    <td class="tr3">OrgTech (Analog DNS Administrator): +1-781-461-3040 US
    <br>RTech (Analog Devices): +1-781-461-3719 US</td>
  </tr>
  <tr>
    <td class="tr4">**5**</td>
    <td class="tr3">E-mail</td>
    <td class="tr3">OrgTech: don.balunos@analog.com<br>RTech: InternetServices@analog.com
    </td>
  </tr>
  <tr>
    <td class="tr4">**6**</td>
    <td class="tr3">Порты</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/nmap.png)</td>
  </tr>
  <tr>
    <td class="tr4">**7**</td>
    <td class="tr3">Хостинг</td>
    <td class="tr3">Name Server: udns1.cscdns.net<br>
Name Server: udns2.cscdns.uk<br>
Регистратор: CSC CORPORATE DOMAINS, INC.</td>
  </tr>
  <tr>
    <td class="tr4">**8**</td>
    <td class="tr3">Web-технологии</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/web2.png)</td>
  </tr>
</table>
<table>
<caption>
  **Allstate Corporation:**
  </caption>
  <col width="31">
 <tr>
    <td class="tr4">**1**</td>
    <td class="tr4">Сайт</td>
    <td class="tr4">https://www.allstate.com/</td>
  </tr>
  <col width="159">
  <tr>
    <td class="tr4">**2**</td>
    <td class="tr3">IP-адрес</td>
    <td class="tr3">*167.127.208.24*<br>**United States**</td>
  </tr>
  <col width="810">
  <tr>
    <td class="tr4">**3**</td>
    <td class="tr3">Местонахождение</td>
    <td class="tr3">**Address:** 3075 Sanders Road<br>
**City:** Northbrook<br>
**StateProv:** IL<br>
**PostalCode:** 60062-7127<br>
**Country:** US</td>
  </tr>
  <tr>
    <td class="tr4">**4**</td>
    <td class="tr3">Телефон</td>
    <td class="tr3">Domain Administrator: +1-847-402-5000 US</td>
  </tr>
  <tr>
    <td class="tr4">**5**</td>
    <td class="tr3">E-mail</td>
    <td class="tr3">Domain Administrator: dnsadmin@allstate.com</td>
  </tr>
  <tr>
    <td class="tr4">**6**</td>
    <td class="tr3">Порты</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/nmap.png)</td>
  </tr>
  <tr>
    <td class="tr4">**7**</td>
    <td class="tr3">Хостинг</td>
    <td class="tr3">Name Server: ns1.allstate.com<br>
Name Server: ns1.allstate.com<br>
Регистратор: Brandsight, Inc.</td>
  </tr>
  <tr>
    <td class="tr4">**8**</td>
    <td class="tr3">Web-технологии</td>
    <td class="tr3">Нет данных</td>
  </tr>
</table>
<table>
  <caption>
  **SunTrust Banks Inc.:**
  </caption>
  <col width="31">
 <tr>
    <td class="tr4">**1**</td>
    <td class="tr4">Сайт</td>
    <td class="tr4">https://suntrustng.com/</td>
  </tr>
  <col width="159">
  <tr>
    <td class="tr4">**2**</td>
    <td class="tr3">IP-адрес</td>
    <td class="tr3">*107.180.25.42*<br>**United States**</td>
  </tr>
  <col width="810">
  <tr>
    <td class="tr4">**3**</td>
    <td class="tr3">Местонахождение</td>
    <td class="tr3">**Address:** Suite 226<br>
**City:** Scottsdale<br>
**StateProv:** AZ<br>
**PostalCode:** 85260<br>
**Country:** US</td>
  </tr>
  <tr>
    <td class="tr4">**4**</td>
    <td class="tr3">Телефон</td>
    <td class="tr3">Network Operations Center: +1-480-505-8809 US<br>
    Abuse Departament: +1-480-624-2505</td>
  </tr>
  <tr>
    <td class="tr4">**5**</td>
    <td class="tr3">E-mail</td>
    <td class="tr3">Network Operations Center: noc@godaddy.com<br>
    Abuse Departament: abuse@godaddy.com</td>
  </tr>
  <tr>
    <td class="tr4">**6**</td>
    <td class="tr3">Порты</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/nmap_suntrust.png)</td>
  </tr>
  <tr>
    <td class="tr4">**7**</td>
    <td class="tr3">Хостинг</td>
    <td class="tr3">Name Server: ns49.domaincontrol.com<br>
Name Server: ns50.domaincontrol.com<br>
Регистратор: GoDaddy.com, LLC</td>
  </tr>
  <tr>
    <td class="tr4">**8**</td>
    <td class="tr3">Web-технологии</td>
    <td class="tr3">Web server: Apache<br>
    Web framework: Bootstrap<br>Database: MySQL<br>Programming Language: PHP (v.7.2.26)</td>
  </tr>
</table>  
<table>
  <caption>
  **Sherwin-Willams Company:**
  </caption>
  <col width="31">
 <tr>
    <td class="tr4">**1**</td>
    <td class="tr4">Сайт</td>
    <td class="tr4">https://www.sherwin-williams.com/</td>
  </tr>
  <col width="159">
  <tr>
    <td class="tr4">**2**</td>
    <td class="tr3">IP-адрес</td>
    <td class="tr3">*169.44.56.48*<br>**United States**</td>
  </tr>
  <col width="810">
  <tr>
    <td class="tr4">**3**</td>
    <td class="tr3">Местонахождение</td>
    <td class="tr3">**Address:** 101 W. Prospect Ave.<br>
**City:** Cleveland<br>
**StateProv:** OH<br>
**PostalCode:** 44115<br>
**Country:** US</td>
  </tr>
  <tr>
    <td class="tr4">**4**</td>
    <td class="tr3">Телефон</td>
    <td class="tr3">Jerry Kozik: +1-866-398-7638 US<br>
    Admin phone (Michael Sura): +1-216-566-20-00<br>Tech phone (John Jensen): +1-216-566-1783
    <br></td>
  </tr>
  <tr>
    <td class="tr4">**5**</td>
    <td class="tr3">E-mail</td>
    <td class="tr3">Admin email: hostmaster@sherwin.com<br>
    Tech email: hostmaster@sherwin.com</td>
  </tr>
  <tr>
    <td class="tr4">**6**</td>
    <td class="tr3">Порты</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/nmap.png)</td>
  </tr>
  <tr>
    <td class="tr4">**7**</td>
    <td class="tr3">Хостинг</td>
    <td class="tr3">Name Server: ns1.sherwin.com<br>
Name Server: ns2.sherwin.com<br>
Name Server: ns3.level3.net<br>
Name Server: ns4.level3.net<br>
Регистратор: CSC CORPORATE DOMAINS, INC. </td>
  </tr>
  <tr>
    <td class="tr4">**8**</td>
    <td class="tr3">Web-технологии</td>
    <td class="tr3">![](/home/jager/Рабочий стол/RStudio_lab/web5.png)</td>
  </tr>
</table>
<table>
  <caption>
  **Вывод:**
  </caption>
  <col width="1000">
  <tr>
    <td class="tr1">**Мы произвели разведку целей, в дальнейшем найденную информацию можно будет использовать при выборе направления атаки на цель**
    </td>
  </tr>
</table>
  





