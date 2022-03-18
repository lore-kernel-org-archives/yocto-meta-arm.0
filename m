Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5FCC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 21:04:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.294.1647637491121288238
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 14:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F4D940C53;
	Fri, 18 Mar 2022 21:04:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQsNF_GWFLhe; Fri, 18 Mar 2022 21:04:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DD9E040C1E;
	Fri, 18 Mar 2022 21:04:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A3A51747D4; Fri, 18 Mar 2022 17:04:43 -0400 (EDT)
Date: Fri, 18 Mar 2022 17:04:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com, ross.burton@arm.com, daniel.thompson@linaro.org,
	ralph.siemsen@linaro.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-toolchain: Uprev 10.3 -> 11.2
Message-ID: <20220318210443.GG23554@denix.org>
References: <20220317111232.488767-1-sumit.garg@linaro.org>
 <YjTlc7c0Ecaj0Upu@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjTlc7c0Ecaj0Upu@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 21:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3190

On Fri, Mar 18, 2022 at 04:02:59PM -0400, Jon Mason wrote:
> On Thu, Mar 17, 2022 at 04:42:31PM +0530, Sumit Garg wrote:
> > Update Arm GCC toolchain recipe and patches accordingly.
> 
> I'm seeing errors when I tried to compile this for fvp-base-arm32 using
> the binary toolchain (the source based one works fine).  I see

Hmm, I was beginning to wonder if external-arm-toolchain also needed any 
updates for 11.2...

But the log doesn't seem to be very useful for whatever reason.


> ERROR: external-arm-toolchain-2022.02-r0 do_install: ExecutionError('/builder/meta-arm/build/tmp/work/armv7at2hf-vfp-poky-linux-gnueabi/external-arm-toolchain/2022.02-r0/temp/run.do_install.3421002', 2, None, None)
> ERROR: Logfile of failure stored in: /builder/meta-arm/build/tmp/work/armv7at2hf-vfp-poky-linux-gnueabi/external-arm-toolchain/2022.02-r0/temp/log.do_install.3421002
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/builder/meta-arm/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/builder/meta-arm/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/builder/meta-arm/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['patch-native', 'pseudo-native', 'quilt-native', 'attr-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | WARNING: exit code 2 from a shell command.
> ERROR: Task (/builder/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2066 tasks of which 1551 didn't need to be rerun and 1 failed.
> 
> and the complete log is the same
> 
> DEBUG: Executing python function extend_recipe_sysroot
> NOTE: Direct dependencies are ['virtual:native:/builder/meta-arm/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/builder/meta-arm/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/builder/meta-arm/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot']
> NOTE: Installed into sysroot: []
> NOTE: Skipping as already exists in sysroot: ['patch-native', 'pseudo-native', 'quilt-native', 'attr-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native']
> DEBUG: Python function extend_recipe_sysroot finished
> DEBUG: Executing shell function do_install
> WARNING: exit code 2 from a shell command.
> 
> You can see the full CI at
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/495926216
> 
> It is working fine on the old version.  So, I wonder if something
> broke with the merging of the toolchains.  FWIW, I tried this series
> some time ago on my own and was seeing similar results.  See
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/473381131
> 
> Also, this email isn't on lore (for some reason), but the second one
> is.  See https://lore.kernel.org/yocto-meta-arm/
> My delay in responding is (partly) because of this.
> 
> Thanks,
> Jon

