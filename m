Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15204C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 20:15:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3228.1648671329367334700
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 13:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3E09940C3E;
	Wed, 30 Mar 2022 20:15:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7fuJIqLZIN2; Wed, 30 Mar 2022 20:15:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 10FAF40A03;
	Wed, 30 Mar 2022 20:15:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 41A611748C9; Wed, 30 Mar 2022 16:15:25 -0400 (EDT)
Date: Wed, 30 Mar 2022 16:15:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [meta-arm] [RFC] arm-toolchain: upgrade toolchains to
 11.2-2002.02
Message-ID: <20220330201525.GD23554@denix.org>
References: <20220322134327.4090222-1-jon.mason@arm.com>
 <20220322173040.GJ23554@denix.org>
 <CAPoiz9y0MxwurDc0_mHV5_J6knjUW0AAsuyztggvuj_nFsY5cg@mail.gmail.com>
 <20220322192750.GM23554@denix.org>
 <CAPoiz9w50dFv5nJFoPMwkZbsGWF+2ZwfEcbinD0EMw-wKCpxYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAPoiz9w50dFv5nJFoPMwkZbsGWF+2ZwfEcbinD0EMw-wKCpxYg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Mar 2022 20:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3216

On Tue, Mar 22, 2022 at 05:08:41PM -0400, Jon Mason wrote:
> On Tue, Mar 22, 2022 at 3:27 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Tue, Mar 22, 2022 at 03:20:37PM -0400, Jon Mason wrote:
> > > After a minor change and using -M25%
> >
> > Thanks! The patch is obviously malformed as it was sent as a reply, but
> > otherwise looks good to me.
> >
> > Feel free to add to the real patch:
> >
> > Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>

I have to retract my Reviewed-by, as the patch seems incorrect.


> If only this one worked.  I'm still seeing the error with do_install
> https://gitlab.com/jonmason00/meta-arm/-/jobs/2236954115
> 
> And no actual error in the log, and I'm not sure where to begin
> debugging it without an error in the log.  You can pull the code down
> from my gitlab
> https://gitlab.com/jonmason00/meta-arm/
> branch dev3
> 
> I would really appreciate your reviewed-by for the other patch (as I
> can actually confirm it works in our CI, and I'd like to get it in
> before the code freeze at the end of the month).
> https://lists.yoctoproject.org/g/meta-arm/message/3191

Here's the thing - you are updating baremetal toolchain recipes, which 
download their release tarballs on their own and not by CI.

You are also changing CI part that downloads Linux toolchain used by 
external-toolchain, not by baremetal toolchains.

So, you are feeding newer 11.2 Linux toolchain release to external-toolchain 
recipe that might need updating also due to subtle changes in their release 
structure.

There are 3 different types of toolchains in meta-arm-toolchain:

1. ARM Linux toolchain built from sources, then used to build the rest of the 
Linux system - recipes-devtool/gcc

2. ARM Linux toolchain using prebuilt binaries, expects those binaries to 
exist on the host (downloaded by CI) and the recipe then scrapes required 
pieces into sysroot, which then used to build the rest of the Linux system - 
recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb

3. ARM baremetal toolchains used to build firmware and non-Linux components, 
recipes are self-contained and download their binaries on their own - 
recipes-devtools/external-arm-toolchain/gcc-$arch-none-{elf/eabi}_*.bb

All 3 are independent of each other and have no re-use between them, as they 
are different. And thus can have different versions. #1 and #2 are mutually 
exclusive, as that's your main Linux toolchain. #3 can co-exist with either 
one of those two as it's for baremetal components.


So, Sumit's first patch updated #1 - source Linux toolchain. His second patch 
tried to update CI for #2 - external prebuilt Linux toolchain. That's where 
the error is coming from.

You then re-spinned the patch and besides updating CI for #2 toolchain, also 
bumped up #3 baremetal toolchains. The error is still there though and is in 
external prebuilt Linux toolchain (#2), not in baremetal toolchains (#3).

As I said earlier, it seems external-arm-toolchain also needs some adjustments 
for 11.2 besides pulling new tarballs in CI.

I might be able to find some time and look into fixing external-arm-toolchain 
to work with 11.2 prebuilt binary release in the next couple days. Worst case 
scenario - split your patch and only merge baremetal update, leaving CI at 
10.3 for now for external-arm-toolchain...


PS. it appears Patchwork is missing some patches, specifically both Sumit's 
first version to update #1, as well as your second re-spin for the same. 
Wonder if it's due to the patch size...

-- 
Denys


> > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > index 838342a1c572..394ce4131b9f 100755
> > > --- a/ci/get-binary-toolchains
> > > +++ b/ci/get-binary-toolchains
> > > @@ -2,7 +2,7 @@
> > >  set -u
> > >
> > >  HOST_ARCH=$(uname -m)
> > > -VER="10.3-2021.07"
> > > +VER="11.2-2022.02"
> > >
> > >  DOWNLOAD_DIR=$1
> > >  TOOLCHAIN_DIR=$2
> > > @@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
> > >         #AArch64 Linux hosted cross compilers
> > >
> > >         #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > > -       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > +       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > +
> > > +       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > +       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > >  elif [ $HOST_ARCH = "x86_64" ]; then
> > >         #x86_64 Linux hosted cross compilers
> > >
> > >         #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > > -       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > +       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > >
> > >         #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > -       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > +       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > >
> > >         #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > > -       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > +       wget -P $DOWNLOAD_DIR -nc
> > > https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > >  else
> > >         echo "ERROR - Unknown build arch of $HOST_ARCH"
> > >         exit 1
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > similarity index 61%
> > > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > index 02b5b43bdd7e..a9e6b581a50e 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > @@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
> > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > >
> > >  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > -LIC_FILES_CHKSUM:aarch64 =
> > > "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> > > -LIC_FILES_CHKSUM:x86-64 =
> > > "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> > > +LIC_FILES_CHKSUM:aarch64 =
> > > "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > +LIC_FILES_CHKSUM:x86-64 =
> > > "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > >
> > > -PROVIDES = "virtual/aarch64-none-elf-gcc"
> > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > >
> > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > -SRC_URI[gnu-a-aarch64.sha256sum] =
> > > "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
> > > -SRC_URI[gnu-a-x86_64.sha256sum] =
> > > "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
> > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > +SRC_URI[gnu-a-aarch64.sha256sum] =
> > > "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
> > > +SRC_URI[gnu-a-x86_64.sha256sum] =
> > > "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
> > >
> > >  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > >
> > > -UPSTREAM_CHECK_URI =
> > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
> > > +UPSTREAM_CHECK_URI =
> > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > >  UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > similarity index 35%
> > > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > index ad7e81617d74..930bb5261be8 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > @@ -8,13 +8,17 @@ COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > >  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > >
> > > -LIC_FILES_CHKSUM =
> > > "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> > > +LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > +LIC_FILES_CHKSUM:aarch64 =
> > > "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > +LIC_FILES_CHKSUM:x86-64 =
> > > "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > >
> > > -PROVIDES = "virtual/arm-none-eabi-gcc"
> > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > >
> > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
> > > -SRC_URI[gnu-rm-aarch64.sha256sum] =
> > > "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
> > > -SRC_URI[gnu-rm-x86_64.sha256sum] =
> > > "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
> > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
> > > +SRC_URI[gnu-rm-aarch64.sha256sum] =
> > > "dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
> > > +SRC_URI[gnu-rm-x86_64.sha256sum] =
> > > "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
> > >
> > > -UPSTREAM_CHECK_URI =
> > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
> > > -UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
> > > +S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > +
> > > +UPSTREAM_CHECK_URI =
> > > "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > +UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > On Tue, Mar 22, 2022 at 1:30 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > On Tue, Mar 22, 2022 at 09:43:27AM -0400, Jon Mason wrote:
> > > > > There is a new and unified version of the toolchains (no longer the RM
> > > > > and A toolchain split).  Update the paths and SHAs to reflect the new
> > > > > location.
> > > > >
> > > > > NOTE: with this change, the binary toolchains do not appear to work
> > > > >
> > > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > > > ---
> > > > >  ci/get-binary-toolchains                      | 13 ++++++----
> > > > >  ...b => gcc-aarch64-none-elf_11.2-2022.02.bb} | 14 +++++------
> > > > >  .../gcc-arm-none-eabi_10.3-2021.10.bb         | 20 ----------------
> > > > >  .../gcc-arm-none-eabi_11.2-2022.02.bb         | 24 +++++++++++++++++++
> > > > >  4 files changed, 39 insertions(+), 32 deletions(-)
> > > > >  rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_10.3-2021.07.bb => gcc-aarch64-none-elf_11.2-2022.02.bb} (61%)
> > > > >  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > >
> > > > Any chance to lower the similarity threshold to make it a diff for review,
> > > > instead of remove/add?
> > > >
> > > >
> > > > > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > > > > index 838342a1c572..394ce4131b9f 100755
> > > > > --- a/ci/get-binary-toolchains
> > > > > +++ b/ci/get-binary-toolchains
> > > > > @@ -2,7 +2,7 @@
> > > > >  set -u
> > > > >
> > > > >  HOST_ARCH=$(uname -m)
> > > > > -VER="10.3-2021.07"
> > > > > +VER="11.2-2022.02"
> > > > >
> > > > >  DOWNLOAD_DIR=$1
> > > > >  TOOLCHAIN_DIR=$2
> > > > > @@ -15,18 +15,21 @@ if [ $HOST_ARCH = "aarch64" ]; then
> > > > >       #AArch64 Linux hosted cross compilers
> > > > >
> > > > >       #AArch32 target with hard float (arm-none-linux-gnueabihf)
> > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > +
> > > > > +     #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > >  elif [ $HOST_ARCH = "x86_64" ]; then
> > > > >       #x86_64 Linux hosted cross compilers
> > > > >
> > > > >       #AArch32 target with hard float (arm-linux-none-gnueabihf)
> > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-arm-none-linux-gnueabihf.tar.xz
> > > > >
> > > > >       #AArch64 GNU/Linux target (aarch64-none-linux-gnu)
> > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64-none-linux-gnu.tar.xz
> > > > >
> > > > >       #AArch64 GNU/Linux target (aarch64_be-none-linux-gnu)
> > > > > -     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu-a/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > > > +     wget -P $DOWNLOAD_DIR -nc https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/gcc-arm-$VER-$HOST_ARCH-aarch64_be-none-linux-gnu.tar.xz
> > > > >  else
> > > > >       echo "ERROR - Unknown build arch of $HOST_ARCH"
> > > > >       exit 1
> > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > similarity index 61%
> > > > > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > index 02b5b43bdd7e..a9e6b581a50e 100644
> > > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> > > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_11.2-2022.02.bb
> > > > > @@ -9,16 +9,16 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > > >
> > > > >  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > > > -LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> > > > > -LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
> > > > > +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > > > +LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > > > >
> > > > > -PROVIDES = "virtual/aarch64-none-elf-gcc"
> > > > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > > > >
> > > > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > > > -SRC_URI[gnu-a-aarch64.sha256sum] = "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
> > > > > -SRC_URI[gnu-a-x86_64.sha256sum] = "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
> > > > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> > > > > +SRC_URI[gnu-a-aarch64.sha256sum] = "3b15725545a0211a17b63e72d4f10241f7ffbe7ce94cb9612590ceacde16992c"
> > > > > +SRC_URI[gnu-a-x86_64.sha256sum] = "b0a015a9e8cbb44ed2fe5ad755a7a7ae254d54f93df3bf47378485b0ba8b828b"
> > > > >
> > > > >  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > > >
> > > > > -UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
> > > > > +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > > >  UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > deleted file mode 100644
> > > > > index ad7e81617d74..000000000000
> > > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> > > > > +++ /dev/null
> > > > > @@ -1,20 +0,0 @@
> > > > > -# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> > > > > -# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > -
> > > > > -require arm-binary-toolchain.inc
> > > > > -
> > > > > -COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > > > > -
> > > > > -SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > > > > -LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > > > -
> > > > > -LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> > > > > -
> > > > > -PROVIDES = "virtual/arm-none-eabi-gcc"
> > > > > -
> > > > > -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${PV}/${BP}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
> > > > > -SRC_URI[gnu-rm-aarch64.sha256sum] = "f605b5f23ca898e9b8b665be208510a54a6e9fdd0fa5bfc9592002f6e7431208"
> > > > > -SRC_URI[gnu-rm-x86_64.sha256sum] = "97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3"
> > > > > -
> > > > > -UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
> > > > > -UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
> > > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > new file mode 100644
> > > > > index 000000000000..4e9fe35789f9
> > > > > --- /dev/null
> > > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_11.2-2022.02.bb
> > > > > @@ -0,0 +1,24 @@
> > > > > +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> > > > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > +
> > > > > +require arm-binary-toolchain.inc
> > > > > +
> > > > > +COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
> > > > > +
> > > > > +SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> > > > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > > > +
> > > > > +LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> > > > > +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=be4f8b5ff7319cd54f6c52db5d6f36b0"
> > > > > +LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=1f07179249795891179bb3798bac7887"
> > > > > +
> > > > > +PROVIDES = "virtual/${BINNAME}-gcc"
> > > > > +
> > > > > +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-rm-${HOST_ARCH}"
> > > > > +SRC_URI[gnu-rm-aarch64.sha256sum] = "dd861d188f4061a7ef3857c948376f84ef1dfb88a32aded7c336ed7e47e60970"
> > > > > +SRC_URI[gnu-rm-x86_64.sha256sum] = "8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326"
> > > > > +
> > > > > +S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
> > > > > +
> > > > > +UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads"
> > > > > +UPSTREAM_CHECK_REGEX = "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
> > > > > --
> > > > > 2.30.2

