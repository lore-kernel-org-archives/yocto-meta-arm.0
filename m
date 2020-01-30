Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4163.1580363270701935403
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 21:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F1C2C40C06;
	Thu, 30 Jan 2020 05:47:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiPulIDwyw3n; Thu, 30 Jan 2020 05:47:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8CE8040A52;
	Thu, 30 Jan 2020 05:47:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4BD7C1743C9; Thu, 30 Jan 2020 00:47:42 -0500 (EST)
Date: Thu, 30 Jan 2020 00:47:42 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, raj.khem@gmail.com,
	nicolas.dechesne@linaro.org, joakim.bech@linaro.org,
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org,
	alexandre.jutras@linaro.org
Subject: Re: [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
Message-ID: <20200130054742.GQ4735@denix.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks! And for the entire series:

Tested-by: Denys Dmytriyenko <denys@ti.com>

The only nitpick is that 0001-use-python3-instead-of-python.patch gets 
created in patch #4, but is added to the recipe in patch #5 - should have 
been all in one patch.

-- 
Denys


On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wrote:
> Hi Jon,
> 
> This patch series adds the OP-TEE recipes from meta-linaro
> layer to the meta-arm layer which is the new home for generic
> Arm architecture components.
> 
> Once these are merged, I will remove them and add a README
> in meta-linaro.
> 
> Thanks,
> 
> Peter.
> 
> Peter Griffin (5):
>   optee-client.bb: add optee client recipe and patches
>   optee-os_git.bb: add optee-os recipe and patches
>   optee-examples.bb: add recipe for optee examples
>   optee-test_git.bb: add optee-test recipe & patches
>   optee-test_git.bb: add python3 backport patch
> 
>  meta-arm/recipes-security/optee/optee-client.bb    | 35 +++++++++++
>  .../optee/optee-client/tee-supplicant.service      | 10 ++++
>  meta-arm/recipes-security/optee/optee-examples.bb  | 42 +++++++++++++
>  ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
>  meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
>  .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++
>  meta-arm/recipes-security/optee/optee-test_git.bb  | 50 ++++++++++++++++
>  7 files changed, 267 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
>  create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
>  create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
>  create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb
> 
> -- 
> 2.7.4
> 
