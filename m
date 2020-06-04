Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.20973.1591295796478349212
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 11:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C633F40BCC;
	Thu,  4 Jun 2020 18:36:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLjpLu-xEjFq; Thu,  4 Jun 2020 18:36:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36D2E40B53;
	Thu,  4 Jun 2020 18:36:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9333317320C; Thu,  4 Jun 2020 14:36:30 -0400 (EDT)
Date: Thu, 4 Jun 2020 14:36:30 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH 1/4] external-arm-toolchain: Remove glibc locale dependency
Message-ID: <20200604183630.GD17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591095894-15178-2-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 04:34:51PM +0530, Sumit Garg wrote:
> External Arm tool-set

Why do you call it tool-set? It's definitely not critical, but toolchain is 
kind of a standard name for this:
https://en.wikipedia.org/wiki/Toolchain


> doesn't seem to provide packages corresponding to OE glibc locale recipe.

Actually, the toolchain itself does provide all the gconv libs, AFAICS, 
it's just they are not packaged by the recipe. When I hit it back in April, 
I just didn't have time and ended up with LIBC_DEPENDENCIES_remove hack as 
a temporary workaround, planning to enevtually go back and fix it properly:
http://arago-project.org/git/?p=meta-arago.git;a=blobdiff;f=meta-arago-distro/conf/distro/arago.conf;hb=84c30ee97056589ba0811428527f4adf8268c9b2;hpb=3a4ed9d1e8a118aefb2ef49ce450f74f14e239d0

So, re-using this LIBC_DEPENDENCIES_remove here in upstream meta-arm isn't 
correct...


> So explicitly remove corresponding libc dependencies.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 9171380..eee1a51 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -58,6 +58,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-c
>  ENABLE_BINARY_LOCALE_GENERATION = "0"
>  GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
>  LIBCOVERRIDE = ":libc-glibc"
> +LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"

You shouldn't be using _remove in meta-arm, as it's not the final layer and 
there won't be any way to override this in BSPs or Distros.


>  ERROR_QA[type] ?= "list"
>  python toolchain_metadata_setup () {
> -- 
> 2.7.4
> 
