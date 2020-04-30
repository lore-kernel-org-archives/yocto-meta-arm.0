Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.3475.1588237609027795965
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 02:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QLS9Ll89;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id u127so1012129wmg.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nKQDboPitNltE9W55rPr0b5EYaC4y+8e12oShtmo0f0=;
        b=QLS9Ll89AUKiLM9ol7Czeosd/klhtPErOt246t9iEi7dRUDLBbYaX4CBp7y0EYdN6w
         062U3iQjDbqQgjR8aivvXk0QyFbjLiyJ5RxD8BWMEKaReL2bojTtWevfde6WX0Voa4GM
         YWWMrI3a6/RW1pMx1deStvGLmqKS1t2l4Qjmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nKQDboPitNltE9W55rPr0b5EYaC4y+8e12oShtmo0f0=;
        b=UPFamisjzYx5NjTOjkLm+QBa6WGEi1oLC3OPf0QW7og1SAwYGHH1vcjBvpVhIStlg6
         sF9e9G7Wr1S59jNq0qQQdF55rnElvF4t60Ybp9tqSERiqjYutsJ+/giBnVbM2h1Chpaj
         yrkftDNYcnFIBFgb95iGEIrTU04A6b5q0XhkVITPte5vqZgmmaYZiZWGpFa430riNtzt
         2RO/+3zkSWkptMMNG2nddxjqd+g+jjj8hsbiHZIWrKcRe7YI/zuBXT1W+X5RsoLB6i7Q
         LYeTRtmBdLXn2Ev48vciO6xVfJwfSmlt255jlx9nnWyZRIPCmsoZ/AMkaAiIUVMtVpUl
         BJWA==
X-Gm-Message-State: AGi0PubJShBCtEjIN1yWCZtrxGGBt7lUQMSuWXhHCKO44+wuDIT30T+/
	JsJhBMhn//+Fl0LzimlAjZ1YGzTLjI8=
X-Google-Smtp-Source: APiQypI49MR8+dR1MYBC8l+6+wPFYtIDAvP0IxK1BdijIGabUhrXXlj/yViffcHcEzPjtaYf90o5Ew==
X-Received: by 2002:a1c:384:: with SMTP id 126mr1881772wmd.58.1588237607205;
        Thu, 30 Apr 2020 02:06:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w83sm11812586wmb.37.2020.04.30.02.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:06:46 -0700 (PDT)
Message-ID: <866cdd55986bc7fb389efe17d872889df325372b.camel@linuxfoundation.org>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Date: Thu, 30 Apr 2020 10:06:44 +0100
In-Reply-To: <20200430081700.548-1-vineeth.raveendran@arm.com>
References: <20200430081700.548-1-vineeth.raveendran@arm.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 09:17 +0100, Vineeth Raveendran wrote:
> Make following machines compatible with dunfell:
>     - foundation-armv8
>     - fvp-base
>     - juno
> 
> Major changes include supporting kernel version 5.4 and U-BOOT version v2020
> 
> Change-Id: Ia59ac874de4e4c4ea02c7a4f976e39a9b6996f75
> Issue-Id: SCM-833
> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
> ---
>  meta-arm-bsp/conf/layer.conf                        |  3 +++
>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc        |  6 ++++--
>  .../files/fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++++++++++
>  .../recipes-bsp/u-boot/u-boot_2020.%.bbappend       | 11 +++++++++++
>  .../recipes-kernel/linux/linux-yocto_5.4.bbappend   |  3 +++
>  5 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 1a54ddc..5257195 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
>  LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> +
> +# Place holder for yocto version compatibility
> +OVERRIDES_append = ":${LAYERSERIES_CORENAMES}"

Generally we've advised different branches to make it clear to people
which layers are compatible with which releases. I appreciate its
"easier" to have one layer fits all to maintain, I'm less sure its
clear for users.

Whilst I can see why you want to do add to overrides like this, I'm not
sure its a great idea. This will affect every layer in the combined
stack, not just yours. OVERRIDES are fairly dangerous things and need
careful namespacing. Our release names are designed to be distinctive
but after bad experiences we generally recommend additional overrides
be carefully namespaced, e.g. "class-XXXX", "pn-XXXX" since we know
what weird issues these can cause.

Anyhow, there is a bug here since LAYERSERIES_CORENAMES can have
multiple values, the clue being the plural name, e.g. it did here for a
while:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/layer.conf?id=8702b79a3b90a06524098e8b2a10b6e6d287166a

Cheers,

Richard

