Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061DDC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:04 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.8907.1663947120671973860
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=dYDo80Yr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id y2so257546qtv.5
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=1/Wr4WswfRucOx1XDF3AJ9LKaOEVXcCftjv2fy8/jjQ=;
        b=dYDo80YrCrItLHHheMr+n3R9T3pjkNrJbe+eA+4LJYbAXy0/bgkcNUMF1Dc6EDFD+2
         ePClX/MmiX7G7rGORAAxZ/KLcE5ey8/zmyerTd0j6Hz5ihNAXjOZ/VLip4TYqWmApCdr
         yOPiu5uLnELX5+aCzw8VKgJOmGKLD5u4X/xPr9xE6EGh8QHkqWZocCf8xxkpaqIXqOs6
         8jhSvLnqNfORAcwbm90A8ZC1gGiORvkAbPz1GbDI2+itGpBNqUIRCiI+Jflaw+DiJzTU
         0HgsJ0BLJw6YGUSGRn8GtAXtp1UNQh9QVVgns3Wb5tnA+ZKoISxkRn5VmD1kjMflNF4k
         qNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1/Wr4WswfRucOx1XDF3AJ9LKaOEVXcCftjv2fy8/jjQ=;
        b=5X+nYuhFe+78SdnL3LMdw0Htk7S2/+3UQ5UZN2XuCCZS4HfREsrjbph4adSKE2SoY9
         acBLk5dLlnaCjqXiZxfUpuel1Bfuc85sqZXzgDFV3athqvFwe30Y9yCNacjPWStwkHE0
         gwIQr2FVdyfBqipYD0Otyk1+sf0wTWYe1is1ATtWxu7BJauuyrljwJ+nI+e4Xw4RSGhI
         thhOYTF99kJh0F6RyOcKV1L9EaCloMKGNQl/6rTMLRSDaLJYCD+Ikb7j5QGHLXSep2Tp
         biiRUHVSyqQ9aU7UdbiGP6xh6PnaqVsczoFIOVQSMH5LmXN+gjdVRDnMF4EtrFZOIeHm
         pYAA==
X-Gm-Message-State: ACrzQf1f9Knv4grJx2FQ5E6ggKy4mNH1Ls/2KRsUzdWeB9l1fKRtIKvH
	byEW7/ThZmX5DPAbCVdgl8+pRdm1qowMgQ==
X-Google-Smtp-Source: 
 AMsMyM5kVdkxCx0M1+bLpuUNrvL1bXSms//YPJC+2ruOjz+IlHOjU8oAdKGkFzL3BuphKtO4LaJriQ==
X-Received: by 2002:a05:622a:14e:b0:35c:f008:b104 with SMTP id
 v14-20020a05622a014e00b0035cf008b104mr7452089qtw.281.1663947119410;
        Fri, 23 Sep 2022 08:31:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a29c200b006ce40fbb8f6sm5774671qkp.21.2022.09.23.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:31:58 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/hafnium: update to 2.7
Date: Fri, 23 Sep 2022 11:30:59 -0400
Message-Id: <166394706727.2062239.9142817991284888264.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920223937.8081-1-jon.mason@arm.com>
References: <20220920223937.8081-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3821

On Tue, 20 Sep 2022 18:39:37 -0400, Jon Mason wrote:
> Update the version, update the patches, and drop the ones no longer
> necessary.

Applied, thanks!

[1/1] arm/hafnium: update to 2.7
      commit: c6bf835cefedbd5baf9bedd96d8659c425224fd4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

