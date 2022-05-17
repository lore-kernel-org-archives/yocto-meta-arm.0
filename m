Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88E8C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 14:17:33 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.7808.1652797046827668229
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 07:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=kGm0qKfW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id p4so14353474qtq.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KBCV5wMFsv4UPlYjnISgdiZdL2SxLlyBWlwoNbxFA4c=;
        b=kGm0qKfWYlxGLPbSfRupOrsDiffxeLL2KrGOoOfy95FoCJfeYX/uJndTOoXSchnvdZ
         BJjDjq6aCBeZ8ug7IGCfuBoCmyQMHBELf7FkGtgYsnGkeRg1P7MP+ew5uFHZS4ZnM0MY
         ZM7aleyUzRDs0+252XejToX/TdYDjQmJOkY2EiluwO7Jc2dTBcNOWOe2YuDu1Mb3zJPr
         cRtCAY5s3opsaVzMQnpOGsoQpzrlgX87dXvYsnyAmOFY43fhqgU/2+xw/EJ+PWn/cuiO
         wt65LAeImIvqGZqLUuR7Yece7iZxGB2RO8LhzSK6D7GyUkCiuQhoTLf4+Scx5PYg6LIP
         mtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KBCV5wMFsv4UPlYjnISgdiZdL2SxLlyBWlwoNbxFA4c=;
        b=sVH1Ile5xl7MsEYlq5yORpT63WVFcSzBwCvUjSH4sgKHcWdeWIb45Gf2z5cRaQ7WTu
         r02wRDbV5N6tJUERNyC+f30jeIoUiXSNZrDsFrU8J7dNKwYYqP4AdAvG+1kuivxbOtLo
         aBuPvE8QQ9fRKQAcrCZhMIGQ8R5x9q++rBgRtc0uRhqROsAjOCB6dP/GM0N/QF1aaTVF
         gc09/EiGrxvbClEWueRf+JmSP+C8AgREEFcsD22snQhSIFDseGW1m9Wkm/fk/Nwpq+EJ
         S0fAKbcVXbX4JhP3AA4QAMBkc+TNqGYc18QktcPEFwn5NEteyj3MTW/dTZSVPSEdfBjv
         WDmw==
X-Gm-Message-State: AOAM532GUxKwl4860D+gW/0ohje7miMIEDhvAYOzkigbFmz1DXKjQ3r+
	XYztpdJd5vY/VvOg5YcJYZ2I7w==
X-Google-Smtp-Source: 
 ABdhPJwe3UHi+vt+x03QWhwuFhUMYISQhhSPf56xc/e07KyQs93kzLugCHLwPiilccRiAbosHzN7GQ==
X-Received: by 2002:a05:622a:148f:b0:2f3:b46a:f197 with SMTP id
 t15-20020a05622a148f00b002f3b46af197mr19776481qtx.233.1652797045864;
        Tue, 17 May 2022 07:17:25 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 v18-20020a05622a145200b002f39b99f6a4sm7133791qtx.62.2022.05.17.07.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 07:17:25 -0700 (PDT)
Date: Tue, 17 May 2022 10:17:24 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] sbsa-acs: Refresh GCC 12 patches
Message-ID: <YoOudFVywIdUP6j0@kudzu.us>
References: <20220517014614.148223-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517014614.148223-1-raj.khem@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 14:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3417

On Mon, May 16, 2022 at 06:46:14PM -0700, Khem Raj wrote:
> Current patches do not apply cleanly.

This one fails for me as well
https://gitlab.com/jonmason00/meta-arm/-/jobs/2467458095

I had one I was testing overnight that works.  I'll send it out
shortly.

Thanks,
Jon


> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-BaseTools-fix-gcc12-warning-1.patch  | 35 ++++++++-----------
>  .../0001-BaseTools-fix-gcc12-warning.patch    | 32 ++++++++---------
>  2 files changed, 31 insertions(+), 36 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch
> index 565ba11..175dfa7 100644
> --- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch
> +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch
> @@ -27,25 +27,20 @@ Reviewed-by: Bob Feng <bob.c.feng@intel.com>
>   BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>  
> -diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> -index 4e9b499f8d..4b9f5fa692 100644
>  --- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
>  +++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> -@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, BoolInt reInit,
> - 
> -   nowPos64 = p->nowPos64;
> -   RangeEnc_Init(&p->rc);
> --  p->rc.outStream = &outStream.vt;
> - 
> -   if (desiredPackSize == 0)
> -     return SZ_ERROR_OUTPUT_EOF;
> - 
> -+  p->rc.outStream = &outStream.vt;
> -   res = LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
> -+  p->rc.outStream = NULL;
> - 
> -   *unpackSize = (UInt32)(p->nowPos64 - nowPos64);
> -   *destLen -= outStream.rem;
> --- 
> -2.36.1
> -
> +@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHan
> + 
> +   nowPos64 = p->nowPos64;
> +   RangeEnc_Init(&p->rc);
> +-  p->rc.outStream = &outStream.vt;
> + 
> +   if (desiredPackSize == 0)
> +     return SZ_ERROR_OUTPUT_EOF;
> + 
> ++  p->rc.outStream = &outStream.vt;
> +   res = LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
> ++  p->rc.outStream = NULL;
> + 
> +   *unpackSize = (UInt32)(p->nowPos64 - nowPos64);
> +   *destLen -= outStream.rem;
> diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch
> index f2142de..ebdc78b 100644
> --- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch
> +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch
> @@ -21,22 +21,22 @@ Reviewed-by: Bob Feng <bob.c.feng@intel.com>
>  --- a/BaseTools/Source/C/GenFfs/GenFfs.c
>  +++ b/BaseTools/Source/C/GenFfs/GenFfs.c
>  @@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT3
> -   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
> -   if (PeFileBuffer == NULL) {
> -     fclose (InFileHandle);
> --    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> -+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
> -     return EFI_OUT_OF_RESOURCES;
> -   }
> -   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> +   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer == NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
>  --- a/BaseTools/Source/C/GenSec/GenSec.c
>  +++ b/BaseTools/Source/C/GenSec/GenSec.c
>  @@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT3
> -   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
> -   if (PeFileBuffer == NULL) {
> -     fclose (InFileHandle);
> --    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> -+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
> -     return EFI_OUT_OF_RESOURCES;
> -   }
> -   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> +   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer == NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> -- 
> 2.36.1
> 
> 

