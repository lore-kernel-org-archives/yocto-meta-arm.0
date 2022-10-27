Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810C0FA3741
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 06:20:37 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.3534.1666851629033717291
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 23:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ekwy4Xok;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id s24so846470ljs.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3IkfdJk0hcS2C5pVDnLDZsAZIk3Wsh593/EKTGOl+eg=;
        b=ekwy4XokRlMIBRD4ANKA6A1aBDMCyWtFAnfjDbYt7n4XIqP7WWqWXT3Bq2YnImTtcv
         p09oBKOrf80wPAx+DpQaTlWHZ68dPFny7eIk8kRKlNB2fWuPla1njf8V5jKs1YSFND6v
         Hq+bsBedz/X8WVCtl4dD9uLVT85elfA/tJozW0eF4h9yqNN3xnL8nvjzIqvELM8BBDrA
         b4EPiosLQWaGkeU+dC94fPfPZP7EWZI+I2egvIceWH3lm5lY+hwgDgwDc5lYEUIAjvu6
         zitYmgj4d27n3+XbO2ciWzMqzfoH3dBQRBQNPH4NCxWlJTHp+eFlLzqwkftQkGBpfg4x
         ACyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IkfdJk0hcS2C5pVDnLDZsAZIk3Wsh593/EKTGOl+eg=;
        b=hb9ZLX5di/YgSdX/0FVvmbGa29uuYcKsA2kH1fdrJD+i86c3hrbsLJZkJ37Btnvb7j
         VafLuunRx6TPJDhcjrkHbCyPS+ME6yrv2Ft4RP8rq7OUONMrcs7oFg4ed14LMBF0Bg8i
         4G3Vi6ZpUqzU6qvsO17BK6/9WIDPwsQmjyaqosBX6eeDfFHh+2ypwGbiwfab+gBxfKd9
         56W9ho0hNZqACiHbev7S7YTu6JwpQqi+4pxnt152d4CTc43efQzpIOtywhbWZVnwGcOx
         +NVWnQy+EUdi16IqwkzskiIRDEstH0qJUAXVcjDldpxQvd7ZXAspsZBLPTfOlVMx9rNW
         8onw==
X-Gm-Message-State: ACrzQf23H6u13DUUV+hVotzYPnzCBodhJ14qIRmdIS6feqX1d8npu4nU
	KolI/7h2kjUhAr/6oRJuA0Esmw3iE+zGdA==
X-Google-Smtp-Source: AMsMyM6lrbhBWJyBM7hpol03HqoKtfGgpFgz+/7771Ey07luIyosVvaNYQHUFOIhkkdSNpb/MVu+Mg==
X-Received: by 2002:a2e:8eda:0:b0:277:1d47:f5de with SMTP id e26-20020a2e8eda000000b002771d47f5demr4332199ljl.319.1666851627365;
        Wed, 26 Oct 2022 23:20:27 -0700 (PDT)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id e12-20020a05651c038c00b0026de0c8098csm103808ljp.26.2022.10.26.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:20:26 -0700 (PDT)
Date: Thu, 27 Oct 2022 09:20:24 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-arm][PATCH 3/3] optee-os-ts: avoid using escape chars in
 EXTRA_OEMAKE
Message-ID: <Y1ojKImtZ4/NAOvX@nuoska>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
 <20221026141854.1557213-3-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026141854.1557213-3-jose.quaresma@foundries.io>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 06:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4045

Hi,

On Wed, Oct 26, 2022 at 02:18:54PM +0000, Jose Quaresma wrote:
> This currently can break the bitbake parsing
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta-arm/recipes-security/optee/optee-os-ts.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/recipes-security/optee/optee-os-ts.inc
> index 10a41755..73b8c14f 100644
> --- a/meta-arm/recipes-security/optee/optee-os-ts.inc
> +++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
> @@ -51,4 +51,4 @@ DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
>  SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
>                                          ' ${TS_BIN}/${SMM_GATEWAY_UUID}.stripped.elf', '', d)}"
>  
> -EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS=\'${SP_PATHS}\' ', d)}"
> +EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS="${SP_PATHS}" ', d)}"

Use plain += instead of :append.

Cheers,

-Mikko

