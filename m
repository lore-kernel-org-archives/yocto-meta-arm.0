Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D80C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 14:55:13 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.24060.1684248910903710873
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 May 2023 07:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=kfNHkAOp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-61cd6191a62so64533166d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 May 2023 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684248910; x=1686840910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JdZ7sc3vKRgHSw51cEFmAtgxY8xI5rrXykAiOpWLwrI=;
        b=kfNHkAOp0n39IjEovnIUkvCzcy5Ib2BnCLn9pfJATAtpAddzn0QUsZvVmvb3Tyi4Ge
         JXbgNCi81bjQxTB9EP49+JKdjM07tGJgdsZw83L7rY7lbp2u/z7CWIZc/3D+/6ma5b/F
         jjniIUirsRsuGptbDdGimxrc7LgOGJI1If0XaHR33NFf5JmO3Hkac4s5G6urlMbChyve
         CzLQBbt1C1GAT/dTH3KtQl/PmTWr0ORHBKWjIb3+3iV2Lo2rYIsck+tFEClHNpA04VdC
         0FSiJtHhtbUNDQc402KcCfDx6uJzmZCvD3B8GfYLuxHEtVT89iwAZgzcd/vYdWtBF5z+
         Ctxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684248910; x=1686840910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdZ7sc3vKRgHSw51cEFmAtgxY8xI5rrXykAiOpWLwrI=;
        b=RdJPZYjsbJBykGe36fDsKvdloUQLDTOGqO9UYjB1havKwnR5LBCl3Ihmtze4MJKRmW
         PJgbj0pVs9ih7tOpkLrZd/ji3WJUNnWdg6ghqDQNh++rPQ3rPxV1jNEE4tY72QXnh2bL
         emiRcMcrZqjhw43KhyhQgjYjpKDQQjSDjmS4Sq9jQD8rFQyANESWfgO4dfcPFkJYJ7TI
         AaJr4PSqW1xQAu7yOh45EPuyWHz9E2IakGHDAGfXS5Feqi1vcImyLtxNr6nDMaeFtGXx
         GwwU8D5JIx5VfifPb92fVWHTq4sjNPYlyRa+r/luleLFFDrzCkFeCn5GPtGajtOR0Z87
         gbYA==
X-Gm-Message-State: AC+VfDzRSJRynp/PkEkrnI3jZvwrgjYhupQx8nxJ82uS6rTLVvemxmaT
	6b7rRRkpMLIRP3Cc9ngXRa1xqA==
X-Google-Smtp-Source: ACHHUZ43LfMORT/UAkK4b4U812uQlceHnDIeiPwRh4xV+vI9a98n2UB7dbegq+sAYK9j0pvfm66jwg==
X-Received: by 2002:a05:6214:485:b0:619:ff0c:9246 with SMTP id pt5-20020a056214048500b00619ff0c9246mr61418426qvb.34.1684248909899;
        Tue, 16 May 2023 07:55:09 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c23-20020a05620a135700b0074fafbea974sm657753qkl.2.2023.05.16.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 07:55:09 -0700 (PDT)
Date: Tue, 16 May 2023 10:55:07 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] arm-toolchain/gcc: Workaround for missing libcrypt
Message-ID: <ZGOZSw2tlQ9XCLfw@kudzu.us>
References: <20230515111522.657505-1-claus.stovgaard@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515111522.657505-1-claus.stovgaard@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 May 2023 14:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4654

On Mon, May 15, 2023 at 01:15:22PM +0200, Claus Stovgaard wrote:
> gcc-arm-none-eabi and gcc-aarch64-none-elf both fails when packaged as
> RPM for sdk with
> 
> nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi-12.2.rel1-r0.x86_64_nativesdk
> 
> This is a workaround by skipping the FILEDEPS

A little more verbosity here would be nice.  Something describing how
prebuilt libraries might link to libraries that aren't present and
becuse they are prebuilt, we don't control the dependencies.  We don't
need a book, just 3-4 sentences.

Also, missing your Signed-off-by line

> ---
>  .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> index 528b0061..4d7241c5 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> @@ -24,3 +24,5 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  PRIVATE_LIBS = "libgcc_s.so.1 libstdc++.so.6"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +

It would be nice to have a comment here about why this was added, to
save people from looking at the log when doing quick edits.  Perhaps
something like:

# skipping file deps because of libcrypt issue

> +SKIP_FILEDEPS="1"
> -- 
> 2.39.3
> 
> 

