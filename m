Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99F4D13C2B
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 14:56:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21876.1769439391888364784
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 06:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D61EA40CB7;
	Mon, 26 Jan 2026 14:56:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKUmdfY6Tp1b; Mon, 26 Jan 2026 14:56:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA8BF40BA8;
	Mon, 26 Jan 2026 14:56:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D26C0177DFB; Mon, 26 Jan 2026 09:56:27 -0500 (EST)
Date: Mon, 26 Jan 2026 09:56:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: quentin.schulz@cherry.de
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm/arm-bsp: optee: add version 4.9.0
Message-ID: <20260126145627.GE11121@denix.org>
References: <20260121140356.16818-1-hugues.kambampiana@arm.com>
 <20260121140356.16818-2-hugues.kambampiana@arm.com>
 <5577d221-3d0b-4e1f-8106-0c657c07f195@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5577d221-3d0b-4e1f-8106-0c657c07f195@cherry.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jan 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6872

On Mon, Jan 26, 2026 at 02:48:29PM +0100, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Hugues,
> 
> On 1/21/26 3:03 PM, Hugues KAMBA MPIANA wrote:
> [...]
> >diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> >new file mode 100644
> >index 00000000..8e64a636
> >--- /dev/null
> >+++ b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> >@@ -0,0 +1,8 @@
> >+require recipes-security/optee/optee-os.inc
> >+
> >+DEPENDS += "dtc-native"
> >+
> >+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> >+
> 
> We don't need that line anymore as there are no in-tree patches for
> optee-os anymore.

This is not a bbappend, but a standalone recipe, so the line is not needed 
even with local patches.


> >+# 4.9.0
> >+SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
> >diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> >new file mode 100644
> >index 00000000..ddb574fc
> >--- /dev/null
> >+++ b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> >@@ -0,0 +1,14 @@
> >+require recipes-security/optee/optee-test.inc
> >+
> >+# v4.9.0
> >+SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
> >+
> >+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
> >+
> 
> This isn't the actual license but a file pointing to other files. I
> would suggest to add LICENSE-BSD and LICENSE-GPL as well so that we
> can catch modifications to those files.
> 
> I've checked all commit hashes, they match the tags.
> 
> I've run `xtest` on Rockchip PX30, RK3399 and RK3588 and they all pass, so:
> 
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # xtest on
> PX30, RK3399, RK3588
> 
> We should probably think about also passing ;tag=${PV} to the

Will this require network connectivity every time the recipe is parsed to 
resolve the tag, even when you have a corresponding snapshot available 
locally?


> SRC_URI via a variable such that we can not pass it when building
> the _git.bb variant of the recipes.

-- 
Denys

