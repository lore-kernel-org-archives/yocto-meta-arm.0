Return-Path: <hv7005920@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215C0CD5BC7
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 13:17:28 +0000 (UTC)
Subject: qt meta-toolchain for rzg2l #toolchain
To: meta-arm@lists.yoctoproject.org
From: hv7005920@gmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.82.248)
X-Originating-Platform: Windows Chrome 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 05 Sep 2024 06:17:27 -0700
Message-ID: <U7jb.1725542247813080822.I1o5@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="pQyyd53QMaTEhqINQ4l0"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Sep 2024 13:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6064

--pQyyd53QMaTEhqINQ4l0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I was trying to get toolchain for cross-compiling qt apps for rzg2l (having=
 yocto on it), but int the process I am getting these fetch errors, I even =
tried to change the SRC_URL , but errors like checksum are coming, can you =
please help me with this.

$ bitbake meta-toolchain-qt5
Loading cache: 100% |######################################################=
####################################################| Time: 0:00:00
Loaded 3084 entries from dependency cache.
Parsing recipes: 100% |####################################################=
####################################################| Time: 0:00:00
Parsing of 2013 .bb files complete (2012 cached, 1 parsed). 3084 targets, 1=
08 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION =3D "1.46.0"
BUILD_SYS =3D "x86_64-linux"
NATIVELSBSTRING =3D "universal"
TARGET_SYS =3D "aarch64-poky-linux"
MACHINE =3D "smarc-rzg2l"
DISTRO =3D "poky"
DISTRO_VERSION =3D "3.1.33"
TUNE_FEATURES =3D "aarch64 cortexa55"
TARGET_FPU =3D ""
SOC_FAMILY =3D "rzg2l:r9a07g044l"
meta
meta-poky
meta-yocto-bsp =3D "my-dunfell:63d05fc061006bf1a88630d6d91cdc76ea33fbf2"
meta-oe
meta-python =3D "dunfell:01358b6d705071cc0ac5aefa7670ab235709729a"
meta-rz-common
meta-rzg2l =3D "dunfell/rz:b028eb836091fcfd8873c49ba46a9817b290105f"
meta-qt5 =3D "dunfell:5ef3a0ffd3324937252790266e2b2e64d33ef34f"

Initialising tasks: 100% |#################################################=
####################################################| Time: 0:00:04
Sstate summary: Wanted 2419 Found 0 Missed 2419 Current 399 (0% match, 14% =
complete)
NOTE: Executing Tasks
WARNING: qtdeclarative-5.6.3+gitAUTOINC+bb01612a88-r0 do_fetch: Failed to f=
etch URL git://code.qt.io/qt/qtdeclarative.git;name=3Dqtdeclarative;branch=
=3D5.14;protocol=3Dgit, attempting MIRRORS if available
WARNING: qtbase-native-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Failed to f=
etch URL git://code.qt.io/qt/qtbase.git;name=3Dqtbase;branch=3D5.14;protoco=
l=3Dgit, attempting MIRRORS if available
ERROR: qtdeclarative-5.6.3+gitAUTOINC+bb01612a88-r0 do_fetch: Fetcher failu=
re: Unable to find revision bb01612a8809efd268903e41b9e3a17cff48f1c0 in bra=
nch 5.14 even from upstream
ERROR: qtdeclarative-5.6.3+gitAUTOINC+bb01612a88-r0 do_fetch: Bitbake Fetch=
er Error: FetchError('Unable to fetch URL from any source.', 'git://code.qt=
.io/qt/qtdeclarative.git;name=3Dqtdeclarative;branch=3D5.14;protocol=3Dgit'=
)
ERROR: Logfile of failure stored in: /media/harshavardhan/64a915db-de5e-413=
8-8463-eb7c0923d483/rz-yocto/poky/build/tmp/work/aarch64-poky-linux/qtdecla=
rative/5.6.3+gitAUTOINC+bb01612a88-r0/temp/log.do_fetch.37790
ERROR: Task (/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-y=
octo/poky/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_fetch) failed wit=
h exit code '1'
ERROR: qtbase-native-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Fetcher failu=
re: Unable to find revision e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a in bra=
nch 5.14 even from upstream
ERROR: qtbase-native-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Bitbake Fetch=
er Error: FetchError('Unable to fetch URL from any source.', 'git://code.qt=
.io/qt/qtbase.git;name=3Dqtbase;branch=3D5.14;protocol=3Dgit')
ERROR: Logfile of failure stored in: /media/harshavardhan/64a915db-de5e-413=
8-8463-eb7c0923d483/rz-yocto/poky/build/tmp/work/x86_64-linux/qtbase-native=
/5.6.3+gitAUTOINC+e6f8b072d2-r0/temp/log.do_fetch.37733
ERROR: Task (/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-y=
octo/poky/meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_fetch) failed wit=
h exit code '1'
WARNING: qtbase-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Failed to fetch UR=
L git://code.qt.io/qt/qtbase.git;name=3Dqtbase;branch=3D5.14;protocol=3Dgit=
, attempting MIRRORS if available
ERROR: qtbase-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Fetcher failure: Una=
ble to find revision e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a in branch 5.1=
4 even from upstream
ERROR: qtbase-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Bitbake Fetcher Erro=
r: FetchError('Unable to fetch URL from any source.', 'git://code.qt.io/qt/=
qtbase.git;name=3Dqtbase;branch=3D5.14;protocol=3Dgit')
ERROR: Logfile of failure stored in: /media/harshavardhan/64a915db-de5e-413=
8-8463-eb7c0923d483/rz-yocto/poky/build/tmp/work/aarch64-poky-linux/qtbase/=
5.6.3+gitAUTOINC+e6f8b072d2-r0/temp/log.do_fetch.37734
ERROR: Task (/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-y=
octo/poky/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_fetch) failed with exit =
code '1'
NOTE: Tasks Summary: Attempted 1593 tasks of which 1360 didn't need to be r=
erun and 3 failed.

Summary: 3 tasks failed:
/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/met=
a-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_fetch
/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/met=
a-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_fetch
/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/met=
a-qt5/recipes-qt/qt5/qtbase_git.bb:do_fetch
Summary: There were 3 WARNING messages shown.
Summary: There were 6 ERROR messages shown, returning a non-zero exit code.

--pQyyd53QMaTEhqINQ4l0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p dir=3D"auto" style=3D"box-sizing: border-box; margin-top: 0px; margin-bo=
ttom: 1rem; max-height: 1e+06px; text-size-adjust: none; color: #000000; fo=
nt-family: 'Titillium Web', Inter, system-ui, -apple-system, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;">I was trying to get toolchai=
n for cross-compiling qt apps for rzg2l (having yocto on it), but int the p=
rocess I am getting these fetch errors, I even tried to change the SRC_URL =
, but errors like checksum are coming, can you please help me with this.</p=
>
<p dir=3D"auto" style=3D"box-sizing: border-box; margin-top: 0px; margin-bo=
ttom: 1rem; max-height: 1e+06px; text-size-adjust: none; color: #000000; fo=
nt-family: 'Titillium Web', Inter, system-ui, -apple-system, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;">$ bitbake meta-toolchain-qt5=
<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust:=
 none;" />Loading cache: 100% |############################################=
##############################################################| Time: 0:00:=
00<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjus=
t: none;" />Loaded 3084 entries from dependency cache.<br style=3D"box-sizi=
ng: border-box; max-height: 1e+06px; text-size-adjust: none;" />Parsing rec=
ipes: 100% |###############################################################=
#########################################| Time: 0:00:00<br style=3D"box-si=
zing: border-box; max-height: 1e+06px; text-size-adjust: none;" />Parsing o=
f 2013 .bb files complete (2012 cached, 1 parsed). 3084 targets, 108 skippe=
d, 1 masked, 0 errors.<br style=3D"box-sizing: border-box; max-height: 1e+0=
6px; text-size-adjust: none;" />NOTE: Resolving any missing task queue depe=
ndencies</p>
<p dir=3D"auto" style=3D"box-sizing: border-box; margin-top: 0px; margin-bo=
ttom: 1rem; max-height: 1e+06px; text-size-adjust: none; color: #000000; fo=
nt-family: 'Titillium Web', Inter, system-ui, -apple-system, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;">Build Configuration:<br styl=
e=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: none;" =
/>BB_VERSION =3D "1.46.0"<br style=3D"box-sizing: border-box; max-height: 1=
e+06px; text-size-adjust: none;" />BUILD_SYS =3D "x86_64-linux"<br style=3D=
"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: none;" />NA=
TIVELSBSTRING =3D "universal"<br style=3D"box-sizing: border-box; max-heigh=
t: 1e+06px; text-size-adjust: none;" />TARGET_SYS =3D "aarch64-poky-linux"<=
br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: =
none;" />MACHINE =3D "smarc-rzg2l"<br style=3D"box-sizing: border-box; max-=
height: 1e+06px; text-size-adjust: none;" />DISTRO =3D "poky"<br style=3D"b=
ox-sizing: border-box; max-height: 1e+06px; text-size-adjust: none;" />DIST=
RO_VERSION =3D "3.1.33"<br style=3D"box-sizing: border-box; max-height: 1e+=
06px; text-size-adjust: none;" />TUNE_FEATURES =3D "aarch64 cortexa55"<br s=
tyle=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: none=
;" />TARGET_FPU =3D ""<br style=3D"box-sizing: border-box; max-height: 1e+0=
6px; text-size-adjust: none;" />SOC_FAMILY =3D "rzg2l:r9a07g044l"<br style=
=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: none;" /=
>meta<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-ad=
just: none;" />meta-poky<br style=3D"box-sizing: border-box; max-height: 1e=
+06px; text-size-adjust: none;" />meta-yocto-bsp =3D "my-dunfell:63d05fc061=
006bf1a88630d6d91cdc76ea33fbf2"<br style=3D"box-sizing: border-box; max-hei=
ght: 1e+06px; text-size-adjust: none;" />meta-oe<br style=3D"box-sizing: bo=
rder-box; max-height: 1e+06px; text-size-adjust: none;" />meta-python =3D "=
dunfell:01358b6d705071cc0ac5aefa7670ab235709729a"<br style=3D"box-sizing: b=
order-box; max-height: 1e+06px; text-size-adjust: none;" />meta-rz-common<b=
r style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: n=
one;" />meta-rzg2l =3D "dunfell/rz:b028eb836091fcfd8873c49ba46a9817b290105f=
"<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust=
: none;" />meta-qt5 =3D "dunfell:5ef3a0ffd3324937252790266e2b2e64d33ef34f"<=
/p>
<p dir=3D"auto" style=3D"box-sizing: border-box; margin-top: 0px; margin-bo=
ttom: 1rem; max-height: 1e+06px; text-size-adjust: none; color: #000000; fo=
nt-family: 'Titillium Web', Inter, system-ui, -apple-system, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;">Initialising tasks: 100% |##=
###########################################################################=
########################| Time: 0:00:04<br style=3D"box-sizing: border-box;=
 max-height: 1e+06px; text-size-adjust: none;" />Sstate summary: Wanted 241=
9 Found 0 Missed 2419 Current 399 (0% match, 14% complete)<br style=3D"box-=
sizing: border-box; max-height: 1e+06px; text-size-adjust: none;" />NOTE: E=
xecuting Tasks<br style=3D"box-sizing: border-box; max-height: 1e+06px; tex=
t-size-adjust: none;" />WARNING: qtdeclarative-5.6.3+gitAUTOINC+bb01612a88-=
r0 do_fetch: Failed to fetch URL git://code.qt.io/qt/qtdeclarative.git;name=
=3Dqtdeclarative;branch=3D5.14;protocol=3Dgit, attempting MIRRORS if availa=
ble<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adju=
st: none;" />WARNING: qtbase-native-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch=
: Failed to fetch URL git://code.qt.io/qt/qtbase.git;name=3Dqtbase;branch=
=3D5.14;protocol=3Dgit, attempting MIRRORS if available<br style=3D"box-siz=
ing: border-box; max-height: 1e+06px; text-size-adjust: none;" />ERROR: qtd=
eclarative-5.6.3+gitAUTOINC+bb01612a88-r0 do_fetch: Fetcher failure: Unable=
 to find revision bb01612a8809efd268903e41b9e3a17cff48f1c0 in branch 5.14 e=
ven from upstream<br style=3D"box-sizing: border-box; max-height: 1e+06px; =
text-size-adjust: none;" />ERROR: qtdeclarative-5.6.3+gitAUTOINC+bb01612a88=
-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from a=
ny source.', 'git://code.qt.io/qt/qtdeclarative.git;name=3Dqtdeclarative;br=
anch=3D5.14;protocol=3Dgit')<br style=3D"box-sizing: border-box; max-height=
: 1e+06px; text-size-adjust: none;" />ERROR: Logfile of failure stored in: =
/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/bui=
ld/tmp/work/aarch64-poky-linux/qtdeclarative/5.6.3+gitAUTOINC+bb01612a88-r0=
/temp/log.do_fetch.37790<br style=3D"box-sizing: border-box; max-height: 1e=
+06px; text-size-adjust: none;" />ERROR: Task (/media/harshavardhan/64a915d=
b-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/meta-qt5/recipes-qt/qt5/qtdecla=
rative_git.bb:do_fetch) failed with exit code '1'<br style=3D"box-sizing: b=
order-box; max-height: 1e+06px; text-size-adjust: none;" />ERROR: qtbase-na=
tive-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Fetcher failure: Unable to fi=
nd revision e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a in branch 5.14 even fr=
om upstream<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-s=
ize-adjust: none;" />ERROR: qtbase-native-5.6.3+gitAUTOINC+e6f8b072d2-r0 do=
_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any sou=
rce.', 'git://code.qt.io/qt/qtbase.git;name=3Dqtbase;branch=3D5.14;protocol=
=3Dgit')<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size=
-adjust: none;" />ERROR: Logfile of failure stored in: /media/harshavardhan=
/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/build/tmp/work/x86_64-l=
inux/qtbase-native/5.6.3+gitAUTOINC+e6f8b072d2-r0/temp/log.do_fetch.37733<b=
r style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: n=
one;" />ERROR: Task (/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d=
483/rz-yocto/poky/meta-qt5/recipes-qt/qt5/qtbase-native_git.bb:do_fetch) fa=
iled with exit code '1'<br style=3D"box-sizing: border-box; max-height: 1e+=
06px; text-size-adjust: none;" />WARNING: qtbase-5.6.3+gitAUTOINC+e6f8b072d=
2-r0 do_fetch: Failed to fetch URL git://code.qt.io/qt/qtbase.git;name=3Dqt=
base;branch=3D5.14;protocol=3Dgit, attempting MIRRORS if available<br style=
=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: none;" /=
>ERROR: qtbase-5.6.3+gitAUTOINC+e6f8b072d2-r0 do_fetch: Fetcher failure: Un=
able to find revision e6f8b072d2bf15f8b82bede48ff29ce8ac8dbd9a in branch 5.=
14 even from upstream<br style=3D"box-sizing: border-box; max-height: 1e+06=
px; text-size-adjust: none;" />ERROR: qtbase-5.6.3+gitAUTOINC+e6f8b072d2-r0=
 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any =
source.', 'git://code.qt.io/qt/qtbase.git;name=3Dqtbase;branch=3D5.14;proto=
col=3Dgit')<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-s=
ize-adjust: none;" />ERROR: Logfile of failure stored in: /media/harshavard=
han/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/build/tmp/work/aarch=
64-poky-linux/qtbase/5.6.3+gitAUTOINC+e6f8b072d2-r0/temp/log.do_fetch.37734=
<br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust:=
 none;" />ERROR: Task (/media/harshavardhan/64a915db-de5e-4138-8463-eb7c092=
3d483/rz-yocto/poky/meta-qt5/recipes-qt/qt5/qtbase_git.bb:do_fetch) failed =
with exit code '1'<br style=3D"box-sizing: border-box; max-height: 1e+06px;=
 text-size-adjust: none;" />NOTE: Tasks Summary: Attempted 1593 tasks of wh=
ich 1360 didn't need to be rerun and 3 failed.</p>
<p dir=3D"auto" style=3D"box-sizing: border-box; margin-top: 0px; margin-bo=
ttom: 1rem; max-height: 1e+06px; text-size-adjust: none; color: #000000; fo=
nt-family: 'Titillium Web', Inter, system-ui, -apple-system, 'Segoe UI', Ro=
boto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, =
'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji=
'; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;">Summary: 3 tasks failed:<br =
style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: non=
e;" />/media/harshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/po=
ky/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_fetch<br style=3D"box-si=
zing: border-box; max-height: 1e+06px; text-size-adjust: none;" />/media/ha=
rshavardhan/64a915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/meta-qt5/rec=
ipes-qt/qt5/qtbase-native_git.bb:do_fetch<br style=3D"box-sizing: border-bo=
x; max-height: 1e+06px; text-size-adjust: none;" />/media/harshavardhan/64a=
915db-de5e-4138-8463-eb7c0923d483/rz-yocto/poky/meta-qt5/recipes-qt/qt5/qtb=
ase_git.bb:do_fetch<br style=3D"box-sizing: border-box; max-height: 1e+06px=
; text-size-adjust: none;" />Summary: There were 3 WARNING messages shown.<=
br style=3D"box-sizing: border-box; max-height: 1e+06px; text-size-adjust: =
none;" />Summary: There were 6 ERROR messages shown, returning a non-zero e=
xit code.</p>
</div>

--pQyyd53QMaTEhqINQ4l0--

