Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66008C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 19:40:01 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.2040.1642534800086837699
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Y++znlDd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id c19so23334438qtx.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4P9qnwTH4PrqDq9cMk3HsjrHMR1K1iG0e7UPm3j8W/A=;
        b=Y++znlDd2txogy8R2qvhAbSkkXerZMp3FQk7hrYB8T+DmWZyJ6v7zEfQMr85rsyOoi
         2y7fV02+E7IT3tofzP136bbnsT2jKTT035zajIa5xJDJHlqvI6tzWOuRzHxhpXcDbz+0
         dCYSLslW6ImAI2vrLnWl55IecAI+utsHQ7Z+pJa1o3+agJ8900oxvukbozWMf0DmtwEA
         Tws8tTsquo0zvbQQaGBYmIi/Kpi8vmO08M0rQyVfz3vimY5RD0sdZrcYMjlj7ojxrOx4
         IBM7wjcyUgf+xCZf4zuCBHItmbqZZph/wWmhD+/kwpQEP6xRKQK18c0yx8gyafTYAlUq
         sgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4P9qnwTH4PrqDq9cMk3HsjrHMR1K1iG0e7UPm3j8W/A=;
        b=mQHd3fdEiGPkPG4sfJChvbHZEhEqU7GD1hSv4hYpYs0r+Wuq6XyBKWmHx5x5ZIEHnr
         a2dyrn6LCTKZVeYn4CUmuCUZ05qctFII7A2CuSWRR1BPtrFohSa3xlOCFQe5kyaNjoro
         i5zyq67KOD1ikuxzWomhCj7k1xRzXJ8vplOWaJUWCPxmus8MykkMyh6vpWN28stzgWj6
         cvQaDQt13FCmqC6GmpaLWEqBUEDF2Ukk8xqdzriAFOrcquG+4/R/gBZEu8c7MOyI+qph
         hXXyR7qS5+Ou/tpZ5GBShAzzMQSZMxW11qR+kPd17qRqaOEK92lpVrr4Zu7mWRq5v+FX
         7gMw==
X-Gm-Message-State: AOAM5308vyJs1YduNoRMVBQ7NcF5Ba+HdvqvFP2Wx3R7Lgu67Q4n+nHg
	yalTZwct7FKEY72n54Y/Gs53HeGx1C/rUw==
X-Google-Smtp-Source: 
 ABdhPJzbciVv6bFz6xLkeiApq0TzCaPfDYY0Bdv1YttZa3evnz0HeD0PbP23MlXF1rL19GURwBtpQA==
X-Received: by 2002:a05:622a:352:: with SMTP id
 r18mr9950809qtw.263.1642534799138;
        Tue, 18 Jan 2022 11:39:59 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:ff9b:992d:3671:5cb2])
        by smtp.gmail.com with ESMTPSA id
 p16sm3440386qtw.37.2022.01.18.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:39:58 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anders Dellien <anders.dellien@arm.com>
Cc: Usama Arif <usama.arif@arm.com>
Subject: Re: [PATCH v2 1/3] arm-toolchain: Fetch prebuilt Android Clang,
 version r416183b
Date: Tue, 18 Jan 2022 14:39:42 -0500
Message-Id: <164253478336.1176449.2839484400978916041.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118170350.23361-1-anders.dellien@arm.com>
References: <20220118170350.23361-1-anders.dellien@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 19:40:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2864

On Tue, 18 Jan 2022 17:03:48 +0000, Anders Dellien wrote:
> This Clang version is present in Android master
> (as of October 8, 2021)

Applied, thanks!

[1/3] arm-toolchain: Fetch prebuilt Android Clang, version r416183b
      commit: c4fb4f53cb3fcf87d08e93ae30f4a6734bd16c7b
[2/3] arm-toolchain: Support linux-arm64-ack build with Android Clang
      commit: db56f59865383eb91273570645b7063bbf391716
[3/3] arm: update Android common kernel and config
      commit: daa8388dadb4ebc24e3884ceb596cdb9f166ea25

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

