Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD05BC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 05:08:36 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.5711.1643951315668541834
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 21:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FgQgQv3t;
 spf=pass (domain: linaro.org, ip: 209.85.208.169,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id o17so6993122ljp.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TgV4Qd/sZT9DHIhh8SuXnPbEsDCRiK02+nr+fsJGSs=;
        b=FgQgQv3t9vzqgUr3FgqrbNQ86SPJL8G3hgYSGkbYFGeqFfhx0/IGOLlzXzrhB4Woga
         6OinSJ+eTAB3CrK0gVZNa68bNgLoMIKwbXORaKBU5979xALJNvM8QUns21JAPPP68bIY
         sAy3e9XR7z1oVp4xUGf6lYqyLktQIzApJJlItT+u8Ge/GlsDZ1lbAccAdkOSIagys4r8
         wj5zyO2fXYMDi2dcTvAJI08cAvd66yLxtXry1yZtl2Tc4mVtiNgDiWZ0vQEbiC8FMFRb
         kDuILTpG2fX5N42mWWrYS/7Z8b8eADEQ3BfTHNK7DzWZ+jMVblwcXFEA25PylmaJs2+1
         G2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TgV4Qd/sZT9DHIhh8SuXnPbEsDCRiK02+nr+fsJGSs=;
        b=CFrrTBV28oEghzZxNFVy7WlDyiD0peyWPE1q8P4PInFqgnt+QmV5uDubFoI40xnZWv
         ibIrWa3oDwNp/v69meHHzbb3cYKKnnfQ9Je/pq78D7IQREbr2S712U8JjemEXehrcihh
         PvAmjzLTp0k0NIc5onb3S2iP8OrOydKS54X/cFpfSbSJXsLiwMkgy7Blk0MYsOxCeqNT
         jE1fGtQ4boq/turpvW70/IhNxaRvvCkwgT5ClPkvvLQ6MhGf0b47hSKVCgwa1waMakwn
         Ceeu0YF11IDw9tevehfhIiQ99ozjbAbJfvqiL27z0JQ//lnRRZW0c3x+aTyNVIT0CTid
         Nnzw==
X-Gm-Message-State: AOAM531Fyfjn1sSx1If+3eLBcu98LQo73knaHV+QJOlPuQgjPBaCAzOK
	sFEfdZvHNKetrFL9iBTq0YtmUSujy+kFsUQ9gprzAQ==
X-Google-Smtp-Source: 
 ABdhPJwM7W+LjOKmubz2nxmZqU2iHWTrutT66JkDZACUcOl7uo5owll8E36eHo+ULe0x7+De0TIQ70tkDjuP7Jhj0fY=
X-Received: by 2002:a2e:a7c4:: with SMTP id x4mr797339ljp.133.1643951313690;
 Thu, 03 Feb 2022 21:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20220203165135.26872-1-ben.horgan@arm.com>
In-Reply-To: <20220203165135.26872-1-ben.horgan@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 4 Feb 2022 10:38:21 +0530
Message-ID: 
 <CAFA6WYPT7+dKditfukA-R4kkAMeUCGd1Z=zbhs__q6=f89bXZA@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] arm-bsp/optee-test: tc: Limit xtest to a single
 thread
To: Ben Horgan <ben.horgan@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Feb 2022 05:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2949

On Thu, 3 Feb 2022 at 22:21, Ben Horgan <ben.horgan@arm.com> wrote:
>
> When multiple threads are allowed xtest will fail and
> leave the system in a bad state after repeated runs.

Interesting failure. Is it reproducible for total compute platform
only? BTW, if you observe this as a generic problem then the best
place to seek support is to raise an OP-TEE issue here [1].

[1] https://github.com/OP-TEE/optee_os/issues

-Sumit

>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Change-Id: I16f07df1a362540560975deaa5a291a68c332bfb
> ---
>  ...xtest-Limit-tests-to-a-single-thread.patch | 55 +++++++++++++++++++
>  .../recipes-security/optee/optee-test-tc.inc  |  7 ++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch
>
> diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch b/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch
> new file mode 100644
> index 0000000..370a81c
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch
> @@ -0,0 +1,55 @@
> +From 73bef38c5697cd6bd3ddbe9046681087f4f6454e Mon Sep 17 00:00:00 2001
> +From: Ben Horgan <ben.horgan@arm.com>
> +Date: Thu, 27 Jan 2022 10:33:04 +0000
> +Subject: [PATCH] xtest: Limit tests to a single thread
> +
> +Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> +Upstream-Status: Inappropriate [Workaround for intermittent failures]
> +---
> + host/xtest/regression_1000.c | 2 +-
> + host/xtest/regression_2000.c | 2 +-
> + host/xtest/regression_6000.c | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
> +index 9ee9d02..82d1def 100644
> +--- a/host/xtest/regression_1000.c
> ++++ b/host/xtest/regression_1000.c
> +@@ -1080,7 +1080,7 @@ static void *test_1013_thread(void *arg)
> +       return NULL;
> + }
> +
> +-#define NUM_THREADS 3
> ++#define NUM_THREADS 1
> +
> + static void xtest_tee_test_1013_single(ADBG_Case_t *c, double *mean_concurrency,
> +                                      const TEEC_UUID *uuid)
> +diff --git a/host/xtest/regression_2000.c b/host/xtest/regression_2000.c
> +index 0591a42..a9f4b95 100644
> +--- a/host/xtest/regression_2000.c
> ++++ b/host/xtest/regression_2000.c
> +@@ -499,7 +499,7 @@ out:
> +       return NULL;
> + }
> +
> +-#define NUM_THREADS   3
> ++#define NUM_THREADS   1
> +
> + static void xtest_tee_test_2002(ADBG_Case_t *c)
> + {
> +diff --git a/host/xtest/regression_6000.c b/host/xtest/regression_6000.c
> +index ca1c254..d67ea7f 100644
> +--- a/host/xtest/regression_6000.c
> ++++ b/host/xtest/regression_6000.c
> +@@ -1568,7 +1568,7 @@ exit:
> + }
> +
> +
> +-#define NUM_THREADS 4
> ++#define NUM_THREADS 1
> + static void xtest_tee_test_6016_loop(ADBG_Case_t *c, uint32_t storage_id)
> + {
> +       struct test_6016_thread_arg arg[NUM_THREADS] = { };
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
> index 62fa0a0..af73675 100644
> --- a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
> +++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
> @@ -1,3 +1,8 @@
> -# TC0 specific configuration
> +# TC specific configuration
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-test/tc:"
> +SRC_URI:append:tc = " \
> +    file://0001-xtest-Limit-tests-to-a-single-thread.patch \
> +    "
>
>  COMPATIBLE_MACHINE = "(tc?)"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2946): https://lists.yoctoproject.org/g/meta-arm/message/2946
> Mute This Topic: https://lists.yoctoproject.org/mt/88887066/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

