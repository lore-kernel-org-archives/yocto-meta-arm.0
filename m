Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D41C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 14:42:07 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.54807.1658328118786587873
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 07:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=t+d/DfLC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id y18so2361438qvo.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FK9dXg6+P6ojvVHOQLXyWYb5JOHH95e+RAZHTkNKss=;
        b=t+d/DfLCK8bpM8XMU03L16SBcq+hwEOoqzt2fsODHsISOMeyqz7+6Nr8XWJLqzJM4b
         0WAj9S1L6UwxDuNXw7fKE3GAuy08X3mupS1moa8Afmx6EMNKtfs0nYK9Ksp+IsWJYCMe
         xfRxxFU9EeOlvyY+nl3KNrqH96zmKDJLR8PlTxcNO6on0UhrWjtHuhGbmMLorskw8v/d
         L6QKJ2fQAJLyWpxGnEz5ns4iat/o9pN+g83hnl/zOlGmgB76dAA4NRL1prdW7pjJDdXq
         3zOHgkg6Ceamryu7gOqP99R3Cd4rVWqIANDvMG4QJjyDYL6WPUcNGAPJZUCU9Sr+lB4z
         Lv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FK9dXg6+P6ojvVHOQLXyWYb5JOHH95e+RAZHTkNKss=;
        b=wUCaXh5cX1O511peTOjPQe2QbcqtUqjof2dND/PppoQCc8o4h07j+vPS7gWf9DQMBU
         FVxIfbu+AMlz3EmRZwRkxIWwsZVQaJMKYTdIM29Qtzb3g7O6pfvkskGUiK6H5dy5XQwx
         C7A9dmLIsfbGpsLt8dBKd8L/qXqVyUbv80pErNPkQ2qJ0ta6/LoMcxGVBcaT6WJ2G7es
         CAWUbcxXcLnt1M1WxlzOtBeLrtsCRZ7gs4HH+zIg35p+azAzyGU6Y7KH6dLYBEU8i2rM
         57pfnzXsBPCRQn0xPQwKrbFTcktz9omBH2Ek1fdrvfLvfqopb8pJWsIEQtilNUgbOnTR
         f86A==
X-Gm-Message-State: AJIora+OVNMQgznYzrN+rPwdbpUg/XltoGy8Yp9kNLGH+hfNSHhJrCxh
	1rxw6xfJcBg+mTrLvWEbygi2WUogmCC0yw==
X-Google-Smtp-Source: 
 AGRyM1sar7mJtzJ56RiATS3vyRvVLWm1KBOAdLEAbs9lgiXQOqjU37fUV4U4icpB9lCEmjRumox3Eg==
X-Received: by 2002:ad4:5d41:0:b0:473:f990:dad4 with SMTP id
 jk1-20020ad45d41000000b00473f990dad4mr6648553qvb.78.1658328117285;
        Wed, 20 Jul 2022 07:41:57 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 dm53-20020a05620a1d7500b006b4880b08a9sm17364388qkb.88.2022.07.20.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:41:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/9] CI: use apt-get instead of apt wrapper
Date: Wed, 20 Jul 2022 10:41:37 -0400
Message-Id: <165832809737.3839871.5430777280627668217.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719201353.1467716-1-ross.burton@arm.com>
References: <20220719201353.1467716-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Jul 2022 14:42:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3583

On Tue, 19 Jul 2022 21:13:45 +0100, Ross Burton wrote:
> When used in a non-interactive context, apt prints a warning:
> 
> WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
> 
> Use apt-get directly to avoid putting warnings in the logs.

Applied, thanks!

[1/9] CI: use apt-get instead of apt wrapper
      commit: 7d4ede329817288b2fc866fdd466e60e79e628b6
[2/9] CI: ignore buildpaths QA check in clang builds
      commit: 53795134de85b243a5e1bb8b74e05b51ee04058d
[3/9] arm/edk2-firmware: ignore buildpath warnings
      commit: 411519915cb2cfde80cb29ad0624be6d92789713
[4/9] arm/hafnium: ignore buildpath warnings
      commit: 04aeb9e548b1e0c9ea1c0b9fc79abb4967191618
[5/9] arm/linux-arm64-ack: fix buildpaths in the OID registry
      commit: 503d45e41aadf01ed2613b57e54a0040d25590e2
[6/9] arm/optee: ignore buildpath warnings
      commit: 6c7399be0c4cbbda98319d90d3505d0ba9a587c5
[7/9] arm/trusted-firmware-a: ignore buildpath warnings
      commit: ee0a824a875347e64be554c1578f11e6c2175cc4
[8/9] arm/trusted-firmware-m: ignore buildpath warnings
      commit: eac17923931934a46dc10cb9b887437eb0b6f9f6
[9/9] arm/trusted-services: ignore buildpath warnings
      commit: d9d1399b37160a77176cb27982e234adac6cf099

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

