Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.3700.1608154144306698842
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 13:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KEPpfLfv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id 19so24420708qkm.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 16 Dec 2020 13:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CFej9qGQISoOE3bWNkfGJD+vbGXIA2Db522KbUa9bH0=;
        b=KEPpfLfvnHiuqTEspZrU9+InJGW1DaNQXYhiZW+RU2zl6/g+GQihBK4Z47K2fkaeZf
         CnaUdkZSeK7DbqEAI4Tb9uplf9kjCcXoyi3Rmxii3pYushxjk+EQeW9Z9Yw6qi2RQ6jS
         vwqcB7S9U08P938RTiXypV0jDzPhm/XRHaAb1jtvU/NhWpvLWb6B+jGlz4+New4Ia56N
         hRlW/76oR2nydJVAMcUaeipdx3+ZLJeLRPvD9sEuC25q+FCJPnWx9RW2rrFI88qo7UBy
         fnPkjEYs+pGbzuqMHxX+5aht1nAIwMAFQkWZItBOwujRvEMjvmSbFfPnSXag2I5FJ39E
         01cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CFej9qGQISoOE3bWNkfGJD+vbGXIA2Db522KbUa9bH0=;
        b=JGhTMzg/zWOUMBMvpacblqHifcI/ZnDb8vQnM+FZJaq4/iS4hyqLSOEqvtX430Arld
         jNa6rd5Jsz6BuGaJ3cN8OvmKCeork6nIDeMxXQ/fKlP5BIEEnihEBaiC1kd7pUDFDpH8
         w3rMzMq40Y/GDFISdrawB2jbZ/tNR5kU4noLiXTwXaWBsauNA7IRCiSBB2b2PYGSqJ4y
         MmOPJnw4yY3cn0/sLpgpIyhidK/fwjMHS7rkBFDij56WXw6/TLDYuLI11lyhu1Yt1/a6
         ffanxLMUYJ+MqR20B8aatpJ+4LckHHLq8Wc7Ogx4sWVUT75MnYBKE8h3BB7kZAxNKmPf
         o11w==
X-Gm-Message-State: AOAM532fSwJsri/UbybsqlElGgJx+3Tjxyi2LsTnlvbhH04vg1fI/k6V
	9FPj2QK03ARFx1E8Cl90tPu/3w==
X-Google-Smtp-Source: ABdhPJxGkdoDemmUdWaOLqTox29ZcSEFrid/HwwRsnhsHvUGnXtY9nFRY0eN43xDqYSxE5jYB1pTIQ==
X-Received: by 2002:a37:a44:: with SMTP id 65mr46199578qkk.478.1608154143408;
        Wed, 16 Dec 2020 13:29:03 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:dccb:7f71:637e:7064])
        by smtp.gmail.com with ESMTPSA id v5sm1936642qkv.64.2020.12.16.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 13:29:02 -0800 (PST)
Date: Wed, 16 Dec 2020 16:29:01 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/wic: Revert Introduce empty plugin to create unformatted empty partitions
Message-ID: <20201216212900.GB23294@kudzu.us>
References: <4341c027264f23f8f1738e2972cebcc53b6b74fd.1608130805.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <4341c027264f23f8f1738e2972cebcc53b6b74fd.1608130805.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 16, 2020 at 03:00:26PM +0000, Diego Sueiro wrote:
> This reverts commit bc07e6c62adcfa8e997fa7862ddd47ccf1ab5785.
> 
> Wic empty plugin upstreamed to oe-core as: 77d174fc80663403ef76c5b808aafc1117d3545c.
> 
> Change-Id: I94e6fb8583cf6e26cf141087fe5adb187ea85ef1
> Issue-Id: SCM-1520
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../scripts/lib/wic/plugins/source/empty.py   | 32 -------------------
>  1 file changed, 32 deletions(-)
>  delete mode 100644 meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> 
> diff --git a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> deleted file mode 100644
> index 041617d..0000000
> --- a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -#
> -# SPDX-License-Identifier: MIT
> -#
> -
> -# The empty wic plugin is used to create unformatted empty partitions for wic
> -# images.
> -# To use it you must pass "empty" as argument for the "--source" parameter in
> -# the wks file. For example:
> -# part foo --source empty --ondisk sda --size="1024" --align 1024
> -
> -import logging
> -
> -from wic.pluginbase import SourcePlugin
> -
> -logger = logging.getLogger('wic')
> -
> -class EmptyPartitionPlugin(SourcePlugin):
> -    """
> -    Populate unformatted empty partition.
> -    """
> -
> -    name = 'empty'
> -
> -    @classmethod
> -    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> -                             oe_builddir, bootimg_dir, kernel_dir,
> -                             rootfs_dir, native_sysroot):
> -        """
> -        Called to do the actual content population for a partition i.e. it
> -        'prepares' the partition to be incorporated into the image.
> -        """
> -        return
> -- 
> 2.17.1
> 

> 
> 
> 

