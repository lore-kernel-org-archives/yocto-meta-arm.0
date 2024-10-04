Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99B6CF854E
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 14:01:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.22708.1728050504085085124
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 07:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Luz0ee1D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a9a23fc16fso174978785a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728050503; x=1728655303; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DUD9bsWvyfkKYzxVy9QBTTerhvQx8zm2YVxb0yrmkv0=;
        b=Luz0ee1DKZnZq0DgY1s50ltSczbfFpmHS8eD0y7D99HExECXKet0v3a1+yY8bI3h3e
         tbQhpXhrexcsPxKwQVHbnRSDDSva/h60HI08CmKW0nYYX23MIlClVyNqatmPtsC6bmK3
         5pL2ygJVUtYVkvJiF+zBZ9DMu4l3DqZ9fZLs2Wcw6mPOtfW9PpjmlMC1Bt5UYMTp5ebL
         PdvFy0P5I97IW6IEBoCv2BT8OsePKBOu6uEY62yqrwBNNyYcY0rBDh52ugS2r7Furem1
         GJglkMwxOhUQXsdG7+aaibaXl4DZUGmbKCShmuyEEi/bxgn4v680dNf7oZ7j1/hZY7xe
         MOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050503; x=1728655303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUD9bsWvyfkKYzxVy9QBTTerhvQx8zm2YVxb0yrmkv0=;
        b=mqjZqmM/seza9gMM65preIpD2ewY10uKMN3UQirtlOkMqnBViD/5Ojj/Sgkq8/Or34
         fm6zHGgbJJVXn9x2RkRT/Z2N6ax/6rEGLTBqpIiE1WBpFOhzatfr+5h5V2dKme0MbU/e
         1MWr9PokmU+73cke13U2ZHgrnN5slV+giIuZJGJPOSQrc0NN+N4vBSrJAcwlLpQ6tg+v
         zi2NKzJnu3ppaAV3CtBVb2jnOLvwsbec2pfI68yV3hmnwvuvEf8dAUbxuHKiIEu+/zQA
         7XXDgtDvpXKNoH/KZE0t3A3DbNQK1M322Tj9WJeTzPVa5NTNOBgKP5ajHWpCgr4CAbBS
         WCoQ==
X-Gm-Message-State: AOJu0YyEbQtyODJGkMuMpTEcHvIxT/oD9QrUQMoe4SwzPJIpONPAN99/
	hULO9LGWcrlC2xhhLtVtlbt0xf1LpvoqbsLHJt+8J6gKBzz/wflkucP+zI51Uw==
X-Google-Smtp-Source: AGHT+IG7fmszfEsVFvFD8DD1AM8r5FJzFJZB9K+sGqLXC0QnI7AJP/jmBRDAzq55q8tXTfl7V6q8yA==
X-Received: by 2002:a05:620a:319b:b0:7a9:b8d1:a27 with SMTP id af79cd13be357-7ae6f49971cmr408908085a.53.1728050502847;
        Fri, 04 Oct 2024 07:01:42 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae6b3dad2fsm139647385a.105.2024.10.04.07.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:01:42 -0700 (PDT)
Date: Fri, 4 Oct 2024 10:01:41 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH master-next 2/2] qemuarm*-secureboot.conf: fix kernel
 serial consoles
Message-ID: <Zv_1RfzWjJp6DJtJ@kudzu.us>
References: <20241004130427.217611-1-mikko.rapeli@linaro.org>
 <20241004130427.217611-2-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004130427.217611-2-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 14:01:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6168

On Fri, Oct 04, 2024 at 04:04:27PM +0300, Mikko Rapeli wrote:
> Kernel boot serial console is not visible in runqemu stdout.
> Fix this by setting SERIAL_CONSOLES to include ttyAMA0
> and use that as KERNEL_CONSOLE in .wks file bootloader
> configuration which assembles the kernel command line.
> Now kernel boot log is again visible, incase there are problems
> with it.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
> index f08b84fe..c01ca47a 100644
> --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>  
>  MACHINE_FEATURES += "optee-ftpm"
> +
> +SERIAL_CONSOLES = "115200;ttyAMA0"
> +KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index 78a39c03..2f8c093a 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -22,3 +22,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>  
>  MACHINE_FEATURES += "optee-ftpm"
> +
> +SERIAL_CONSOLES = "115200;ttyAMA0"
> +KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"
> -- 
> 2.34.1
> 
> 

I'm not inclined to include this patch, and it should be unnecessary
soon (and I'll need to revert it then).  The patch that adds that
KERNEL_CONSOLE is in poky/oe-core master-next.  So, it should be very
soon.  The SERIAL_CONSOLES line should be unnecessary, and that should
be inherited from qemuarm/qemuarm64.

Thanks,
Jon

