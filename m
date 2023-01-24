Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC575C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:10:16 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.5765.1674526206524245627
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 18:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=mVdXi7Hu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id s4so12023860qtx.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 18:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ShRU9KDBGinGZSsIASNrKpV6Zcr61tHr6fOr7eZTiI=;
        b=mVdXi7Hum58pRYEmD+gx6wHW/0S0ciHmk5hEeSg9L6V5faPdCQo/XwK/VyGPZ5MmkY
         QycYOEGFsn8wcj6GwZBG+eGKIcsKJ4TaPrkJrso8WfRUNT3Q609lI3J05cFkOu8LtY6r
         p/l351Nj857mTpu5gfbFjb/PAxl3jXtV3N4r18Z3zX82YObAdY2nkm2Bk/fgH0ri82Hq
         xD9h7pN2NQyuBdpcwSFK5W19A32c2d1ocTzJNEuSwNPv2AJmiKu4i7A+kkUWJM519fno
         qrA5H4BfMkmFjc7dcjZjwhk/OLvD9UFLfIY1cG3LtvV4/brbbB1guiloOScPzGzCDd7F
         uN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ShRU9KDBGinGZSsIASNrKpV6Zcr61tHr6fOr7eZTiI=;
        b=wrBRs3Nrc+n82l220zbEjCbestDEQQ5MYRHlFAu19J5hbWK3qLBK0BlKvXhldg/6V/
         gzTfo4ugg4Cv5jbqWtSQTZxgzc6+U2CyyqB++FIsvTI3d5+goYQC1nF4SyPqDNsYBpgf
         rJfVU/t5+LYr5fZlcZICuZDNOamOR/eRBkRJRurGqcDRwbV3uD+EOfQkOoEPXf/KJqyZ
         46t13uPlvK0TCV3hGN62sJooxSqTEP0BuID8sjHCb6F0xN5Wh0A1FpaWr2gUaPreZKb2
         RUKbtU7mPV5BTSMxQcniR3g9n2aYypjz3ySOtq8xlf004mGaic9H+pNinUNtwlKqPBos
         q/Uw==
X-Gm-Message-State: AFqh2kqY+PGg2aWz87lKrNf67Ndt0IonACoC2lhkIYE7/Q9l2zZEZC8p
	6xuZzmlteHCjFRAqg3/LgZkX2yoLqnCKiFX/
X-Google-Smtp-Source: AMrXdXugG7kK0/VinW7oxuEgNhL/ZZYNviF9slGNvIaOhIjfU17vYkKtMDjBW5dszM9ykpY4EPgM6w==
X-Received: by 2002:a05:622a:6028:b0:3a8:133a:9686 with SMTP id he40-20020a05622a602800b003a8133a9686mr32402498qtb.12.1674526205051;
        Mon, 23 Jan 2023 18:10:05 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id j28-20020a05620a001c00b007049f19c736sm617933qki.7.2023.01.23.18.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:10:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH kirkstone 1/2] arm-bsp/juno: move to compressed initramfs image
Date: Mon, 23 Jan 2023 21:09:46 -0500
Message-Id: <167452618606.150426.15807147081480204281.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118155452.592-1-jon.mason@arm.com>
References: <20230118155452.592-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Jan 2023 02:10:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4318

On Wed, 18 Jan 2023 10:54:51 -0500, Jon Mason wrote:
> Change u-boot and machine config to default to booting a compressed
> initramfs.  This allows for easier testing.  A compressed image is
> needed as the image is too big for the storage, and the error notifying
> of such is vague.

Applied, thanks!

[1/2] arm-bsp/juno: move to compressed initramfs image
      commit: dc9e257f2b20a58337f33b58fdedba722e6af150
[2/2] arm-bsp/linux-yocto: Update juno patch
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

