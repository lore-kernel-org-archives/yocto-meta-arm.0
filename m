Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F1C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 15:38:14 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.21586.1671637093939550206
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 07:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iTv4LFcj;
 spf=pass (domain: linaro.org, ip: 209.85.217.54, mailfrom: sumit.garg@linaro.org)
Received: by mail-vs1-f54.google.com with SMTP id k11so15072772vsr.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qftOFH7jcF8XeVzOzMtGSH8HkJBvALwzjXsAK0Eh+0o=;
        b=iTv4LFcjiymSJs+5eURn5+Qt3+4PJTRhERIHkX5oeurOJmxhG7B583Izy6C+DQPUrV
         5KgM4QQKbAWpWXhgWL/tZr5LM78PiRC5UEVnTq+KGOkkqfQBcl99bZk6qzWre/7j1QSH
         nfvsAoVuNbuqCmYqat11oLT0u0chSVO4SLY9aNGjr6vdxpQYSolVfAQyCILtFW76TCiI
         GjNYQR6Rj7tsqL/cRsJTTd7N7C05KJmwUMZQhl7UpP+AeGLLsSof3CUtxL1Cl/uXd/Bg
         XzEcBzgMqjniftP1BrO0dNzcsY8nYObS7SeGbwc+mFOOFvY9o5rDze+jcWvUk1NVjbyP
         TT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qftOFH7jcF8XeVzOzMtGSH8HkJBvALwzjXsAK0Eh+0o=;
        b=pqWA5NnFtWRETtKh2hKfhfy1Xd8047i9JDinuUGBfZB+GkqHP8ak1CA9EBRtiOGlPA
         6llfjX8RJ06fG8bWWTyh2zDGiBqvrBjPn3nqd324eQ38PcHGC4EFSUD7tMP+pKhFtJHI
         +mcmehknjarPKQNezoPtsp2XGhvjqfWqPko/c2UcFFNOwPKsTxp71UdAPI3ni9Q721pK
         xy5IIFhYytwkqV91zH1K9iJ0yK1N9KUbTfIwprPjUmM6TjU+vY9FRwQEPgbWmIzE24Fs
         nML7PY8cjIDF1/h0S3Cqq690q3Cmtd79XWL7D1GT998L2UNXXjWSlN88eBvJ8/vJNq39
         HYDQ==
X-Gm-Message-State: AFqh2kqAHQwkCzeNZWhkuHgwyQc96Sm11onkNlDPPkPz8UPoDgvP6dmc
	g0CdJwCe1ngpKJ/Wo959pZMlkQ0mg0b8pnHMXSzOQg==
X-Google-Smtp-Source: AMrXdXvuN1hhLuBhgzTBTFrpi/CypJWlmfAeeWFJo3iHVHpyeyN4wGzVo0lxAkVw29SMX4dDGV7rJHANG2fUKutdl9M=
X-Received: by 2002:a05:6102:2929:b0:3b1:4aad:9c42 with SMTP id
 cz41-20020a056102292900b003b14aad9c42mr266958vsb.41.1671637092978; Wed, 21
 Dec 2022 07:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20221221143942.15196-1-emekcan.aras@arm.com> <20221221143942.15196-6-emekcan.aras@arm.com>
In-Reply-To: <20221221143942.15196-6-emekcan.aras@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 21 Dec 2022 21:07:59 +0530
Message-ID: <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os version
To: emekcan.aras@arm.com
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, Jon.Mason@arm.com, 
	nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 15:38:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4221

On Wed, 21 Dec 2022 at 20:10, <emekcan.aras@arm.com> wrote:
>
> From: Emekcan Aras <emekcan.aras@arm.com>
>
> There is a new optee version 3.19. Currently, qemuarm-secureboot cannot boot
> optee 3.19 out-of-the-box.

This sounds strange since Qemu is regularly tested in OP-TEE build CI
as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can
you share details of the boot error you are observing?

[1] https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f96026824ec242ff52

-Sumit

> This pins optee-os version to 3.18 for
> qemuarm-secureboot.
>
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> ---
>  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
> index f08b84fe..db02dc68 100644
> --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>
>  MACHINE_FEATURES += "optee-ftpm"
> +
> +PREFERRED_VERSION_optee-os ?= "3.18.%"
> +
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index 55c4cab4..7277817d 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
>
>  MACHINE_FEATURES += "optee-ftpm"
> +
> +PREFERRED_VERSION_optee-os ?= "3.18.%"
> +
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4220): https://lists.yoctoproject.org/g/meta-arm/message/4220
> Mute This Topic: https://lists.yoctoproject.org/mt/95807186/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

