Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731C5C67871
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 06:19:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.3528.1666851587905009885
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 23:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mjIygm9A;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id g7so793257lfv.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9UTsI6Lj3ExKbDZtOxhCtGabSSoDZeiQkoQoPVFXsM=;
        b=mjIygm9A4gxZ/QeBoebD4U7TjfUiVLI3XvPttJxedOg7uQx/90xGM2AghjAZFXQzJg
         n+d1mWWkdMWJB5W24TNL4E3Hxkw/pXGEJqxe+CbFxg7TDJCO/tPzwYj/wM3l6n5Z0rVp
         V73D5gKVwraoucKKqU1JskoXcfjbobws82xn4dAJH+Hol7KXmI5tVA5u9KfAfy/CvNhD
         rA7NzAG3kEycBqXtIN5CSpEgkPln8iZc/hYH29zmXw9Lo3encR5rMYKkBv81FlWmCDtH
         i+ecVUygiDHBiluU4LSEMWEDpiumGNUWfaIXgmlEkDY74vDCMX1ivBbVPIQyNWumyIoE
         jkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9UTsI6Lj3ExKbDZtOxhCtGabSSoDZeiQkoQoPVFXsM=;
        b=FpkNz3avHYg1xQmPPlv+kDYtaQTOIr2dQhj69PtdcRgJzs82rW6CBf0PzLykoEo6hM
         PaeSlr4SJCZZG9lTR/9X3Sb8jNJl9AwOid9pbCirHkuaraldezFFs++rb1gox9h46VjS
         9XXHMRxoV82Vzd0AmZbJ2N/b21YKPSDOcFYrNnYSNBJ9zjPLJOvbtT7rDEG8A6NN3CVq
         j6jQNshsbXq0mm9N72twcacMb2A2HwNfSZzBD72XXmMAgCm8L5nRPdo2Lj9/mDTSi65l
         oaO2AQyGWWNRW6oWOlLNcDZJ0thP4VAWsObUvvQTj0oFEH7gsKE3vtynAmlBzV24G/Rk
         +Wzg==
X-Gm-Message-State: ACrzQf1FSqDEOnl+hBRjSR6z2DE/cOQECLMDoyWg5fuTFNqfq8YCTOkj
	6ApXPkvmfGqiY0zZnWY+B3miQw==
X-Google-Smtp-Source: AMsMyM5sFApajaPutKqYV96DT4tGbJpduhbEOMfYvrPqtHokRMJ9v+Z8szlloRNfKUkQLNB0ZfXT3Q==
X-Received: by 2002:a05:6512:239c:b0:4a2:7e95:5682 with SMTP id c28-20020a056512239c00b004a27e955682mr16290966lfv.185.1666851586250;
        Wed, 26 Oct 2022 23:19:46 -0700 (PDT)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id q28-20020a2eb4bc000000b0026e90b478c6sm97281ljm.114.2022.10.26.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:19:45 -0700 (PDT)
Date: Thu, 27 Oct 2022 09:19:43 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-arm][PATCH 2/3] optee-ftpm/optee-os: rewite in a way to be
 less error prone
Message-ID: <Y1oi/4RvTqTeRVFJ@nuoska>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
 <20221026141854.1557213-2-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026141854.1557213-2-jose.quaresma@foundries.io>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 06:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4044

Hi,

On Wed, Oct 26, 2022 at 02:18:53PM +0000, Jose Quaresma wrote:
> So it becomes clearer the need to use the space in the append
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../optee-ftpm/optee-os_%.bbappend               | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> index 40423615..332c7c1c 100644
> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -1,15 +1,7 @@
>  FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
>  
> -DEPENDS:append = "\
> -                  ${@bb.utils.contains('MACHINE_FEATURES', \
> -                 'optee-ftpm', \
> -                 'optee-ftpm', \
> -                 '' , \
> -                 d)}"
> +DEPENDS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \

Same here, don't use :append, use += which will add the space too.

> +                 ' optee-ftpm', '' , d)}"
>  
> -EXTRA_OEMAKE:append = "\
> -                       ${@bb.utils.contains('MACHINE_FEATURES', \
> -                      'optee-ftpm', \
> -                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
> -                      '', \
> -                      d)} "
> +EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \

Ditto.

Cheers,

-Mikko

