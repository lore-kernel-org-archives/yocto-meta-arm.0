Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.3999.1593658948208797963
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 20:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kgVBaAAZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id t7so12011579qvl.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Jul 2020 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ecQesWj0oZBvmhvdLpm6jVNyMQwQ4Re+UFoCsWJchJI=;
        b=kgVBaAAZEQqwgz3yDsdUoYpjMBxQq61qVTqVncndCPgk4Th3AcktECDXxgsJ/0GIjx
         5QIKSdq0Mm+xTr8/ZAUq5r+NkbrUi5n3a13baUZpm/fJ0I8KNMthhFVdXtGtAMm67fIg
         ZIwGW41O8l/9/Wcj2jRtgnjAKp717B+9R6zRpd9S8IDw6SxELazTzK+0xse+2Ql2x/wU
         7HKyuj4J13h9DRaAaJ3busS7+22QS0bddssncvSFUVbpCjwigEAopkphvvGIjUN0OyGH
         M4T++97spJXJ8jeINIH3t/wNRiXYCHKI89DprjrJOKjl1ICvu8ILT5KA5+GHRy/kMHwj
         tewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ecQesWj0oZBvmhvdLpm6jVNyMQwQ4Re+UFoCsWJchJI=;
        b=hb7KlVWF3f3PdF8bEUHQ77pKCr8/Hy+hLUMeJ2Mi6M+rMA8O2/3cU2Bcx1atChpzUK
         53onFEg8UXrwjEpjYnXe7Dg0jWyVW52YP1rNPj+/gBqGgiLHphU7LyI8CByQ+bXpXSel
         01ij2CUWs3LzXXrv3BOM+serA3KlTzPTXdx4t2InUKV69uXqRNjDPUnwH/sW4ziA2ah/
         3ayWcj45MQjkM5TS4pSqJwTptUHCLcG6yu9PQHOPS08IgtvHQGFeqiloXkL3MT7ssNLz
         b3KTHiOuvLcl7u3+B5rkXDNEiGN4yfkwzgXeqHWBDsDUte9YtF5QhYmngf5BZtBMrpdG
         L1+A==
X-Gm-Message-State: AOAM533rtfHddNE4sK8YdlWFz+Ft6UNbXcZjhb1cRKjk8BcN2ks9Vsx7
	tPczM2oUJICifM7I9CQBz6Ogf0iK8P6O2Q==
X-Google-Smtp-Source: ABdhPJywbhRgMGD36DgBUeXPSGBjTP7SVaRqryJumDYuuI99MIigVbDczHgiJ8CRQoyzr5Ys+lvtRA==
X-Received: by 2002:a0c:e789:: with SMTP id x9mr26547329qvn.135.1593658947355;
        Wed, 01 Jul 2020 20:02:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:1d8b:ebce:76d9:94e6])
        by smtp.gmail.com with ESMTPSA id 19sm7188222qke.44.2020.07.01.20.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 20:02:27 -0700 (PDT)
Date: Wed, 1 Jul 2020 23:02:25 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] linux-linaro-arm_5.4: fix build of Perf with new BFD
Message-ID: <20200702030225.GB29060@kudzu.us>
References: <20200630212335.36096-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200630212335.36096-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 10:23:35PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Change-Id: Ice129ecddc17c3c24e177cf4f2d3445daeb6b455
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../linux-linaro-arm-5.4/fix-bfd-link.patch   | 60 +++++++++++++++++++
>  .../linux/linux-linaro-arm_5.4.bb             |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
> new file mode 100644
> index 0000000..63d4fda
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
> @@ -0,0 +1,60 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 0ada120c883d4f1f6aafd01cf0fbb10d8bbba015 Mon Sep 17 00:00:00 2001
> +From: Changbin Du <changbin.du@gmail.com>
> +Date: Tue, 28 Jan 2020 23:29:38 +0800
> +Subject: [PATCH] perf: Make perf able to build with latest libbfd
> +
> +libbfd has changed the bfd_section_* macros to inline functions
> +bfd_section_<field> since 2019-09-18. See below two commits:
> +  o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
> +  o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html
> +
> +This fix make perf able to build with both old and new libbfd.
> +
> +Signed-off-by: Changbin Du <changbin.du@gmail.com>
> +Acked-by: Jiri Olsa <jolsa@redhat.com>
> +Cc: Peter Zijlstra <peterz@infradead.org>
> +Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gmail.com
> +Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> +---
> + tools/perf/util/srcline.c | 16 +++++++++++++++-
> + 1 file changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> +index 6ccf6f6d09df9..5b7d6c16d33fe 100644
> +--- a/tools/perf/util/srcline.c
> ++++ b/tools/perf/util/srcline.c
> +@@ -193,16 +193,30 @@ static void find_address_in_section(bfd *abfd, asection *section, void *data)
> + 	bfd_vma pc, vma;
> + 	bfd_size_type size;
> + 	struct a2l_data *a2l = data;
> ++	flagword flags;
> + 
> + 	if (a2l->found)
> + 		return;
> + 
> +-	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) == 0)
> ++#ifdef bfd_get_section_flags
> ++	flags = bfd_get_section_flags(abfd, section);
> ++#else
> ++	flags = bfd_section_flags(section);
> ++#endif
> ++	if ((flags & SEC_ALLOC) == 0)
> + 		return;
> + 
> + 	pc = a2l->addr;
> ++#ifdef bfd_get_section_vma
> + 	vma = bfd_get_section_vma(abfd, section);
> ++#else
> ++	vma = bfd_section_vma(section);
> ++#endif
> ++#ifdef bfd_get_section_size
> + 	size = bfd_get_section_size(section);
> ++#else
> ++	size = bfd_section_size(section);
> ++#endif
> + 
> + 	if (pc < vma || pc >= vma + size)
> + 		return;
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index d2cd127..516573a 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -13,6 +13,7 @@ KBRANCH = "n1sdp"
>  
>  SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;nobranch=1 \
>             file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> +           file://fix-bfd-link.patch \
>            "
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>  
> -- 
> 2.24.3 (Apple Git-128)
> 

> 

