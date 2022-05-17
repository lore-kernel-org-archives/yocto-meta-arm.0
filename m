Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B27C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 15:23:43 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.8766.1652801014094275004
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=S82Vua1b;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id fu47so14533778qtb.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N5TvdqyXzHQScjA/wTx1OQU48foXeOzzCeNd1Xw0Ll8=;
        b=S82Vua1bTcgUCGgeYUcyd9TWLlxO3JV5Zfb8vL9qjUOm5gCi0JgYfGkydg/e0ii+gl
         WyGHSZ4yUMuSC5pH4ALvXy28l9XGHaipzVxuYwE1oi7KeQQgOfHMuPMLEqG7lPX/3tvX
         hsJ3L+PQ9Ij3GFEYTaGE00G8zhTl4qtt3W3X5LlEdamZtk+A7t1GaDAzFHpEie9v/Xrb
         EhzqCRrzGcjiuHAAbLSRMqxvG6Qz9I5p52zKxroYzqIoNqJn4EdzcK9d4hy/cyKZnvIU
         yZbNooO4Kcmqb5xtGB1iV8TjRT/Xp4MTHTSS8uVXUbgVQc/NUFrZLZfF3ca3O7eL3wPE
         D7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N5TvdqyXzHQScjA/wTx1OQU48foXeOzzCeNd1Xw0Ll8=;
        b=w+Vn7PdNIZZmgXMS4peqT1Pj6fBr2m24mPBWifNw0PkHWU/3Hiqks2LDanTSqzXP8A
         YW/mOnFGDNvoO+m8VeXArxlp22w7zDd0yU54VM4bZozMg65E/tgJI+pgZIkJEkTrWPCc
         7DPoKpwy4vH9nkF8GdI5JDU8BavgcYjeGOe4lYPveyBsLSGhUgkNjNrGioBWhn5l4WrK
         QHXClAQ1mmEhbixKaHiCGvlJapAujpiKfyUE5veshglAt+5poFq6WzQ8t0OeM14HX0i/
         9H6+lAD9qbN15WGhKrrHs1+waCPyHm0fAlTzFbQZQvTwbpi1e7ChLI7U5QcIiccEJbDf
         nDNA==
X-Gm-Message-State: AOAM531hEv4XSRFBgy8ZcEabHfM2ZZ+rCNI++qBbjzJQK21jLfy1PUWC
	jk3Kwt9Wyx7CJWar2xdtwLSw92qMYzbxpJLA
X-Google-Smtp-Source: 
 ABdhPJwEcJmttKS3MmsrnxutTAsVJXlDg9bQz1zOtU/saP4CeMFL/QLuQzxKyZJCYcimflsDzV/iuw==
X-Received: by 2002:ac8:5d94:0:b0:2f3:e1cb:aadb with SMTP id
 d20-20020ac85d94000000b002f3e1cbaadbmr20145083qtx.372.1652801013035;
        Tue, 17 May 2022 08:23:33 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 f6-20020a05622a114600b002f39b99f69esm7846633qty.56.2022.05.17.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:23:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/linux-yocto: fix boot failure in qemuarm64-secureboot
Date: Tue, 17 May 2022 11:23:12 -0400
Message-Id: <165280099460.3621146.4414104831262712031.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516162044.2724659-1-ross.burton@arm.com>
References: <20220516162044.2724659-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 15:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3419

On Mon, 16 May 2022 17:20:44 +0100, Ross Burton wrote:
> The boot crash that appears to be triggered by the ZONE_DMA patches has
> been root-caused, so work around the problem whilst upstream figure out
> the best way to fix.
> 
> Also, upgrade qemuarm64-secureboot to 5.15 instead of pinning back to
> 5.10.

Applied, thanks!

[1/1] arm/linux-yocto: fix boot failure in qemuarm64-secureboot
      commit: b3c3f77fecbb10067dd6e2d7b1e2ab6088f30ae3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

