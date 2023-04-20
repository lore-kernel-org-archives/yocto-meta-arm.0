Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED7AC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 14:50:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.10105.1682002224309864801
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 07:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=gh337J6K;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3ef31206cbdso3606901cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 07:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682002223; x=1684594223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AHQfjjzDm3l89Rf5F/Oi/w/4TWFhmmI+8XYGBe4Ew6U=;
        b=gh337J6KShwq+r/+NmFNgaD/NuwLRw/JWniX3rGvnND4taUBV0u1GNV8j1HAFJgI/9
         bntQBV0r6APNFzAuBeZEvYalQCv6Lj22ejuqPIp107kajEmf96SxYqiQSpaeNhV7RKpb
         zwTjHjgjsBcva8y0NcY2TNjtqSRVg33HWUH7HFllz+e3LFFBimlZZ+G2uV+SB0f6423H
         abqPKVAwEsB557PvRD8oM454w0LKskdJACFKe7gcgSgUP6FFxjbGiTcDq2+jKgjTt69F
         /Bteq2OKPn0v5h5CvL4fvAixXEYznTHpYPqztQ4Pr//6D6UsWTyE5wf8bTiI8x2j749V
         dmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002223; x=1684594223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHQfjjzDm3l89Rf5F/Oi/w/4TWFhmmI+8XYGBe4Ew6U=;
        b=azZdUPTUA8MmNM8Z1/UL9eZ/bGvkXWD1faL6yMscAMM5K5u2XuQqZ8ieCnCTyzuVlh
         Feyq+u7jNquUT14tyyynVkKPbe/zQfibTQ4c5sV4kXicRJ7BE0LhsrQAMCtQkWztQWdC
         y6RHCUQiyUoV2GDLaITlELxvP9dBvNCm2CCdjTgBdHXAvt02qF1qy1aCieWvEqo0jgY8
         sSrcI3IgZpFBG1soBB0d7sVKmlaKfyxdpJTxfT2p6g+rEZjRNsv85jUQMgVcDXTftSBY
         2TcC0XwB5ce30Ao8Or5VZPH7A8hZUdxXdk3bfLNn5dGRpsQlrWaOQ3e+zXmR3TvID379
         eIQQ==
X-Gm-Message-State: AAQBX9fQLumB++3SDkG2x8DiEdScEy4f/145vH8XEflyKVbupKEduFXi
	jXrm+5YQIIieBTIZpHYCBCr2JA==
X-Google-Smtp-Source: AKy350Y70bDxtIvCbtSPEPX6BZ6J51Dp/Fo9c37MUdrE2KerWTIBDZHxub+BRfLne3IKIW3rg6pUcA==
X-Received: by 2002:a05:622a:1746:b0:3e3:93f9:1907 with SMTP id l6-20020a05622a174600b003e393f91907mr2671265qtk.40.1682002223288;
        Thu, 20 Apr 2023 07:50:23 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k1-20020ac86041000000b003ecf475286csm534432qtm.39.2023.04.20.07.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 07:50:22 -0700 (PDT)
Date: Thu, 20 Apr 2023 10:50:21 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [PATCH 6/6] CI: add TF-M to TC build
Message-ID: <ZEFRLVQCHXX3hW2y@kudzu.us>
References: <20230420125233.1918925-1-ross.burton@arm.com>
 <20230420125233.1918925-6-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420125233.1918925-6-ross.burton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 14:50:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4599

On Thu, Apr 20, 2023 at 01:52:33PM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>

A slight rework of this patch was needed to apply cleanly on top of
the tc1 patches pushed a few minutes prior to this series.  The
modified patch can be seen at
https://gitlab.com/jonmason00/meta-arm/-/commit/ea407ce849f7f181f5b43a2495436a720a32cbef

Thanks,
Jon

> ---
>  ci/tc1.yml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/ci/tc1.yml b/ci/tc1.yml
> index fd9acbd2..d9a7cbfc 100644
> --- a/ci/tc1.yml
> +++ b/ci/tc1.yml
> @@ -2,8 +2,10 @@ header:
>    version: 11
>    includes:
>      - ci/base.yml
> +    - ci/meta-openembedded.yml
>  
>  machine: tc1
>  
>  target:
>    - tc-artifacts-image
> +  - trusted-firmware-m
> -- 
> 2.34.1
> 
> 

