Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4B0C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 15:24:13 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.8666.1652801044766307072
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=F5kJr2h6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id e20so1700713qvr.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xtcZf59+lhqR9B8vkNhnxH4FiFg5TBHdhaRY7pMxsN0=;
        b=F5kJr2h6iUa0Qp4vlhiFSAhoSCfy1vDxjg6+P5htrrReaFF+Y3zyhl0SQm2AuoMgQH
         tR3Fv2MtusIb9EGCNE6xO4TXdU2FThfVydr1rvUAjyde/Meg/wF1Zeea6MHwPD5o5QOI
         INa6rUaN67TvG/FZI2TAbrZD6zXkdfih9Ayd8gG6OBj3rXdrCdJG+ArznTNTl77nQZoW
         XPsOEO0Fcq56tQTVQmldiHi56tp0MR3qTVyn6CUjxMNjpz7aeQNRSZsgliKDGOPk4M1H
         xB+JbsUzrwVWSWoNNw+HnbrzcKBtCOd/4Iwx2RM+PZIHdCMYL5z33FFzn1z7LwlLQeds
         Ko7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xtcZf59+lhqR9B8vkNhnxH4FiFg5TBHdhaRY7pMxsN0=;
        b=Y05w+y4ZhUenBrDPg7LQAzYG+xSR4B7ZGf1z5uAECC5aaVg52+bP8/H9qsopuji6YA
         Jk9+0Sh3uu/QNsumos6uB5zkbNzK2tg6UuDHA7fDvEkdR4CLa9JQlIaurgkwO05TwIio
         K4MPptgbA6srV8tA2fd/2QK6mQgyCPL9JcbazN7iUCW5Gf7jNePkDrrornBohLDiwCH7
         47ArwdPsy0g4CFwH+zutLCnBFHfRm8xZ9gJji9mycV+P/UDH6j1SpyUM4zbDmIbkRFWc
         cEQGKCKTwC+Mby7NayLIwzCZ6SBCQjVr9OORkl7vNxLktRZCBjXFu/bliB/V/uPYtv4F
         iv+A==
X-Gm-Message-State: AOAM532wD5h5XQMQ7VHG5QLIeP6Xkr7k0fSPOTy0HCX3NG9gS5FThwAn
	AaI9cOgP53FYoeaF8FS1RiHzl5UJs9Hx7Kn+
X-Google-Smtp-Source: 
 ABdhPJzkozu8uAEYpqIcKP2aUzWmiwv3ifIbL5N7q4MU8QFDdTf0dRINEnMRfwVTJRMyWQCn4nyUOg==
X-Received: by 2002:a05:6214:b67:b0:45d:db71:9592 with SMTP id
 ey7-20020a0562140b6700b0045ddb719592mr20756895qvb.128.1652801043776;
        Tue, 17 May 2022 08:24:03 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 p195-20020a37a6cc000000b0069fc13ce1e1sm7800866qke.18.2022.05.17.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:24:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-toolchain/external-arm-toolchain: set the version
 in the recipe
Date: Tue, 17 May 2022 11:23:48 -0400
Message-Id: <165280103077.3622764.12744147075443410723.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517122818.3324458-1-ross.burton@arm.com>
References: <20220517122818.3324458-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 15:24:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3420

On Tue, 17 May 2022 13:28:16 +0100, Ross Burton wrote:
> We need to support multiple versions of external-arm-toolchain, partly as
> different versions have different layouts on disk, and partly because
> 11.2 doesn't work on pre-Broadwell hardware.
> 
> Rename this recipe so the version is in the filename, and dynamically
> set PKGV instead of PV so PREFERRED_VERSION is easier to use.

Applied, thanks!

[1/3] arm-toolchain/external-arm-toolchain: set the version in the recipe
      commit: ac83feb7cd16265d4e8ee0ed50dba903306867e5
[2/3] arm-toolchain/external-arm-toolchain: add back 10.3
      commit: 5fec85b41d7263dcc8aa15351beb7c19e2017849
[3/3] CI: use external-arm-toolchain 10.3
      commit: 4c6ccb833c1ac379df3efa02136e03067d89ef3e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

