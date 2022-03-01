Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDF5C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:22:28 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.10192.1646151746969419545
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=B2Mey/wB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id v3so10361119qta.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EgPaGDnTWCmT/2nz1ZPvKVrPDkIGtZkf2v84iKcDdi0=;
        b=B2Mey/wBRCpCMwifMV6WgiGo0m0Vo3esbF3aguKGpqojkZkclsj16ENa4D7KEiVAdK
         DNQYhMIY0PsGNbKdTHIisWBySpuI2yzn2eP/1HBjoi4VNE0mR6vXvEvsqoxIVYDkKSV4
         RB9fu8YY8P9Gv8KH8vN7HbTIX31W/6dGg1ZMIfCXFDSMi4xLe/aRSvxj3g00cyyQVjVu
         X1bbDQtl0XWyHIqfnCGQljjTYnl0nRg6f1J9ffn2tbkIVFgPkjpu/CG+RaReK/oWsYCK
         fCssxEjIXTiYdq3vx+vEPupZir0QqeXKS7zVBQ6yEqBe3lkxOo4Png0jXv9sKVARmTUV
         wsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EgPaGDnTWCmT/2nz1ZPvKVrPDkIGtZkf2v84iKcDdi0=;
        b=7nQz0r0k4zWfEBFZjKcIt6TgwtWYxAUk6nVyQ2h6ZSkPdsRWZ/3aaRyzN0c99qdLKJ
         w6R/PsiM6RxdyJvAMli9rx1hZFL7J/YxgV+/CbiDV+SeZPN4TuzDUfgR8LhiFlaJU2fd
         bj4cKFMdBkLHo9xiApq+R0PJR3av/c9wsjXSXlj8lhubNfe0EQv/8Dzx07c9uC1ZRYBD
         u9LkZD6ifyuLuPL/Dx8lV57N5KMVe9lStQn+whT7HrLGWR3tQJip5kAy//8u2Mn36z7F
         RfQFeHDk4IXbimY6nZBZRQb12F+hxneRTbUroWylmMUBijWlZ7WEZW8h8Z89opHBEZhM
         ef9w==
X-Gm-Message-State: AOAM531/kzfr5jq9syN4Iv2N7qMzNIrhqbfwG4VsUb4V3pg1dP5EkG+P
	SDZit3wLPW66IkEZjMRxPayPRvWL9a8zUg==
X-Google-Smtp-Source: 
 ABdhPJxebVHaiVNjJygmcHmf4IpNwWQkzDHMmzUfVLd+IJIGvaz3qysJxaIFCWCrYPCjUFa2QjpTMw==
X-Received: by 2002:a05:622a:1a17:b0:2df:ec01:57b with SMTP id
 f23-20020a05622a1a1700b002dfec01057bmr15053187qtb.519.1646151745981;
        Tue, 01 Mar 2022 08:22:25 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:21a7:7bac:7802:e911])
        by smtp.gmail.com with ESMTPSA id
 m3-20020ac85b03000000b002dc93e6d319sm9425626qtw.65.2022.03.01.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:22:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] Revert "CI: apply in-flight patches to fix
 python3-cryptography"
Date: Tue,  1 Mar 2022 11:22:05 -0500
Message-Id: <164615172479.2923434.3638187544240333587.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301140504.1785064-1-ross.burton@arm.com>
References: <20220301140504.1785064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3087

On Tue, 1 Mar 2022 14:05:03 +0000, Ross Burton wrote:
> The patches were merged in meta-oe d605093bc.
> 
> This reverts commit d97f9d322e0e09a847f9697459e969cc9c43345c.

Applied, thanks!

[1/2] Revert "CI: apply in-flight patches to fix python3-cryptography"
      commit: 50d820d0371a5b30f7dcf0c3d9b02a981677c18f
[2/2] CI: fix python3-dtc installation
      commit: fd34e9bb75fccd6abc1dcbda0691a9951484e59a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

