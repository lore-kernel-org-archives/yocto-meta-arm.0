Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.21307.1591296426791383512
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 11:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 370BD40C2E;
	Thu,  4 Jun 2020 18:47:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_pjz0MCPWjW; Thu,  4 Jun 2020 18:47:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C538440B53;
	Thu,  4 Jun 2020 18:47:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5ADCE17320C; Thu,  4 Jun 2020 14:47:00 -0400 (EDT)
Date: Thu, 4 Jun 2020 14:47:00 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH 3/4] external-arm-toolchain: Add README
Message-ID: <20200604184700.GF17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-4-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591095894-15178-4-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 04:34:53PM +0530, Sumit Garg wrote:
> Document usage details for pre-built Arm toolchains.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  .../external-arm-toolchain/README.md               | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> new file mode 100644
> index 0000000..65d1a42
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/README.md
> @@ -0,0 +1,50 @@
> +Pre-built Arm toolchain recipes
> +===============================
> +
> +Introduction
> +------------
> +This layer contains recipes for pre-built Arm toolchain recipes as follows:
> +
> +external-arm-toolchain.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This recipe provides support for pre-built GNU toolchains targeting processors
> +from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> +
> +Usage
> +^^^^^
> +
> +In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> +on), a user needs to download and untar tool-set on host machine at a particular
> +installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> +in ``conf/local.conf`` in order to replace OE toolcahin with pre-built GNU-A
> +toolchain:
> +
> +TCMODE = "external-arm"
> +EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> +
> +-  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> +   EXTERNAL_TOOLCHAIN = "\
> +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> +   "
> +
> +-  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> +   EXTERNAL_TOOLCHAIN = "\
> +     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> +   "
> +
> +Supported distros and machines
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> +meant to be distro and machine agnostic as long as one is cross-compiling for
> +Arm A-profile architecture.
> +
> +gcc-arm-none-eabi_<version>.bb
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

gcc-aarch64-none-elf?

Probably need to explain a bit more regarding the differences between 
baremetal and Linux toolchains, as currently it can be confusing to some 
why there are 2 sets of toolchain recipes...


> +This recipe provides support for pre-built GNU Arm Embedded toolchain for
> +bare-metal software development on devices based on 32-bit Arm Cortex-A,
> +Cortex-R and Cortex-M processors.
> +
> +Supported version: 9-2019-q4-major
> -- 
> 2.7.4
> 
