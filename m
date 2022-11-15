Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8A2C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 14:52:07 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.6373.1668523922863894904
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Nov 2022 06:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=qJoHCIOT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id g10so9593944qkl.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 06:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqhIZv10nbOkj2GqvaSRSdge2sOht1at2X+EQz3rBYE=;
        b=qJoHCIOTwzZThjBepeK9+gKRQDPLh/t9lzDleOGJJmtPKQFAwGulDlE6RYgih9y7IV
         T2HPnKb+66PW9TZ1n39d8XwqC6eSlo1ouHcvK9xyLbPWGAzu6l1Jz4QMxjSiPKkH8BOM
         4lEXt463qUvHYV2L0aN6UtK3K9ZEHmwxBX2kfCTze3SIKWOqCovZ3xJC+wwQzcqktfL+
         LtMOMH6hAJAZQxkqUkEkNIft14TH1ZfAJr6S5LGVFWHVlH6dKY2gLOW+/IOhc/NRzaaT
         QgI+I+lsvtsva7bQhyH7VfVujErrbRPlvpoG/ToTawcgsPtc0pGNRfGcAaQgX0p14OZc
         wN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqhIZv10nbOkj2GqvaSRSdge2sOht1at2X+EQz3rBYE=;
        b=uE4sOKsmFxsXu36h2LZisrGKmu3pMgdmqdk1Tzdts0/ZMAsdOIn/nUb9xxm4OWH31I
         wHwCs4E5/S6lbRSclf20hJepBZO9S0gq5mhpd1nK7yWfwl+QfjTxhK9m8s6rDk+LCgVa
         N69p0kJ78JYjU/55Clya1rd0sLNfViPHspmpjtesXSca1X6MSyV/T4T0DopM2bVgnum3
         FqdhbH0I15EBLEeWpnGPO1B24U9aocLkzqj4kHLg52HFFKzofPSeFuLgziuAMCq3IjLP
         nnIs2EYzDQcNhyuArpr7CrHvljU1iszVPrPa6CGnyLEpkMf9liHusMxYfQhJTHmQ21uK
         a/+g==
X-Gm-Message-State: ANoB5pm77fcoPCiKlnBiIbMaMu1Y2UeQE8zC09Vhh+pkEFgiaf5WnTw9
	fGEC1GHm707l0sKg9myjSv1suj1TIAilng==
X-Google-Smtp-Source: AA0mqf5rAOQSmVByKsN3wZueTRLhRKxm1y58B1Z2KbZczYBjJ/to/YRwNMpB8bmcs1eTV9sUFlyxVg==
X-Received: by 2002:a05:620a:309:b0:6fb:93ac:c77c with SMTP id s9-20020a05620a030900b006fb93acc77cmr5441355qkm.30.1668523921463;
        Tue, 15 Nov 2022 06:52:01 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id 3-20020a05620a070300b006ce9e880c6fsm8100014qkc.111.2022.11.15.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:52:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/sbsa-acs: update to the latest version
Date: Tue, 15 Nov 2022 09:51:57 -0500
Message-Id: <166852391731.371608.8457651338183190668.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114143213.16026-1-jon.mason@arm.com>
References: <20221114143213.16026-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Nov 2022 14:52:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4128

On Mon, 14 Nov 2022 09:32:11 -0500, Jon Mason wrote:
> The new version has an issue with dangling pointers.  So revert the
> patch causing this to work around it.

Applied, thanks!

[1/3] arm/sbsa-acs: update to the latest version
      commit: 129dcef079bf1e293bafee313dea8eb1b6ebda05
[2/3] arm/hafnium: cleanup the patches
      commit: f52d4f63d71eda5b61ad9b93431394fe1100c6d3
[3/3] arm/gn: update to the latest SHA
      commit: c97a9c5b393dbcec6f222e945c5ef587320a40bc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

