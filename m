Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8DCC05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:50:35 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.11166.1675331432670787395
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WwgUhV4b;
 spf=pass (domain: linaro.org, ip: 209.85.218.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ej1-f49.google.com with SMTP id mc11so4268722ejb.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 01:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JrP/KaIyz28YwzLQi6nabW4iRVQgdQZBsedmG5R8o6U=;
        b=WwgUhV4bMbKq2NuMTNXGweFrlYERItLC3WKbDLagg0nq97eZsnSjpB9HZ7v/BOoXXC
         lklp50q0Ok41GwlK3J4bnrUq5Is9DNl/nhi33cn9qJCC2VmA5DcamVV4ndFHLk+LfMb9
         avCyQKa3dgkxMkd4hUoLSmI/VFZu+ShyeuseRbLNF6aImMPG46S5atpHQwN9zRvyjzZ4
         UlhPfSPY7W1Bwog4FTsjh8WZJBfLl+Q0xijnNStWJYPxxPGk2efQ/efqRJhSQKEWX/p4
         3j0peeiRgIFnMl3qneTFmJo7fhb3VRqbvflF5/EW+ME6Rd+YnBcphZSEXdWsZw/X7BZ4
         GV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrP/KaIyz28YwzLQi6nabW4iRVQgdQZBsedmG5R8o6U=;
        b=BWWgmrOlAIqMd7Z1cBJNIF4TXkiwntClg5lyZFqg/vA51RVyB7bhCmgaWNfBGhdg07
         gzRhG0cg/o8HL+UiT0xEpCpwExmJZk9FynRDKQplkJ5Gs7nuV0ZjNqAPpL69HiEbP6Kz
         o9gsSfjZMtzL8ozId1/j7puvMZHS1kpG/E/QInhNK/wF7QbOUn1i7ZBzjOmi1YQhzCei
         18a5oESDfU3+qAFcEU9SKPmWAHws1NK1MtB5lPMeODYIFw9ALuZJ/L/FSD+fcKsv9Un9
         pzqOdY/ZB+1OQKKxW1OmdMTUe+7e6wpUgGMQMTpPFHKqDqbXDKeqFXaMSx2YGUdB7qG2
         H2TA==
X-Gm-Message-State: AO0yUKWUd176tCKRR2AL5/EcGE+kJkcV4eDLsun19nUo+5EhdP2GqL/O
	zvBkUyJMi0we/OTqIsXBunWneQ==
X-Google-Smtp-Source: AK7set9vaBJ66g6UguRmoCg+W/c5xoX2ncpKKizqhzVQTNxRRPjI28ldT/Qd72DkfMuD+oeRzU08xA==
X-Received: by 2002:a17:906:3484:b0:884:26ec:388b with SMTP id g4-20020a170906348400b0088426ec388bmr5272034ejb.39.1675331431018;
        Thu, 02 Feb 2023 01:50:31 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906315b00b0088e682e3a4csm1593572eje.185.2023.02.02.01.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 01:50:30 -0800 (PST)
Date: Thu, 2 Feb 2023 11:50:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone*00: disable openssl in kmod
Message-ID: <Y9uHZNV3+yocmsQa@nuoska>
References: <20230202094204.3111621-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202094204.3111621-1-ross.burton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:50:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4347

Hi,

On Thu, Feb 02, 2023 at 09:42:04AM +0000, Ross Burton wrote:
> The initramfs needs to be very small, but since oe-core d6a62e kmod has
> enabled OpenSSL support which doubles the size of the initramfs,
> resulting in boot failures.

For really small size, why not use busybox insmod, modprobe, rmmod
instead of kmod?

Is is really ok for machine config to change kmod PACKAGECONFIG?
I would rather use bbappend for this.

Cheers,

-Mikko

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-bsp/conf/machine/corstone500.conf         | 3 +++
>  meta-arm-bsp/conf/machine/include/corstone1000.inc | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
> index dfc850db..12634a3b 100644
> --- a/meta-arm-bsp/conf/machine/corstone500.conf
> +++ b/meta-arm-bsp/conf/machine/corstone500.conf
> @@ -43,3 +43,6 @@ FVP_DATA ?= "css.cluster.cpu0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic.nopt@
>  FVP_CONSOLE ?= "terminal_0"
>  FVP_TERMINALS[css.terminal_0] ?= "console"
>  FVP_TERMINALS[css.terminal_1] ?= ""
> +
> +# Disable openssl in kmod to shink the initramfs size
> +PACKAGECONFIG:remove:pn-kmod = "openssl"
> diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> index d5d6418d..2869d78c 100644
> --- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
> +++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
> @@ -73,3 +73,6 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0"
>  WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
>  
>  WKS_FILE ?= "corstone1000-image.corstone1000.wks"
> +
> +# Disable openssl in kmod to shink the initramfs size
> +PACKAGECONFIG:remove:pn-kmod = "openssl"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4346): https://lists.yoctoproject.org/g/meta-arm/message/4346
> Mute This Topic: https://lists.yoctoproject.org/mt/96697016/7159507
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


