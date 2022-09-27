Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF85C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 23:35:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1904.1664321754010971423
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 16:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0823240CC2;
	Tue, 27 Sep 2022 23:35:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g53GTlJYBAgc; Tue, 27 Sep 2022 23:35:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C200F40301;
	Tue, 27 Sep 2022 23:35:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A8C8174A11; Tue, 27 Sep 2022 19:35:46 -0400 (EDT)
Date: Tue, 27 Sep 2022 19:35:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH 2/2] external-arm-toolchain: Enable 11.3.rel1 support
Message-ID: <20220927233546.GX18429@denix.org>
References: <20220926071605.123085-1-sumit.garg@linaro.org>
 <20220926071605.123085-2-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926071605.123085-2-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Sep 2022 23:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3849

On Mon, Sep 26, 2022 at 12:46:05PM +0530, Sumit Garg wrote:
> Enable support for 11.3.rel1 binary toolchain release. Also, update CI
> to use it.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Well, the good news is this patch series does build and I was about to send 
out my Tested-by:

But, I think, there's quite a mess in the naming/versioning area. See below...


> ---
>  ci/get-binary-toolchains                       | 18 +++++++++---------
>  .../external-arm-toolchain-versions.inc        |  7 +++++--
>  2 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> index bfdd8c57..ed334bf3 100755
> --- a/ci/get-binary-toolchains
> +++ b/ci/get-binary-toolchains
> @@ -2,7 +2,7 @@
>  set -u
>  
>  HOST_ARCH=$(uname -m)
> -VER="11.2-2022.02"
> +VER="11.3.rel1"

Here, it says 11.3.rel1 (note lower case)


>  DOWNLOAD_DIR=$1
>  TOOLCHAIN_DIR=$2

<skip>

> -# Extract the YYYY.MM version
> +# Extract the YYYY.MM or release version
>  def eat_get_main_version(d):
>      version = eat_get_version(d)
>      bb.debug(2, 'Trying for parse version info from: %s' % version)
>      if version != 'UNKNOWN':
> -        if version.split()[4] == '(GNU':
> +        if version.split()[4] == '(Arm':
> +            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
> +            return version.split()[7].split(')')[0]

Here, it ends up picking up the uppercase version and external-arm-toolchain 
package ends up getting "11.3.Rel1" version, which doesn't sort well with the 
package feed already containing previous versions like 2018.11, 2019.12 and 
2022.02

Moreover, gcc now builds a package versioned as "arm-11.3-r2022.08", so it's 
all over the place. Not sure where ARM_GCC_SUB_VERSION comes into play, 
certainly not in the package version.

Should we try to standardize/unify these versioning mess here? I'd be happy to  
stick to 2022.08 notation, if possible...


> +        elif version.split()[4] == '(GNU':
>              # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10))
>              # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26))
>              return version.split()[10].split('-')[1]
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

