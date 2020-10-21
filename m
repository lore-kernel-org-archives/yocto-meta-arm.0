Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.15537.1603301027187799689
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 10:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4B2A940BD6;
	Wed, 21 Oct 2020 17:23:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2tHPeJxVrew; Wed, 21 Oct 2020 17:23:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6AC9540B2D;
	Wed, 21 Oct 2020 17:23:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BE6C41744A8; Wed, 21 Oct 2020 13:23:40 -0400 (EDT)
Date: Wed, 21 Oct 2020 13:23:40 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Message-ID: <20201021172340.GF19155@denix.org>
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 06:10:33PM +0100, Abdellatif El Khlifi wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> This commit provides a recipe that generates a Linux userspace
> application used for testing the communication between Corstone700 cores.
> 
> Change-Id: I7c00653b0fcd6d9074510bbb70a838762aed0150
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  .../corstone700-test-app_1.0.bb               | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> 
> diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> new file mode 100644
> index 0000000..d2bfb19
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "CORSTONE700 systems communications tests"
> +DESCRIPTION = "This is a Linux userspace tool to test the communication between Corstone700 cores"
> +HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/test-apps.git"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
> +
> +SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https"
> +SRCREV = "ecd93a275d11cf08f670a97783110bd698250963"
> +PV .= "~git${SRCPV}"

OpenEmbedded convention is to use "+git..."


> +
> +COMPATIBLE_MACHINE = "(corstone700)"
> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/test-app
> +}
> +
> +do_install() {
> +    install -D -p -m 0755 ${S}/test-app ${D}${bindir}/test-app
> +}
> -- 
> 2.17.1
> 

> 
> 
> 

