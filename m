Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3149.1589414678920793633
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 17:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5F3D440B89;
	Thu, 14 May 2020 00:04:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmQVb1bdhojt; Thu, 14 May 2020 00:04:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31ECD409AA;
	Thu, 14 May 2020 00:04:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D5B0E17314B; Wed, 13 May 2020 20:04:36 -0400 (EDT)
Date: Wed, 13 May 2020 20:04:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: support multi-board platforms
Message-ID: <20200514000436.GW11927@denix.org>
References: <1589412620-56223-1-git-send-email-denis@denix.org>
 <CAJdd5Gbd6Sia48u64zYNB=f0cDNcFy=-oQ-2Y60YbjS4MXy3yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5Gbd6Sia48u64zYNB=f0cDNcFy=-oQ-2Y60YbjS4MXy3yA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 06:44:32PM -0500, Joshua Watt wrote:
> On Wed, May 13, 2020, 6:30 PM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Some platforms can have multiple board configurations, passed as
> > TARGET_BOARD=""
> > that also becomes an extra directory level in the build output hierarchy.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 12
> > ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 4b5da7a..b88b514 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?= "invalid"
> >  # Platform must be set for each machine
> >  TFA_PLATFORM ?= "invalid"
> >
> > +# Some platforms can have multiple board configurations
> > +# Leave empty for default behavior
> > +TFA_BOARD ?= ""
> > +
> >  # Build for debug (set TFA_DEBUG to 1 to activate)
> >  TFA_DEBUG ?= "0"
> >
> > @@ -65,6 +69,10 @@ DEPENDS_append = " dtc-native openssl-native"
> >  # Add platform parameter
> >  EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
> >
> > +# Handle TFA_BOARD parameter
> > +EXTRA_OEMAKE += "${@['',
> > 'TARGET_BOARD=${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
> > +BUILD_DIR = "${@['${TFA_PLATFORM}',
> > '${TFA_PLATFORM}/${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
> >
> 
> I noticed you're doing the Boolean index trick. A little more pythonic and
> IMHO easier to read would be:
> 
>  "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"

Hmm, I saw OE-Core using the Boolean index trick in bitbake.conf and other 
places quite a lot - I was just following the tradition.

For me personally pure pythonic is too much of a brain twist - booleans, 
simple arrays and such are more natural for me to understand... :)

But if required, I can change - just let me know.


> >  # Handle TFA_DEBUG parameter
> >  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', '
> > DEBUG=${TFA_DEBUG}', '', d)}"
> >
> > @@ -93,9 +101,9 @@ do_compile[cleandirs] = "${B}"
> >
> >  do_install() {
> >      if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> > -        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> > +        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
> >      else
> > -        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> > +        BUILD_PLAT=${B}/${BUILD_DIR}/release/
> >      fi
> >
> >      install -d -m 755 ${D}/firmware
> > --
> > 2.7.4
> >
> > 
> >
