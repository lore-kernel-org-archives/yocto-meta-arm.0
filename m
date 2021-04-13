Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3453.1618347411316079169
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 13:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA7BB40C53;
	Tue, 13 Apr 2021 20:56:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kump8_C5fKtP; Tue, 13 Apr 2021 20:56:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 830AE409E0;
	Tue, 13 Apr 2021 20:56:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 463AA1745B4; Tue, 13 Apr 2021 16:56:48 -0400 (EDT)
Date: Tue, 13 Apr 2021 16:56:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm/optee-os: deploy tee.elf for u-boot
Message-ID: <20210413205648.GP15937@denix.org>
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-4-yann@blade-group.com>
MIME-Version: 1.0
In-Reply-To: <20210413094038.3577754-4-yann@blade-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 13, 2021 at 11:40:37AM +0200, Yann Dirson wrote:
> From: Yann Dirson <yann@blade-group.com>
> 
> Integration of OP-TEE in the u-boot image is done with `TEE=tee.elf`.
> This can now be done in a BSP layer with something like this in
> `u-boot_%.bbappend`:

Well, this is not very standardized and is platform-specific.

For example, TI K3 platforms take tee-pager_v2.bin file into U-boot, not 
tee.elf one. But tee.elf still gets deployed for debugging purposes...

E.g. in meta-ti u-boot_%.bbappend:

PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/tee-pager_v2.bin,,optee-os"
PACKAGECONFIG_append_k3 = " optee"


>  OPTEE_DEPENDS ??= ""
>  OPTEE_DEPENDS_rk3399 = " optee-os:do_deploy"
> 
>  do_compile[depends] .= "${OPTEE_DEPENDS}"
> 
>  do_compile_prepend_rk3399() {
>      export TEE=${DEPLOY_DIR_IMAGE}/optee/tee.elf
>  }

To mee, the above PACKAGECONFIG approach is a bit cleaner...

In summary, I support availability of tee.elf, but besides do_deploy(), I 
would also suggest adding it to do_install()


> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index 34f586a..db8428a 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -58,7 +58,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  do_deploy() {
>      install -d ${DEPLOYDIR}/optee
> -    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
> +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${B}/core/tee.elf ${DEPLOYDIR}/optee/
>  }
>  
>  addtask deploy before do_build after do_install
> -- 
> 2.30.2
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
