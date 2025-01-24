Return-Path: <willhowe235@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9D5C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 19:27:30 +0000 (UTC)
Subject: Failing to fetch beaglebone kernel from github
To: meta-arm@lists.yoctoproject.org
From: willhowe235@gmail.com
X-Originating-Location: Catonsville, Maryland, US (174.192.198.253)
X-Originating-Platform: Windows Chrome 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 11:27:27 -0800
Message-ID: <lrnS.1737746847989365062.hDBY@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="ZbQ7AOq3HnKEdE6P02jx"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2025 19:27:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6348

--ZbQ7AOq3HnKEdE6P02jx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm new to the yocto project and I'm a first time poster. Currently I am fo=
llowing this tutorial ( https://www.youtube.com/watch?v=3DMKpLQ2bGsAk&t=3D8=
39s )=C2=A0 on Youtube and I am running into a snag on fetching linux-bb.or=
g_6.6.

- I'm on WSL (Ubuntu 24.04.1 LTS release)
- I have successfully built qemuarm and run it on WSL
- My tree looks like this:

whowe1@DESKTOP-ET9NNLC:~/yocto_live_coding_project$ tree -d -L 2
.
=E2=94=9C=E2=94=80=E2=94=80 build
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 cache
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 conf
=E2=94=9C=E2=94=80=E2=94=80 meta-arm
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 ci
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 documentation
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 kas
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-arm
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-arm-bsp
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-arm-systemready
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-arm-toolchain
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 scripts
=E2=94=9C=E2=94=80=E2=94=80 meta-ti
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-beagle
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-ti-bsp
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 meta-ti-extras
=E2=94=9C=E2=94=80=E2=94=80 poky
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 bitbake
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 build
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 contrib
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 documentation
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-poky
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-selftest
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-skeleton
=E2=94=82 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 meta-yocto-bsp
=E2=94=82 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 scripts
=E2=94=94=E2=94=80=E2=94=80 simplehello
=E2=94=94=E2=94=80=E2=94=80 CMakeFiles
59 directories
whowe1@DESKTOP-ET9NNLC:~/yocto_live_coding_project$

- meta-arm, meta-ti, and meta-poky are all currently checked out to "scarth=
gap"
- my MACHINE is currently set to build "beaglebone" in conf/local.conf
- the additional arm layers have been added to my bblayers.conf

Interestingly, a fellow tutorial follower seems to have encountered this is=
sue and posted about it here ( https://github.com/beagleboard/linux/issues/=
290 ) to no avail.

Here is the error on my machine:

whowe1@DESKTOP-ET9NNLC:~/yocto_live_coding_project/build$ bitbake core-imag=
e-minimal
WARNING: Host distribution "ubuntu-24.04" has not been validated with this =
version of the build system; you may possibly experience unexpected failure=
s. It is recommended that you use a tested distribution.
Loading cache: 100% |######################################################=
###########################################################################=
###########################################################################=
############| Time: 0:00:00
Loaded 2013 entries from dependency cache.
Parsing recipes: 100% |####################################################=
###########################################################################=
###########################################################################=
############| Time: 0:00:00
Parsing of 1033 .bb files complete (1032 cached, 1 parsed). 2013 targets, 1=
63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
Build Configuration:
BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.8.0"
BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "x86_64-linux"
NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D "universal"
TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "arm-poky-linux-gnueabi"
MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "beaglebone"
DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "poky"
DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D "5.0.6"
TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "arm armv7a vfp thumb neon cal=
lconvention-hard"
TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hard"
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "my-scarth=
gap:7117d115eab7351ecf21388ec720a3bb5f4a9b30"
meta-beagle
meta-ti-bsp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "my-scarthgap:4213a71a8ea=
ed4a57562c0608f9ba29efc39eede"
meta-arm
meta-arm-toolchain =C2=A0 =3D "my-scarthgap:a8fe9d22eaefc294f91096c6a32663e=
2f4ab3b10"
meta-poky
meta-yocto-bsp =C2=A0 =C2=A0 =C2=A0 =3D "my-scarthgap:7117d115eab7351ecf213=
88ec720a3bb5f4a9b30"
Sstate summary: Wanted 750 Local 7 Mirrors 0 Missed 743 Current 1094 (0% ma=
tch, 59% complete)#########################################################=
################################################################# =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=
 =C2=A00:00:00
Removing 2 stale sstate objects for arch beaglebone: 100% |################=
###########################################################################=
###########################################################################=
############| Time: 0:00:00
NOTE: Executing Tasks
WARNING: linux-bb.org-6.6.32+git-r0 do_fetch: Failed to fetch URL git://git=
hub.com/beagleboard/linux.git;protocol=3Dhttps;branch=3Dv6.6.32-ti-arm32-r7=
, attempting MIRRORS if available
ERROR: linux-bb.org-6.6.32+git-r0 do_fetch: Fetcher failure: Fetch command =
export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D=
/run/user/1000/bus"; export PATH=3D"/home/whowe1/tmp/sysroots-uninative/x86=
_64-linux/usr/bin:/home/whowe1/yocto_live_coding_project/poky/scripts:/home=
/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/reci=
pe-sysroot-native/usr/bin/arm-poky-linux-gnueabi:/home/whowe1/tmp/work/beag=
lebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot/usr/bin/cr=
ossscripts:/home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org=
/6.6.32+git/recipe-sysroot-native/usr/sbin:/home/whowe1/tmp/work/beaglebone=
-poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot-native/usr/bin:/=
home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/=
recipe-sysroot-native/sbin:/home/whowe1/tmp/work/beaglebone-poky-linux-gnue=
abi/linux-bb.org/6.6.32+git/recipe-sysroot-native/bin:/home/whowe1/yocto_li=
ve_coding_project/poky/bitbake/bin:/home/whowe1/tmp/hosttools"; export HOME=
=3D"/home/whowe1"; LANG=3DC git -c gc.autoDetach=3Dfalse -c core.pager=3Dca=
t -c safe.bareRepository=3Dall fetch -f --progress https://github.com/beagl=
eboard/linux.git refs/heads/*:refs/heads/* refs/tags/*:refs/tags/* failed w=
ith exit code 128, see logfile for output
ERROR: linux-bb.org-6.6.32+git-r0 do_fetch: Bitbake Fetcher Error: FetchErr=
or('Unable to fetch URL from any source.', 'git://github.com/beagleboard/li=
nux.git;protocol=3Dhttps;branch=3Dv6.6.32-ti-arm32-r7')
ERROR: Logfile of failure stored in: /home/whowe1/tmp/work/beaglebone-poky-=
linux-gnueabi/linux-bb.org/6.6.32+git/temp/log.do_fetch.1038389
ERROR: Task (/home/whowe1/yocto_live_coding_project/meta-ti/meta-beagle/rec=
ipes-kernel/linux/linux-bb.org_6.6.bb:do_fetch) failed with exit code '1'

Any ideas or help is much appreciated..

Thanks!

--ZbQ7AOq3HnKEdE6P02jx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello all,</div>
<div>&nbsp;</div>
<div>I'm new to the yocto project and I'm a first time poster. Currently I =
am following this tutorial (<a href=3D"https://www.youtube.com/watch?v=3DMK=
pLQ2bGsAk&amp;t=3D839s" target=3D"_blank" rel=3D"noopener">https://www.yout=
ube.com/watch?v=3DMKpLQ2bGsAk&amp;t=3D839s</a>)&nbsp; on Youtube and I am r=
unning into a snag on fetching linux-bb.org_6.6.</div>
<div>&nbsp;</div>
<div>- I'm on WSL (Ubuntu 24.04.1 LTS release)</div>
<div>- I have successfully built qemuarm and run it on WSL</div>
<div>- My tree looks like this:</div>
<div>&nbsp;</div>
<div>
<div>whowe1@DESKTOP-ET9NNLC:~/yocto_live_coding_project$ tree -d -L 2<br />=
.<br />=E2=94=9C=E2=94=80=E2=94=80 build<br />=E2=94=82 &nbsp; =E2=94=9C=E2=
=94=80=E2=94=80 cache<br />=E2=94=82 &nbsp; =E2=94=94=E2=94=80=E2=94=80 con=
f<br />=E2=94=9C=E2=94=80=E2=94=80 meta-arm<br />=E2=94=82 &nbsp; =E2=94=9C=
=E2=94=80=E2=94=80 ci<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 doc=
umentation<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 kas<br />=E2=
=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 meta-arm<br />=E2=94=82 &nbsp; =
=E2=94=9C=E2=94=80=E2=94=80 meta-arm-bsp<br />=E2=94=82 &nbsp; =E2=94=9C=E2=
=94=80=E2=94=80 meta-arm-systemready<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=
=80=E2=94=80 meta-arm-toolchain<br />=E2=94=82 &nbsp; =E2=94=94=E2=94=80=E2=
=94=80 scripts<br />=E2=94=9C=E2=94=80=E2=94=80 meta-ti<br />=E2=94=82 &nbs=
p; =E2=94=9C=E2=94=80=E2=94=80 meta-beagle<br />=E2=94=82 &nbsp; =E2=94=9C=
=E2=94=80=E2=94=80 meta-ti-bsp<br />=E2=94=82 &nbsp; =E2=94=94=E2=94=80=E2=
=94=80 meta-ti-extras<br />=E2=94=9C=E2=94=80=E2=94=80 poky<br />=E2=94=82 =
&nbsp; =E2=94=9C=E2=94=80=E2=94=80 bitbake<br />=E2=94=82 &nbsp; =E2=94=9C=
=E2=94=80=E2=94=80 build<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 =
contrib<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 documentation<br =
/>=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 meta<br />=E2=94=82 &nbsp; =
=E2=94=9C=E2=94=80=E2=94=80 meta-poky<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=
=80=E2=94=80 meta-selftest<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=
=80 meta-skeleton<br />=E2=94=82 &nbsp; =E2=94=9C=E2=94=80=E2=94=80 meta-yo=
cto-bsp<br />=E2=94=82 &nbsp; =E2=94=94=E2=94=80=E2=94=80 scripts<br />=E2=
=94=94=E2=94=80=E2=94=80 simplehello<br />&nbsp; &nbsp; =E2=94=94=E2=94=80=
=E2=94=80 CMakeFiles</div>
<div>59 directories<br />whowe1@DESKTOP-ET9NNLC:~/yocto_live_coding_project=
$</div>
<div>&nbsp;</div>
<div>- meta-arm, meta-ti, and meta-poky are all currently checked out to "s=
carthgap"</div>
<div>- my MACHINE is currently set to build "beaglebone" in conf/local.conf=
</div>
<div>- the additional arm layers have been added to my bblayers.conf</div>
<div>&nbsp;</div>
<div>Interestingly, a fellow tutorial follower seems to have encountered th=
is issue and posted about it here (<a href=3D"https://github.com/beagleboar=
d/linux/issues/290" target=3D"_blank" rel=3D"noopener">https://github.com/b=
eagleboard/linux/issues/290</a>) to no avail.</div>
<div>&nbsp;</div>
<div>Here is the error on my machine:</div>
<div>&nbsp;</div>
<div>
<div>whowe1@DESKTOP-ET9NNLC:~/yocto_live_coding_project/build$ bitbake core=
-image-minimal<br />WARNING: Host distribution "ubuntu-24.04" has not been =
validated with this version of the build system; you may possibly experienc=
e unexpected failures. It is recommended that you use a tested distribution=
.<br />Loading cache: 100% |###############################################=
###########################################################################=
###########################################################################=
###################| Time: 0:00:00<br />Loaded 2013 entries from dependency=
 cache.<br />Parsing recipes: 100% |#######################################=
###########################################################################=
###########################################################################=
#########################| Time: 0:00:00<br />Parsing of 1033 .bb files com=
plete (1032 cached, 1 parsed). 2013 targets, 163 skipped, 0 masked, 0 error=
s.<br />NOTE: Resolving any missing task queue dependencies</div>
<div>Build Configuration:<br />BB_VERSION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; =3D "2.8.0"<br />BUILD_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "=
x86_64-linux"<br />NATIVELSBSTRING &nbsp; &nbsp; &nbsp;=3D "universal"<br /=
>TARGET_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "arm-poky-linux-gnueabi"=
<br />MACHINE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "beaglebo=
ne"<br />DISTRO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "poky"=
<br />DISTRO_VERSION &nbsp; &nbsp; &nbsp; =3D "5.0.6"<br />TUNE_FEATURES &n=
bsp; &nbsp; &nbsp; &nbsp;=3D "arm armv7a vfp thumb neon callconvention-hard=
"<br />TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "hard"<br />meta &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "my-scarthgap:71=
17d115eab7351ecf21388ec720a3bb5f4a9b30"<br />meta-beagle<br />meta-ti-bsp &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "my-scarthgap:4213a71a8eaed4a57562c060=
8f9ba29efc39eede"<br />meta-arm<br />meta-arm-toolchain &nbsp; =3D "my-scar=
thgap:a8fe9d22eaefc294f91096c6a32663e2f4ab3b10"<br />meta-poky<br />meta-yo=
cto-bsp &nbsp; &nbsp; &nbsp; =3D "my-scarthgap:7117d115eab7351ecf21388ec720=
a3bb5f4a9b30"</div>
<div>Sstate summary: Wanted 750 Local 7 Mirrors 0 Missed 743 Current 1094 (=
0% match, 59% complete)####################################################=
###################################################################### &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| E=
TA: &nbsp;0:00:00<br />Removing 2 stale sstate objects for arch beaglebone:=
 100% |####################################################################=
###########################################################################=
###################################| Time: 0:00:00<br />NOTE: Executing Tas=
ks<br />WARNING: linux-bb.org-6.6.32+git-r0 do_fetch: Failed to fetch URL g=
it://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3Dv6.6.32-ti-=
arm32-r7, attempting MIRRORS if available<br />ERROR: linux-bb.org-6.6.32+g=
it-r0 do_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; =
export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export =
PATH=3D"/home/whowe1/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/whow=
e1/yocto_live_coding_project/poky/scripts:/home/whowe1/tmp/work/beaglebone-=
poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot-native/usr/bin/ar=
m-poky-linux-gnueabi:/home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/li=
nux-bb.org/6.6.32+git/recipe-sysroot/usr/bin/crossscripts:/home/whowe1/tmp/=
work/beaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot-n=
ative/usr/sbin:/home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb=
.org/6.6.32+git/recipe-sysroot-native/usr/bin:/home/whowe1/tmp/work/beagleb=
one-poky-linux-gnueabi/linux-bb.org/6.6.32+git/recipe-sysroot-native/sbin:/=
home/whowe1/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/6.6.32+git/=
recipe-sysroot-native/bin:/home/whowe1/yocto_live_coding_project/poky/bitba=
ke/bin:/home/whowe1/tmp/hosttools"; export HOME=3D"/home/whowe1"; LANG=3DC =
git -c gc.autoDetach=3Dfalse -c core.pager=3Dcat -c safe.bareRepository=3Da=
ll fetch -f --progress https://github.com/beagleboard/linux.git refs/heads/=
*:refs/heads/* refs/tags/*:refs/tags/* failed with exit code 128, see logfi=
le for output<br />ERROR: linux-bb.org-6.6.32+git-r0 do_fetch: Bitbake Fetc=
her Error: FetchError('Unable to fetch URL from any source.', 'git://github=
.com/beagleboard/linux.git;protocol=3Dhttps;branch=3Dv6.6.32-ti-arm32-r7')<=
br />ERROR: Logfile of failure stored in: /home/whowe1/tmp/work/beaglebone-=
poky-linux-gnueabi/linux-bb.org/6.6.32+git/temp/log.do_fetch.1038389<br />E=
RROR: Task (/home/whowe1/yocto_live_coding_project/meta-ti/meta-beagle/reci=
pes-kernel/linux/linux-bb.org_6.6.bb:do_fetch) failed with exit code '1'</d=
iv>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Any ideas or help is much appreciated..</div>
<div>&nbsp;</div>
<div>Thanks!</div>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>

--ZbQ7AOq3HnKEdE6P02jx--

