Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2C8CF3959
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 15:24:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22796.1726759476432589505
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Sep 2024 08:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BED640CBE;
	Thu, 19 Sep 2024 15:24:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hkf9OfMSOnHD; Thu, 19 Sep 2024 15:24:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4ECCA40C1C;
	Thu, 19 Sep 2024 15:24:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8EA301640AA; Thu, 19 Sep 2024 11:24:33 -0400 (EDT)
Date: Thu, 19 Sep 2024 11:24:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: remove
 libmount-mountfd-support when using binary toolchain
Message-ID: <20240919152433.GO17572@denix.org>
References: <20240919151026.76035-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919151026.76035-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 15:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6087

On Thu, Sep 19, 2024 at 11:10:26AM -0400, Jon Mason wrote:
> util-linux is failing when compiling with:
> | configure: error: libmount_mountfd_support selected, but required mount FDs based API not available
> Remove this feature when building with the binary toolchain to avoid
> this issue.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
> 
> diff --git a/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend b/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
> new file mode 100644
> index 000000000000..75227a567516
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
> @@ -0,0 +1 @@
> +PACKAGECONFIG:remove = "${@bb.utils.contains('TCMODE', 'external-arm', 'libmount-mountfd-support', '' , d)}"
> -- 
> 2.39.3 (Apple Git-146)

