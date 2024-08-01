Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302DBC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:12:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.70926.1722525167576382853
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Aug 2024 08:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=F+fyIrUF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1d6f47112so447292585a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 01 Aug 2024 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1722525166; x=1723129966; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eiaa+Nq/zRyktXTAtKugavNU8aSkIjiI3KZPNza2p+A=;
        b=F+fyIrUFCvV5i0+Fx139n9DbaLEPu6vrw50lxQHGEfO6rOuabaXePhSUu4H9NAG397
         99q4silZcdW1AgO41kknEanFDvNsxujKI9n7U0EvOKEuq90G+lMbeabCWopUKaom5//Y
         OFWRMjX7L4psa5M+S/C/U6ksguiqX9mHb3JZSo503aXlCq4PzcwIATkD4+Wqu3Yt4lP3
         EjdIhJuZl5kS0j1g5HD07Y1aMFRloXLzspRrBhf7xOv0EfZYbb2bFE69v5faBWQPzHcP
         obfbFLe23og4v8W5DErBinR+lD86ipu8kbf1hbBpCW5PCTdpL2JdhLiTCfzMxzs+5VST
         7EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525166; x=1723129966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eiaa+Nq/zRyktXTAtKugavNU8aSkIjiI3KZPNza2p+A=;
        b=iHUMmwGhUItod5hSDxDAS0+YOlvQgbPzMN8q+dErisjc/zox9sGGprcR6AVPn96hY5
         tIcoD5mDIQKHDmOXXdcTXYqR6Hr9Wgsmk1lXjgKZft6QTwVAwFOE+yIxO83V56LxuaYU
         5MwxGu0k1YKYRSfBlvLnUSOTHpcBCPzu10Mee9RmtYgmQPmDmWTItXGoIC1JIJKdOECO
         YLri6pQE55MLCg//D+TsmSHBmfPOPDI7UFp3SJLOQeqKwHNtvUOHF3DaOkhwJBM3dWfA
         I6U9kW2zqbh86iPTV3AopnYreDxdsIcZnmXLAUI3g1gMG8/V8VnoqF8wJIsq3Tr85p+/
         baZw==
X-Gm-Message-State: AOJu0Ywf9fpn9AVBuulRdkZyJYPe82twxM30k2Xy/KXHg/G7bnPL/OeM
	9pGVR3nqxSFMGCVyb0yvwgiS7xJT+3J2uKosFrhi3h4Swbg3CBWn2HCNj6810A==
X-Google-Smtp-Source: AGHT+IE7KpNJpVY+7arI2pY+SV4mOZ9bI8oxygm4wK6TFWyEXUN246I0l5G8H4K2gxbFQbM9fIuKZA==
X-Received: by 2002:a05:620a:290a:b0:79f:8ba:aea9 with SMTP id af79cd13be357-7a34eec9bfemr37725685a.5.1722525166361;
        Thu, 01 Aug 2024 08:12:46 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d7434246sm858801685a.89.2024.08.01.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:12:46 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:12:44 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH][master-next] optee-os: fix buildpaths QA failure on
 corstone1000
Message-ID: <Zqul7Gx37jYcgI0o@kudzu.us>
References: <20240801090558.43415-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801090558.43415-1-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Aug 2024 15:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5943

On Thu, Aug 01, 2024 at 12:05:58PM +0300, Mikko Rapeli wrote:
> Patch submitted upstream:
> 
> https://github.com/OP-TEE/optee_os/pull/6974
> 
> Fixes:
> 
> https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950159
> 
> ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: QA Issue: File /lib/firmware/tee.elf in package optee-os contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

This patch fixes the issue and CI on master-next is now green (but I
had to run this internally since my externally visible CI is behind).
However, after looking at the progress being made in https://github.com/OP-TEE/optee_os/pull/6974
It might be best to wait on the solution in there and backport that.
Given the responsiveness of J�r�me Forissier and yourself, I expect it
should happen in the next few hours.

Thanks,
Jon

> ---
>  ...rnel-link.mk-remove-all-debug-flags-.patch | 46 +++++++++++++++++++
>  .../recipes-security/optee/optee-os_4.2.0.bb  |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch b/meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch
> new file mode 100644
> index 00000000..45045490
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os/0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch
> @@ -0,0 +1,46 @@
> +From 79f9b7f933b16dcb04710a9314a92a3d10561f53 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Thu, 1 Aug 2024 09:30:17 +0100
> +Subject: [PATCH] core/arch/arm/kernel/link.mk: remove all debug flags from
> + version.o
> +
> +Default debug flag -g3 was already getting removed from
> +version-o-cflags but on corstone1000 platform-cflags-debug-info
> +is set to -gdwarf-2 and thus debug info was included in the
> +generated version.o. This then included full absolute build
> +time path which breaks "buildpaths" yocto QA check since the path
> +is also in final tee.elf binary. Remove all debug flags from
> +version-o-cflags as a fix/workaround.
> +
> +Fixes yocto build reproducibility issues on corstone1000:
> +
> +https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950196
> +
> +Cc: Jon Mason <jon.mason@arm.com>
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +---
> + core/arch/arm/kernel/link.mk | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/6974]
> +
> +diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
> +index 49e9f4fa1..85fcf0e86 100644
> +--- a/core/arch/arm/kernel/link.mk
> ++++ b/core/arch/arm/kernel/link.mk
> +@@ -150,8 +150,10 @@ define update-buildcount
> + 	fi
> + endef
> + 
> +-# filter-out to workaround objdump warning
> +-version-o-cflags = $(filter-out -g3,$(core-platform-cflags) \
> ++# filter-out to workaround objdump warning and to
> ++# remove build time paths
> ++version-o-cflags = $(filter-out \
> ++	$(platform-cflags-debug-info),$(core-platform-cflags) \
> + 			$(platform-cflags) $(cflagscore))
> + # SOURCE_DATE_EPOCH defined for reproducible builds
> + ifneq ($(SOURCE_DATE_EPOCH),)
> +-- 
> +2.34.1
> +
> diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
> index cee024af..c309efa7 100644
> --- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
> @@ -9,4 +9,5 @@ SRC_URI += " \
>      file://0003-optee-enable-clang-support.patch \
>      file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
>      file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
> +    file://0001-core-arch-arm-kernel-link.mk-remove-all-debug-flags-.patch \
>  "
> -- 
> 2.34.1
> 
> 

