Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A996CC433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 04:30:35 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web09.2415.1643430634446778390
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 20:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=GMjJKLyn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f45.google.com with SMTP id e79so10173652iof.13
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 20:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IAAHfv+6SByA13kXaDsimepDEHtKzZbVHaE+aDrQLyA=;
        b=GMjJKLynXvMDs4QN/XiyZ8FQQLTTv/R3wmpAeTn/vFNoYjqmXizyJ/3Ve8kRCbV7EE
         yVFEGhAldrap2XT6jIFcV9meeKtWi2XKtbyMlEYRMv34CIy6jBqtIDC2qi9j02J81Dkw
         vWh+1IdmYc6H/0Hed+jzl5uEYVuo2MFSGNElhZj5cAx4nmG6Cai+vvGykdFRTVlNMhqi
         QlYv4GLqKvyS5TM/oDfnGNB26iZC8J20UoiXE9p1pyKx3woH4d4Shmmei0zuRSeyr6Lo
         VO0F3vhyzTWgOlU0nNfX7z6qCObPgBD5o0Gh6Akjzy2yty4zUJLIAjNFhgdJQ1qPDoXx
         uMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAAHfv+6SByA13kXaDsimepDEHtKzZbVHaE+aDrQLyA=;
        b=7nuE02kT/LW1ukvp4kx5jrY4Ut+bL6cJoO5dH6lWsfdiLm6sTbDfwAZgoU/2ItEsg4
         MQHf+NK7VvRdepdhv90NLGxEb5TSdtkJqEyLuZN6m1D1QYd+7YKXNgDu290tv+gV8MuJ
         Ffn7z3om1J0OkPV4jYEkREY0t3YbkgmQd2G6dEckI1Qu/Mz9gDu7t612WzQDuxbLAcVn
         RHemoig0YBvEpYBF0pLRF3CSuEqowsiUyzy22+lIm6ICU8xf/SK0u50Eh7MH+jmeOdo1
         iGXDmAupHfDvBVT/OtjOt1SOkXgEjBWY8sbkq62sRon6CqWtu1u2/qsx7nbnemNMaloG
         l6nw==
X-Gm-Message-State: AOAM533jzC7xYWnSeSrwNDRHIawN07BVViFa/OOir3UKq1FcYW5ay036
	QJYwOIh0vYDSUDmWveU5fkhAYfUG68RExA==
X-Google-Smtp-Source: 
 ABdhPJz3zso8UFsbvnyGoU4bSPIgGvspJlHoVEnhQVRoyKN8IzsdmHbjcZrlP4uhGueiRcvg8+IB0A==
X-Received: by 2002:a02:7346:: with SMTP id a6mr6342436jae.299.1643430633623;
        Fri, 28 Jan 2022 20:30:33 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:be14:e8d7:55dd:a892])
        by smtp.gmail.com with ESMTPSA id
 ay35sm8668341iob.3.2022.01.28.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 20:30:33 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: use the latest release of the Kas container
Date: Fri, 28 Jan 2022 23:30:28 -0500
Message-Id: <164343062871.3410244.17068692166431718944.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220128191751.2767190-1-ross.burton@arm.com>
References: <20220128191751.2767190-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 29 Jan 2022 04:30:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2932

On Fri, 28 Jan 2022 19:17:51 +0000, Ross Burton wrote:
> If we don't specify a tag name GitLab uses the 'latest' tag, which for
> Kas is moved whenever an image build is made.
> 
> Instead explicitly use the latest-release tag, which is only updated
> when a release is made.

Applied, thanks!

[1/1] CI: use the latest release of the Kas container
      commit: 3a2b7d55c7fdfd80e2f8c23d07b4217293c6b050

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

