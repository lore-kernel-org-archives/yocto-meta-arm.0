Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.681.1592421838981109916
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 12:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4982D40B30;
	Wed, 17 Jun 2020 19:23:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IheiGbzFcIm; Wed, 17 Jun 2020 19:23:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2644940A9E;
	Wed, 17 Jun 2020 19:23:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DCAE217320A; Wed, 17 Jun 2020 15:23:55 -0400 (EDT)
Date: Wed, 17 Jun 2020 15:23:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH 2/4] external-arm-toolchain-versions: set per-components license based on version
Message-ID: <20200617192355.GZ17660@denix.org>
References: <1592208433-28086-1-git-send-email-denis@denix.org>
 <1592208433-28086-2-git-send-email-denis@denix.org>
 <CAFA6WYMxS_tMVZOVgv_gj_e4P1BKdMRjmj9WPO9EkyAJuv1cpw@mail.gmail.com>
 <20200615181447.GV17660@denix.org>
 <CAFA6WYMN9Dz9yPTaL56iY6z__XRdc6etndDRsi1xKY2AbPQtBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMN9Dz9yPTaL56iY6z__XRdc6etndDRsi1xKY2AbPQtBA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 11:21:08AM +0530, Sumit Garg wrote:
> On Mon, 15 Jun 2020 at 23:44, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Jun 15, 2020 at 04:25:13PM +0530, Sumit Garg wrote:
> > > On Mon, 15 Jun 2020 at 13:37, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > This code is upstreamed from meta-arago layer.
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  .../include/external-arm-toolchain-versions.inc    | 28 ++++++++++++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > > index a89f2f0..6121adf 100644
> > > > --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> > > > @@ -126,6 +126,20 @@ def eat_get_bfd_version(d):
> > > >          first_line = stdout.splitlines()[0]
> > > >          return first_line.split()[-1]
> > > >
> > > > +# Licenses set for main components of the toolchain:
> > > > +# (g)libc is always LGPL version 2 (or later)
> > > > +# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
> > > > +#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
> > > > +# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
> > > > +#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
> > > > +#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
> > > > +#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
> > > > +#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
> > > > +# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
> > > > +#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
> > > > +# binutils version 2.17 was the last one under GPL version 2 (or later), according
> > > > +#    to the published releases - http://ftp.gnu.org/gnu/binutils/
> > > > +
> > > >  python external_arm_toolchain_version_handler () {
> > > >      if not isinstance(e, bb.event.ConfigParsed):
> > > >          return
> > > > @@ -139,5 +153,19 @@ python external_arm_toolchain_version_handler () {
> > > >      d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
> > > >      d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> > > >      d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> > > > +
> > > > +    lc_libc = "LGPL-2.1"
> > > > +    lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
> > > > +    lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
> > > > +    lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
> > > > +    lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
> > > > +
> > > > +    d.setVar('EAT_LIBC_LICENSE', lc_libc)
> > > > +    d.setVar('EAT_GCC_LICENSE', lc_gcc)
> > > > +    d.setVar('EAT_RLE_LICENSE', lc_rle)
> > > > +    d.setVar('EAT_GDB_LICENSE', lc_gdb)
> > > > +    d.setVar('EAT_BFD_LICENSE', lc_bfd)
> > > > +
> > > > +    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))
> > >
> > > Do we really need this dynamic computation of license based on
> > > toolchain versions? As pre-built GNU Arm toolchains [1] only support
> > > versions > 8.
> >
> > I needed gcc, gdb and binutils licenses set in central location for the new
> > recipe and I already had this code handy, so I just copied it over.
> >
> > I guess we can drop the conditional part of it and set the vars statically.
> > But setting them here is better than in the recipe, as they can be re-used
> > in multiple recipes.
> >
> 
> Sounds reasonable. Could you rebase it on top of mine patch-set and
> let license.inc [1] reuse these static defines?

Sure, will do.


> [1] https://lists.yoctoproject.org/g/meta-arm/message/647
> 
> -Sumit
> 
> > --
> > Denys
> >
> >
> > > [1] https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
> > >
> > > -Sumit
> > >
> > > >  }
> > > >  addhandler external_arm_toolchain_version_handler
> > > > --
> > > > 2.7.4
> > > >
> > > > 
> > >
> 
