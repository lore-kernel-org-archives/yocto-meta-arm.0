Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF9CC3A59D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.5421.1650443591374216065
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 01:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=7D+JBvbK;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id y21so687679wmi.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWUkGsvuos64rueHFY03MpcH1RNPPm+gRVfjE8QXUEA=;
        b=7D+JBvbK3IMUGrG4Kg5uskl4GqzEzo7IrAxzVlUWSsyA7luHVwG9VsOWb+7cLgspbG
         6cb8n8HTbfCDEj4pP87C8jXucNVHq42Y1T6ZAiNEBPlw93kX7+8PMAEBortnJJWu5YLM
         EmU8nUXrLYSMfKTFxaOOFQIS+p+QHXtNccEwJHskh5mRKDSq6KJntbqaN2o6c7G7jCSk
         p5aGwg8ZLKpvccn28LaUOFOgn+HIgmhNCIEz/q4VYU6kn4H/cXbEo14PzzL4y3/+lIvb
         4J0ClNBKYZlQFhCAWGyhg6nX9hfiDUGvXCALs3AXqop2IZCiadjv+Om24zYX/v/d4Gsx
         3FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWUkGsvuos64rueHFY03MpcH1RNPPm+gRVfjE8QXUEA=;
        b=M0vb3eG1RYtZPFcv/yzypjwT6PKiKO/6GxasmpWNwu9Qx2N1cKM1wvpefSR4ztk86E
         jZDwTKp88rdCvgy5LmZe6gb7oQZx7jp3FsjHjkBZ1OXBiEYo8mS0Q2wlE2AkOIhg4ikr
         eAB5PiMAD5GJC0yuD+K3Qv8qeTBba0KlHJBqC+CnRMyUoycy1ojkShPKsmiH7Etnm29E
         R9REotDW1ZyAnw9tkDTGf1P7DQ53l5RXwTz9f3HW+oL7vIaiT2BLfBX34WqLXT/GNRoR
         5b5f44N8RWl/NjOCF3D00OZOxw1OHZ+9ng4pzZu5YtF7RaJsgYr8nItWInoAimVGnDka
         FxHg==
X-Gm-Message-State: AOAM5326h/pNtIqSkdJs/Cgu+dcJCk1RTcis48NJJX9+hGqSJJ0n6LXO
	B55UAdi9wsl2fXYKxedLWy9F5EXZYj/9gWhLuqhYJA==
X-Google-Smtp-Source: 
 ABdhPJxV6pQ9EFsqRzjf4VcOgPq1nMHps5TdLVCWTpjYKcWNVDgCCSzKVFx0eyFt0tffmIvs+lIcykfFONTjyCbTL2w=
X-Received: by 2002:a7b:c105:0:b0:38e:b992:a035 with SMTP id
 w5-20020a7bc105000000b0038eb992a035mr2481006wmi.106.1650443589677; Wed, 20
 Apr 2022 01:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220420054235.3727707-1-raj.khem@gmail.com>
In-Reply-To: <20220420054235.3727707-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 20 Apr 2022 09:32:58 +0100
Message-ID: 
 <CAAnfSTtwJBchUsZQRd2H8G8fZ2_SzRfu9=WHOMy2ssBOtcEDVw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] hafnium: Fix build when _Noreturn is not
 available
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3279

Missing Upstream-Status.

However, I'd prefer to understand what the actual problem is first, as
this feels like a workaround not a fix.

Ross

On Wed, 20 Apr 2022 at 06:42, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jon Mason <jon.mason@arm.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  .../0001-define-_Noreturn-if-needed.patch     | 33 +++++++++++++++++++
>  meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb   |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
>
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
> new file mode 100644
> index 0000000..b73c533
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
> @@ -0,0 +1,33 @@
> +From 0d941ba32a082023575fd0d14d52a12b7547b367 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 19 Apr 2022 22:32:56 -0700
> +Subject: [PATCH] define _Noreturn if needed
> +
> +The new _Noreturn function specifier is not recognized by the parser and shows as a syntax error:
> +
> +Fixes
> +../git/inc/hf/panic.h:13:1: error: '_Noreturn' is a C11 extension [-Werror,-Wc11-extensions]
> +noreturn void panic(const char *fmt, ...);
> +^
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + inc/hf/panic.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/inc/hf/panic.h b/inc/hf/panic.h
> +index ec864e4f..588f1193 100644
> +--- a/inc/hf/panic.h
> ++++ b/inc/hf/panic.h
> +@@ -10,4 +10,8 @@
> +
> + #include <stdnoreturn.h>
> +
> ++#ifndef _Noreturn
> ++#define _Noreturn __attribute__ ((noreturn))
> ++#endif
> ++
> + noreturn void panic(const char *fmt, ...);
> +--
> +2.36.0
> +
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> index 96e455f..a9f41b9 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> @@ -10,6 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  inherit deploy python3native pkgconfig
>
>  SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
> +           file://0001-define-_Noreturn-if-needed.patch \
>             file://host-ld.patch \
>             file://pkg-config-native.patch \
>             file://native-dtc.patch"
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3278): https://lists.yoctoproject.org/g/meta-arm/message/3278
> Mute This Topic: https://lists.yoctoproject.org/mt/90578787/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

