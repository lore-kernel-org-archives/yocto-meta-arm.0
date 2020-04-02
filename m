Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.888.1585845033211556165
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 09:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B2CF40BFE;
	Thu,  2 Apr 2020 16:30:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6MU_TG8qlNf; Thu,  2 Apr 2020 16:30:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B773840BFC;
	Thu,  2 Apr 2020 16:30:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 835A11718FE; Thu,  2 Apr 2020 12:30:30 -0400 (EDT)
Date: Thu, 2 Apr 2020 12:30:30 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH 3/5] optee-client: upgrade 3.7.0 -> 3,8,0, cleanup
Message-ID: <20200402163030.GU1578@denix.org>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-3-git-send-email-denis@denix.org>
 <CADrjBPoCAFgEJcZPrDJ2ND2E+2-s+m7oCzT37Rbe08QFekD=GA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrjBPoCAFgEJcZPrDJ2ND2E+2-s+m7oCzT37Rbe08QFekD=GA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2020 at 11:01:17AM +0100, Peter Griffin wrote:
> Hi Denys,
> 
> On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > * Rename with _git suffix to match other optee recipes
> > * Add DESCRIPTION
> > * Use common HOMEPAGE
> > * Use install command for header files instead of cp -a
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> 
> Minor nit patch subject 3,8,0, should be 3.8.0. Apart from that

Ah, indeed, thanks for noticing!
Do you want v2 with this fixed?


> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> 
> 
> > ---
> >  .../optee/{optee-client.bb => optee-client_git.bb}   | 20
> > ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> >  rename meta-arm/recipes-security/optee/{optee-client.bb =>
> > optee-client_git.bb} (63%)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-client.bb
> > b/meta-arm/recipes-security/optee/optee-client_git.bb
> > similarity index 63%
> > rename from meta-arm/recipes-security/optee/optee-client.bb
> > rename to meta-arm/recipes-security/optee/optee-client_git.bb
> > index 519683a..a25d343 100644
> > --- a/meta-arm/recipes-security/optee/optee-client.bb
> > +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> > @@ -1,18 +1,21 @@
> > -SUMMARY = "OPTEE Client"
> > -HOMEPAGE = "https://github.com/OP-TEE/optee_client"
> > +SUMMARY = "OP-TEE Client API"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World
> > Client side of the TEE"
> > +HOMEPAGE = "https://www.op-tee.org/"
> >
> >  LICENSE = "BSD"
> >  LIC_FILES_CHKSUM =
> > "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
> >
> > -PV = "3.7.0+git${SRCPV}"
> > +PV = "3.8.0+git${SRCPV}"
> >
> >  inherit python3native systemd
> >
> > -SRC_URI = "git://github.com/OP-TEE/optee_client.git \
> > -           file://tee-supplicant.service"
> > -S = "${WORKDIR}/git"
> > +SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> > +SRC_URI = " \
> > +    git://github.com/OP-TEE/optee_client.git \
> > +    file://tee-supplicant.service \
> > +"
> >
> > -SRCREV = "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
> > +S = "${WORKDIR}/git"
> >
> >  SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> >
> > @@ -25,7 +28,8 @@ do_install() {
> >      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
> >      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
> >
> > -    cp -a ${S}/out/export/usr/include ${D}/usr/
> > +    install -d ${D}${includedir}
> > +    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
> >
> >      sed -i -e s:/etc:${sysconfdir}:g \
> >             -e s:/usr/bin:${bindir}:g \
> > --
> > 2.7.4
> >
> > 
> >

> 

