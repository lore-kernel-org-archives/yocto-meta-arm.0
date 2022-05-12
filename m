Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B09EC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 07:20:41 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.1420.1652340032874324569
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 00:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WrO+zDzA;
 spf=pass (domain: linaro.org, ip: 209.85.216.49,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f49.google.com with SMTP id fv2so4353509pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 00:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EILi0Fsw8mJfW828PFlqIM/nKzALBpo+EGCZRwFp2MY=;
        b=WrO+zDzA/s1hoTjYd35ZURi3lkhDhnKijJLsx5jBGk3D85x+1zcsSSNV0Tr9b2ve8i
         m2+WhKlFSmGMFru3zKij7AGoIxeg73fdP/yqWpr7kROIZy55uRmXGD6FertbRTjzKilS
         vXmQcbDvjmDPKy+K3Q6y1WM0t+DrIFed5e6iN01sKo8MT+KQB6Ze6jcqHwSabqhIqIe/
         yHK8ZoyzgqbXpqNGwPX6tJ654NQGAlearreTrgSPn06qeTfR39lTGDCCAPdYu5U4vgZ7
         dNJNmMyUoMMpU+aJr1guP7ktHTzIQ32lpQA05BBd8obSnyXiFQKUBkX3pHSHQ+eNn1TJ
         lE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EILi0Fsw8mJfW828PFlqIM/nKzALBpo+EGCZRwFp2MY=;
        b=tbs6zxK/Zdv4t+5LWrnaeNNGoU13BUGyHVvX5IQbIG69pAwTmCk8w5CoyJraFQPbEs
         CSYzegSKqBKaBTaQRhcKG70C+HFeRanhzTGPVoNK+CtsFr9lsdtx6/6vQxYNX0cbiJtk
         Ep4zfj8oDBXVMHWUP9RklunJO4WAwzx0GKB1h0DMJXCMi8bAp50fI74972z8npLrZ1va
         gk3fzraR9POvTRU2uCSXSewqAVMdwy0EiQC5bOzHrK/3n1XmVmcbZvGym5WuAJhwlgSN
         ccnnE+m8o61cwGPpa2tcsTklDBjAcLEP4gyLqRucT0vgEVZzx1K/4SFKDYbiCUDUZ7l+
         iVBw==
X-Gm-Message-State: AOAM532r6V9E/lZVt5MaYyXnzhD5K7vh5lMCAPJMFvdwGf4hYIRN8dks
	/+DYwKtDOpMbTD0Yn0VUkbT08d2CW+Pbgc9ma7sTIg==
X-Google-Smtp-Source: 
 ABdhPJz/0dABVU6bgNRT9id95SisFJMt/3dHaTlCXPlnhrCKT+NSvLtCg6am/N5AFPQMORPZMSfqBnaQChaUQBb1a9k=
X-Received: by 2002:a17:902:9f96:b0:15d:1ee7:4231 with SMTP id
 g22-20020a1709029f9600b0015d1ee74231mr28525682plq.131.1652340032291; Thu, 12
 May 2022 00:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220511152401.10735-1-jon.mason@arm.com>
In-Reply-To: <20220511152401.10735-1-jon.mason@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 12 May 2022 12:50:20 +0530
Message-ID: 
 <CAFA6WYP6M5iFaTsUtWYKS7jO08TzGWVr6+0x4fLhS5QnnQrLGw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] CI: make qemuarm-secureboot builds more
 thorough
To: Jon Mason <jon.mason@arm.com>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 May 2022 07:20:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3389

+ Abdellatif (author of optee-spdevkit recipe), Khem

Hi Jon,

On Wed, 11 May 2022 at 20:54, Jon Mason <jon.mason@arm.com> wrote:
>
> Build all the things that qemuarm64-secureboot builds, removing those
> that fail to compile (e.g., optee-spdevkit).

optee-spdevkit recipe seems to be based on non-upstream OP-TEE tree:

# spdevkit isn't yet merged to master
SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
PV = "3.10+git${SRCPV}"

Abdellatif,

Are you aware of any plans to support FFA based secure partitions on 32-bit Arm?

>  Unfortunately, clang
> doesn't work at all.
>

This looks related to regression reported by Khem here [1].

[1] https://lists.yoctoproject.org/g/meta-arm/topic/91003714#3373

-Sumit

> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .gitlab-ci.yml            | 3 ++-
>  ci/qemuarm-secureboot.yml | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 40e00fc0..bc9f0801 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -191,7 +191,8 @@ qemuarm-secureboot:
>    extends: .build
>    parallel:
>      matrix:
> -      - TESTING: testimage
> +      - TCLIBC: [glibc, musl]
> +        TESTING: testimage
>
>  qemuarm:
>    extends: .build
> diff --git a/ci/qemuarm-secureboot.yml b/ci/qemuarm-secureboot.yml
> index 2fa8ef08..044661cd 100644
> --- a/ci/qemuarm-secureboot.yml
> +++ b/ci/qemuarm-secureboot.yml
> @@ -4,3 +4,9 @@ header:
>      - ci/base.yml
>
>  machine: qemuarm-secureboot
> +
> +target:
> +  - core-image-base
> +  - optee-examples
> +  - optee-test
> +  - optee-os-tadevkit
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3384): https://lists.yoctoproject.org/g/meta-arm/message/3384
> Mute This Topic: https://lists.yoctoproject.org/mt/91038263/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

