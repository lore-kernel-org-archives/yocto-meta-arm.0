Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11818.1625602328200063841
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A95E840C56;
	Tue,  6 Jul 2021 20:12:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UH4KifqiFtTe; Tue,  6 Jul 2021 20:12:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 943ED40B13;
	Tue,  6 Jul 2021 20:12:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6164F17461F; Tue,  6 Jul 2021 16:12:06 -0400 (EDT)
Date: Tue, 6 Jul 2021 16:12:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/2] CI: add packaging test for the binary Arm compilers
Message-ID: <20210706201206.GS1528@denix.org>
References: <20210706154256.3643237-1-ross.burton@arm.com>
 <20210706154256.3643237-2-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210706154256.3643237-2-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 06, 2021 at 04:42:56PM +0100, Ross Burton wrote:
> Add a trivial job that verifies the binary Arm compiler packages all
> fetch and package correctly for both x86-64 and arm64.

Thanks a lot for adding this tests!


> Change-Id: I1e29cc175d66d418630505dcac1a87cdf5c0024a
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  .gitlab-ci.yml    |  3 +++
>  ci/toolchains.yml | 20 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 ci/toolchains.yml
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 50eb88b..e0f1e74 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -101,6 +101,9 @@ check-layers:
>    - kas shell --update --force-checkout ci/base.yml:ci/meta-arm-autonomy.yml:ci/meta-python.yml --command \
>      "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
>  
> +toolchains:
> +  extends: .build
> +
>  corstone500:
>    extends: .build
>  
> diff --git a/ci/toolchains.yml b/ci/toolchains.yml
> new file mode 100644
> index 0000000..6a8ebb1
> --- /dev/null
> +++ b/ci/toolchains.yml
> @@ -0,0 +1,20 @@
> +header:
> +  version: 9
> +  includes:
> +    - base.yml
> +
> +# Target is arm64 and SDK is x86-64 to ensure that we exercise both
> +# architectures
> +
> +machine: qemuarm64
> +local_conf_header:
> +  toolchains: |
> +    SDKMACHINE = "x86_64"
> +
> +# No target armcompiler as currently there is no arm64 build
> +target:
> +  - nativesdk-armcompiler
> +  - gcc-aarch64-none-elf
> +  - nativesdk-gcc-aarch64-none-elf
> +  - gcc-arm-none-eabi
> +  - nativesdk-gcc-arm-none-eabi
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
