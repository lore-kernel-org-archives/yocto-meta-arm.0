Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C92C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 15:55:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.10394.1641484519319225001
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 07:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1JTs9ksJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id s19so2686096qtc.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 07:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BmnRzrwogHMBhLLFbgjz0wRYktSUIOIGg377n8md9eE=;
        b=1JTs9ksJ6VuPUAia+VdzCAvhZIeHQ5Tzo/E8e8lVzUWyPrkW5amvPkiTv1/6CN154Z
         f8jbvq+okPhjSuY0Baq9lgwaQRl9AvFXJ60t5O9o0e/rBZwcxHFxjTJcgEKxtWO5o4Gs
         yOE6TWLIqTFB/+RMsaP2i7PayxfXDpv5YQawmsbnUu0g4itd75rRcLAaJQ0WRV9rrOSn
         r0CFXOJvh3gcmPVT5mE3UHHUon/zr5PBOOOV8PWmfZG9rM8N1WWOSEkTb2Az6t9uxvDX
         dp5N1gp+Qx8Hk+E0UgVW4/jLWoL1pUS5ePFsVaNSCpgaE2/cf/V1x4+6kryq4Xs7jToL
         3naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmnRzrwogHMBhLLFbgjz0wRYktSUIOIGg377n8md9eE=;
        b=uuJ5uVNJzpPKcyYXVK474eW5xV1VewMw1F0D3DJkqQUGnLg+AcNPaDAloKNEE2XHvq
         dvwd80b8UDR0A55e6nhB1bHKwSEdtlz7gJgwt54dJc6w+g7BVY8NOdQQ0SlBO6ukq60x
         +ZLIybnKbbiwzo0xSpWuVDz4DO+iXka2o2cN0YTQGHVPOwHAv2funaSyNlkQ7RtBiWW5
         v1pSLFcOvCp7di1zbadX/M2qan3648+c3CKJDmFHxTJVio3+YNDl0ptUv7+8rlcxl4r2
         UjcZzvxlox81x6kV0RmaBt0vQEc8o35dfjooLUXphPTrPoZ7fYABzIsFUdmD3JTBu9Hj
         NQ0A==
X-Gm-Message-State: AOAM5310j+zw0RkA7Dg3ibzK+DbMdHwrtywzT3a/2TX97YCwoCU20AIL
	evVenrfcgYkQamDjFwl+NlAAn9C9Qm17Y4Pj
X-Google-Smtp-Source: 
 ABdhPJxAjYsQ2qKknpos4SGtduKPhb6mpT94qcFu7tDsEMeIDd2LYefPg51DkAhtjs7q4zOw52TZhg==
X-Received: by 2002:a05:622a:1904:: with SMTP id
 w4mr51775782qtc.650.1641484518214;
        Thu, 06 Jan 2022 07:55:18 -0800 (PST)
Received: from athena.kudzu.us ([2605:a601:a63c:b500:e36:844a:4b1c:4e72])
        by smtp.gmail.com with ESMTPSA id
 j22sm1819092qko.68.2022.01.06.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 07:55:17 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
Received: by athena.kudzu.us (sSMTP sendmail emulation);
 Thu, 06 Jan 2022 10:55:16 -0500
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-toolchain/armcompiler: upgrade to 6.17
Date: Thu,  6 Jan 2022 10:55:14 -0500
Message-Id: <164148451426.2506054.3648306160154282787.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220106110101.643678-1-ross.burton@arm.com>
References: <20220106110101.643678-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jan 2022 15:55:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2809

On Thu, 6 Jan 2022 11:01:00 +0000, Ross Burton wrote:
> Upgrade to the latest release, now based on Clang 14.

Applied, thanks!

[1/2] arm-toolchain/armcompiler: upgrade to 6.17
      commit: 07c7d2f9486091627675627f8559d4162ae752ba
[2/2] arm-toolchain: remove armcompiler-specific licenses
      commit: 22b453f785e7803ffe9b4be23f8f27f39f8a220b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

