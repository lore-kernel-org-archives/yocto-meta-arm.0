Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5.1592503284161317620
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 936F240B96;
	Thu, 18 Jun 2020 18:01:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US0bxKIq9vyS; Thu, 18 Jun 2020 18:01:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDC9540A9E;
	Thu, 18 Jun 2020 18:01:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A14A017320C; Thu, 18 Jun 2020 14:01:20 -0400 (EDT)
Date: Thu, 18 Jun 2020 14:01:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v4 5/5] external-arm-toolchain: Add specific licenses for individual packages
Message-ID: <20200618180120.GD17660@denix.org>
References: <1592464867-12851-1-git-send-email-denis@denix.org>
 <CAFA6WYO3s8iVRMDzgGYN0jdNQZw5L+BTNK0kxLvTUXS+wrPt1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYO3s8iVRMDzgGYN0jdNQZw5L+BTNK0kxLvTUXS+wrPt1w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2020 at 02:18:43PM +0530, Sumit Garg wrote:
> On Thu, 18 Jun 2020 at 12:51, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Sumit Garg <sumit.garg@linaro.org>
> >
> > Add license.inc file to state license of various packages provided by
> > pre-built Arm toolchain.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > This uses new EAT_*_LICENSE defines from external-arm-toolchain-versions.inc
> >
> 
> This isn't something I meant via rebase as it introduces fragile
> dependencies among patch-sets. Instead this change should be part of
> the patch where you introduce new EAT_*_LICENSE defines in
> external-arm-toolchain-versions.inc at first place.
> 
> Also, these defines will only be meaningful in
> external-arm-toolchain-versions.inc when there are multiple recipes
> (with external-arm-sdk-toolchain recipe) dependent on them.
> 
> So, IMO, we should go ahead with the v3 version of this patch.

Ok, we can get v3 of this patch merged and then adjust it after the 
external-arm-sdk-toolchain series is merged to re-use EAT_*_LICENSE.

-- 
Denys


> >  .../external-arm-toolchain.bb                      |  4 +-
> >  .../external-arm-toolchain/license.inc             | 73 ++++++++++++++++++++++
> >  2 files changed, 75 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > index 14a585f..7d59d8e 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > @@ -1,9 +1,9 @@
> >  require recipes-core/glibc/glibc-package.inc
> >
> > +require license.inc
> > +
> >  INHIBIT_DEFAULT_DEPS = "1"
> >
> > -# License applies to this recipe code, not the toolchain itself
> > -LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "\
> >         file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
> >         file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > new file mode 100644
> > index 0000000..53641b4
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > @@ -0,0 +1,73 @@
> > +LICENSE = "${EAT_LICENSE}"
> > +
> > +LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-doc = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-dbg = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-pic = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-utils = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-mtrace = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-gconv = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-thread-db = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
> > +LICENSE_${PN}-staticdev = "${EAT_LIBC_LICENSE}"
> > +LICENSE_catchsegv = "${EAT_LIBC_LICENSE}"
> > +LICENSE_glibc-extra-nss = "${EAT_LIBC_LICENSE}"
> > +LICENSE_glibc-thread-db = "${EAT_LIBC_LICENSE}"
> > +
> > +LICENSE_libmemusage = "${EAT_LIBC_LICENSE}"
> > +LICENSE_libsegfault = "${EAT_LIBC_LICENSE}"
> > +LICENSE_libsotruss = "${EAT_LIBC_LICENSE}"
> > +LICENSE_sln = "${EAT_LIBC_LICENSE}"
> > +LICENSE_nscd = "${EAT_LIBC_LICENSE}"
> > +LICENSE_ldd = "${EAT_LIBC_LICENSE}"
> > +
> > +LICENSE_libasan-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libasan = "${EAT_RLE_LICENSE}"
> > +LICENSE_libasan-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libatomic-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libatomic = "${EAT_RLE_LICENSE}"
> > +LICENSE_libatomic-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libg2c-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libg2c = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgcc-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgcc = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgfortran-dbg = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgfortran-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgfortran = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgfortran-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgomp-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgomp = "${EAT_RLE_LICENSE}"
> > +LICENSE_libgomp-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libitm-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libitm = "${EAT_RLE_LICENSE}"
> > +LICENSE_libitm-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_liblsan-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_liblsan = "${EAT_RLE_LICENSE}"
> > +LICENSE_liblsan-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libmudflap-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libmudflap = "${EAT_RLE_LICENSE}"
> > +LICENSE_libmudflap-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libquadmath-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libquadmath = "${EAT_RLE_LICENSE}"
> > +LICENSE_libquadmath-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libssp-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libssp = "${EAT_RLE_LICENSE}"
> > +LICENSE_libssp-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libstdc++-dbg = "${EAT_RLE_LICENSE}"
> > +LICENSE_libstdc++-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libstdc++ = "${EAT_RLE_LICENSE}"
> > +LICENSE_libstdc++-precompile-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libstdc++-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libtsan-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libtsan = "${EAT_RLE_LICENSE}"
> > +LICENSE_libtsan-staticdev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libubsan-dev = "${EAT_RLE_LICENSE}"
> > +LICENSE_libubsan = "${EAT_RLE_LICENSE}"
> > +LICENSE_libubsan-staticdev = "${EAT_RLE_LICENSE}"
> > +
> > +LICENSE_linux-libc-headers-dev = "GPLv2"
> > +LICENSE_linux-libc-headers = "GPLv2"
> > +
> > +LICENSE_gdbserver = "${EAT_GDB_LICENSE}"
> > --
> > 2.7.4
> >
> 
