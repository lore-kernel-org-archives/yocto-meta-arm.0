Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAA8C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 05:10:34 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.6702.1686633025938127658
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 22:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=wj9i9i1j;
 spf=pass (domain: linaro.org, ip: 209.85.222.53, mailfrom: sumit.garg@linaro.org)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7870821d9a1so414168241.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 22:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686633025; x=1689225025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GKH4ucS0vSUU6FLG7tiOxLk6gvpkcpTWJJywtDawHE=;
        b=wj9i9i1jTjezXWyK7PhS3OjefxZfo05fbDoz6gkdDsCVMdsBSvPFbi1F6Kz9PTRRXC
         YOz6dntgmoyhbbgieeiGfFIfYJmGBYNRXQj/j8+BOe0vxdGWNQooggZvbDz/yWeeKxNq
         CvoBJwRsosohnR7UjQgSzTFzCvByQfPMJh7gJP7yyLpSQ3dOp5aitPWv++QwM1A7i/yv
         GACG+NVMl3AXvaQAzulq6skmWu5D2jpn9LbS4pB1GnEgRpZ3T5iSP6ENb58I89Vj8/qB
         DQjlpRpxwLMIWHCo5OBF3mRq4XZ+Kq0sSUtq6YMg6hn4cmmFtv9rVZZMeFYyiuFWohdW
         6XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686633025; x=1689225025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GKH4ucS0vSUU6FLG7tiOxLk6gvpkcpTWJJywtDawHE=;
        b=LgAlQpTIJxG+wlMYPKpJUEvifwub6do7ixVeD9FJ37LWlHTRLhlDuhG3CsJwE6kv/p
         wlVm4YNC4EJqYnSJeotQzyfCA6Q3LkRPnEx+m+vYjY9ajbSq/tEhzcGY8zPYu5NhRH67
         XAypYpdW7Vqihm1439EeeMOpLJ1EHkXUsc8H2VwCfOgIizGOxpgccOSPwY7dyuGQouyb
         gsuwWYZ5gpugg25DYZB5zRYhCtLyH30pG8ws+dCviH8pImcvUdqBDMtLQfmeTlfhuOT9
         ZQmCfsB3Y53fAaYseugqMY0QOXWALGDferO0ISoEIssHA5go0x2kT2KDIfLvqyH2vfQC
         X7EA==
X-Gm-Message-State: AC+VfDwhnEQFIcOplC/+Of5EHjg6xrfu+gfbFeNzoPWhxE3o1o6STmf1
	yICEiJVARtJDmnVWQoM7jBQKPnI0WCmAFkeFh5KyXg==
X-Google-Smtp-Source: ACHHUZ7pZ2QBE7Ux17z/psGD4xBes4p5IGTc/IO5RY2e4k9mj2SsoCVbbB8KHuBpdvRge3CkxacuHgGtUoI1tkHsX9I=
X-Received: by 2002:a05:6102:4584:b0:439:55ed:226c with SMTP id
 dx4-20020a056102458400b0043955ed226cmr5096963vsb.14.1686633024987; Mon, 12
 Jun 2023 22:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230612145659.934478-1-ross.burton@arm.com> <20230612145659.934478-3-ross.burton@arm.com>
In-Reply-To: <20230612145659.934478-3-ross.burton@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 13 Jun 2023 10:40:13 +0530
Message-ID: <CAFA6WYMfzst+gsYAYKumKVU1zrVxpKL04w_P0+mzoQYC2FR_TQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm-toolchain/external-arm: remove
 -fcanon-prefix-map from DEBUG_PREFIX_MAP
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 05:10:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4764

On Mon, 12 Jun 2023 at 20:27, Ross Burton <ross.burton@arm.com> wrote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> The binaryh Arm compiler is based on GCC 12. Remove this GCC 13-specific
> option until the next release.
>

We have to keep this GCC 13 flag removed by default since we support
multiple versions of Arm binary toolchain GCC 8 onwards.

-Sumit

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 71fac597..61a9c0a7 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -4,6 +4,9 @@
>
>  EXTERNAL_TOOLCHAIN ?= "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
>
> +# oe-core passes this by default because it assumes GCC 13. This can be removed when Arm GCC is 13.1+.
> +DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
> +
>  TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
>  PATH =. "${TOOLCHAIN_PATH_ADD}"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4760): https://lists.yoctoproject.org/g/meta-arm/message/4760
> Mute This Topic: https://lists.yoctoproject.org/mt/99484944/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

