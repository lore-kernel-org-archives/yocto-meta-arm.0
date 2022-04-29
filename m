Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C85C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:08:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.12022.1651248512805852758
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 09:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 627D240C46;
	Fri, 29 Apr 2022 16:08:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O43ki3lHYHrD; Fri, 29 Apr 2022 16:08:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 32A0340A77;
	Fri, 29 Apr 2022 16:08:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E947C174913; Fri, 29 Apr 2022 12:08:26 -0400 (EDT)
Date: Fri, 29 Apr 2022 12:08:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH v2 1/2] external-arm-toolchain-versions: Use ldd to get
 libc version
Message-ID: <20220429160826.GO9834@denix.org>
References: <20220429062142.11206-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429062142.11206-1-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Apr 2022 16:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3333

On Fri, Apr 29, 2022 at 11:51:41AM +0530, Sumit Garg wrote:
> Arm GCC 11.2 binary release has moved away from keeping libc library
> versioning info as libc-{EAT_VER_LIBC}.so. So rather switch to
> retrieving libc version by parsing output from "$ ldd --version".
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
> 
> Changes in v2:
> - Directly invoke interpreter (/bin/sh) rather than sed-in-place ldd
>   executable which can lead to permissions issue.
> 
>  .../external-arm-toolchain-versions.inc       | 41 +++++++------------
>  1 file changed, 15 insertions(+), 26 deletions(-)
> 
> diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> index a89f2f0..244de26 100644
> --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> @@ -50,37 +50,26 @@ def eat_get_gcc_version(d):
>  
>  def eat_get_libc_version(d):
>      import os,bb
> +    import subprocess
> +
>      syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
>      if not syspath:
>          return 'UNKNOWN'
>  
> -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> -
> -    if os.path.exists(libpath):
> -        for file in os.listdir(libpath):
> -            if file.find('libc-') == 0:
> -                return file[5:-3]
> -
> -    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
> -
> -    if os.path.exists(libpath):
> -        for file in os.listdir(libpath):
> -            if file.find('libc-') == 0:
> -                return file[5:-3]
> -
> -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
> -
> -    if os.path.exists(libpath):
> -        for file in os.listdir(libpath):
> -            if file.find('libc-') == 0:
> -                return file[5:-3]
> -
> -    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
> +    topdir = d.getVar('TOPDIR', True)
> +    lddpath = syspath + '/libc/usr/bin/ldd'
> +
> +    if os.path.exists(lddpath):
> +        cmd = '/bin/sh ' + lddpath + ' --version'
> +        try:
> +            stdout, stderr = bb.process.run(cmd, cwd=topdir, stderr=subprocess.PIPE)
> +        except bb.process.CmdError as exc:
> +            bb.error('Failed to obtain external Arm libc version: %s' % exc)
> +            return 'UNKNOWN'
> +        else:
> +            first_line = stdout.splitlines()[0]
> +            return first_line.split()[2]
>  
> -    if os.path.exists(libpath):
> -        for file in os.listdir(libpath):
> -            if file.find('libc-') == 0:
> -                return file[5:-3]
>      return 'UNKNOWN'
>  
>  def eat_get_kernel_version(d):
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

