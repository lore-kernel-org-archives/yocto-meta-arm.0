Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.26200.1601254120961874949
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 17:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A7DB140C06;
	Mon, 28 Sep 2020 00:48:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QY-toABjqljK; Mon, 28 Sep 2020 00:48:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 74C8A40BB6;
	Mon, 28 Sep 2020 00:48:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3D30117447D; Sun, 27 Sep 2020 20:48:32 -0400 (EDT)
Date: Sun, 27 Sep 2020 20:48:32 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/wic: Introduce empty plugin to create unformatted empty partitions
Message-ID: <20200928004832.GQ19155@denix.org>
References: <70f746be8740db141d3125e57b78805ebf35789e.1601032480.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <70f746be8740db141d3125e57b78805ebf35789e.1601032480.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Seems generic - should this be submitted to oe-core?

-- 
Denys


On Fri, Sep 25, 2020 at 12:15:46PM +0100, Diego Sueiro wrote:
> The empty wic plugin is used to create unformatted empty partitions for wic
> images.
> 
> To use it you must pass "empty" as argument for the "--source" parameter in the
> wks file. For example:
> part foo --source empty --ondisk sda --size="1024" --align 1024
> 
> Change-Id: I0155561e9cc2ac11159e181eec9e4d9ae11555c3
> Issue-Id: SCM-889
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  .../scripts/lib/wic/plugins/source/empty.py        | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> 
> diff --git a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> new file mode 100644
> index 0000000..041617d
> --- /dev/null
> +++ b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> @@ -0,0 +1,32 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# The empty wic plugin is used to create unformatted empty partitions for wic
> +# images.
> +# To use it you must pass "empty" as argument for the "--source" parameter in
> +# the wks file. For example:
> +# part foo --source empty --ondisk sda --size="1024" --align 1024
> +
> +import logging
> +
> +from wic.pluginbase import SourcePlugin
> +
> +logger = logging.getLogger('wic')
> +
> +class EmptyPartitionPlugin(SourcePlugin):
> +    """
> +    Populate unformatted empty partition.
> +    """
> +
> +    name = 'empty'
> +
> +    @classmethod
> +    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> +                             oe_builddir, bootimg_dir, kernel_dir,
> +                             rootfs_dir, native_sysroot):
> +        """
> +        Called to do the actual content population for a partition i.e. it
> +        'prepares' the partition to be incorporated into the image.
> +        """
> +        return
> -- 
> 2.7.4
> 

> 
> 
> 

