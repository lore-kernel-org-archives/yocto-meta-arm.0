Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DB2C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:51:07 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.8143.1639147865761013502
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=UCuM1+jk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id p4so7889263qkm.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ukEOnBGoxJf6xCi9F1kCg1/FFZrZlKQySVRrebmKX+4=;
        b=UCuM1+jkDYveH42pradXs7DqKV2BYCM+gxatlI8hFp/vrUbS9b7GNeMIy3bZaQqndi
         fiE/6BRalOndKOG3pMaPaL4UAYspmlsrptCTDSUBpEeb+O8xRWG5jwpea26964Z8LRNb
         kFUS7czgGZf924qAswNgOwtg4neT/Oc9KyW6ttxKnO8MB+zI5268SSJxmBoW5oWVgzmM
         FQtjv77L7ft8uR0KQMWCdt1bKDKIOtbRCoiXHt0TnOw7q9yX0BYyRt0nvP1uR+sgISvw
         VBsh3iFD0LD8uZOmIYdQrFVRXHwo/VqnVnymDQSTEVjEfpcO1NEnws5RIPCODAgCLyHS
         ve8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukEOnBGoxJf6xCi9F1kCg1/FFZrZlKQySVRrebmKX+4=;
        b=WR9hBzpNFP0OC0r8wj9LOcL9rX5QREVB2zBB+AB6SrM0lVfy9Lv00vy/nPpTdV8EDM
         EFSqFxvr8TAxpv9qaCE3jm/WAnhVIe77sNf7HtZc3fmF9OG3RYgOaaTBixSTe0JQ6GqQ
         0msdv6eia8cWirEVKk8qmppmnaCZFD3DFwjITALa6IY6xjZHu+YjxKbV5Y35pQiRgl5T
         lXpWY02w6W3QQDh/i4Yzt7F8iZzWYbSI4rj2wp9WxyetxZBrWZEB7L0Pkv6jPf+HlMrQ
         Q5OF62vlXS6DRk17fehEPd7gmRatUPJI6zeFrfJMnPLt3UYv7Ou7Q1N88TzBowK4bVg3
         YsVw==
X-Gm-Message-State: AOAM5324BygOgj2iwtfiFwAtegQ02KQ9S15L7V4UbU5e0sdOTLaK/ypC
	8z5AecOxHtnOcb+2h2LiUC/JxtbukazdWA==
X-Google-Smtp-Source: 
 ABdhPJx3k9HMTebuAH4CafREb7RcAri5CEZgIfNxtReQ8KGzsKwNgOs2TsgUHDSiKx4svIgSSGUcPg==
X-Received: by 2002:a05:620a:14a3:: with SMTP id
 x3mr21191626qkj.286.1639147864771;
        Fri, 10 Dec 2021 06:51:04 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:8d70:388b:b90b:fb51])
        by smtp.gmail.com with ESMTPSA id
 c20sm1220347qkj.119.2021.12.10.06.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:51:04 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] Revert "trusted-firmware-a: Pin to use gcc for now"
Date: Fri, 10 Dec 2021 09:50:49 -0500
Message-Id: <163914784919.9919.4509423634688987164.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211210011514.1664810-1-raj.khem@gmail.com>
References: <20211210011514.1664810-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 14:51:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2614

On Thu, 9 Dec 2021 17:15:14 -0800, Khem Raj wrote:
> Change moved to meta-rockchip
> 
> This reverts commit ad030e5830803c308a6b035b8ba1f63d42d5dc2c.
> 

Applied, thanks!

[1/1] Revert "trusted-firmware-a: Pin to use gcc for now"
      commit: 8ccbed681ca9ca0aab2b64d578c8921827e8af00

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

