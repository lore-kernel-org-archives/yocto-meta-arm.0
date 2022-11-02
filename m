Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEEBC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 13:14:15 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.6053.1667394846531090564
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Nov 2022 06:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=c3sIfm1h;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id x15so12408253qvp.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Nov 2022 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuUwhym8tYbhMIaXUg0t1r6Obp0IdDWRIVA21fz/+jo=;
        b=c3sIfm1h8ixWwK6LsMiyFjcAr0D1kVrdkAIsnQLMz5xWKVuG4YC4d/rYunuPOw4G5T
         c5iMaiXsGh+QqDaghmN0YsGp5RRhQWqzB8zbwo2Lao9cLNSHIqkkPF3mFvgpIrQORQcL
         2FokyzA3oBzk+094oSaEvNi/L1SJW/0GduNzQDt5t+6883n17uBWI1G4HDK6rxebAb0z
         9rJueortMAZjoNwbqMAPAevH3TlnG3YwWYuKoVNC9JoeWR4w2xDqZAUTyv+X/k5m3mx9
         B9sFxJPjJfcs2l/HjnccdrhEpnYDrUaYqDt0F5wKb/0bqxrwZgOH0swBn9tNQGuxXdJg
         AmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuUwhym8tYbhMIaXUg0t1r6Obp0IdDWRIVA21fz/+jo=;
        b=oRGmB8szXzTrL2EArNgxjyZ9of//cFw/gXUykHKMv4uIWD6b90i2LRy1yE6ByKW/CB
         aV/nmqnpgsTiGlseBf4dWDqIUgL5sk3YROWDvg4q+JNIDjecqY0LLviNGTpPUX7gAxVm
         7XC2MH3IAbiDUkQYAVfxGU+DoMDUh56kfkRYseHfF8NVR7JU4ATdXp8qe6hUBonDN3jK
         tyMgNeFyw4qtH+G81ZuUawdq40X1teYHI+bXCNK9ZhXmxKgjE3eHplKB6OKK44/j+dsJ
         OPYF+YaSJhuixhdc0GHksYv9gXN+whgKRgGimHy6I/TqEEgL+hmLptyHEgbuYg59YmXi
         jwqg==
X-Gm-Message-State: ACrzQf0cSSOWyvRNrdglUXctwgYQAPGFlx0jv9fPKdlrZssG+kQOaSdF
	7jcEhuGHa+Jr+ZKd3ZjWWqNB67YotHe50w==
X-Google-Smtp-Source: AMsMyM4PggP+pwjNz95fw6ZxYSz9wzAshynri52GNLRRwS8e0qSdqilZgsKhnK7KxuaZ1q++5ixgag==
X-Received: by 2002:a05:6214:29e7:b0:4bb:db02:de63 with SMTP id jv7-20020a05621429e700b004bbdb02de63mr18609926qvb.69.1667394845080;
        Wed, 02 Nov 2022 06:14:05 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id bk10-20020a05620a1a0a00b006cbc00db595sm2387440qkb.23.2022.11.02.06.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:14:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/opencsd: update to version 1.3.1
Date: Wed,  2 Nov 2022 09:12:47 -0400
Message-Id: <166739476849.2730624.1475767100442274921.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221101131536.29976-1-jon.mason@arm.com>
References: <20221101131536.29976-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Nov 2022 13:14:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4073

On Tue, 1 Nov 2022 09:15:35 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/2] arm/opencsd: update to version 1.3.1
      commit: 59c3e948e8741c497474dfe348c46e896a4dfade
[2/2] arm/gator-daemon: update to v7.8.0
      commit: 3b7347cd67eb127a4e5757f1bd6772f83ef04a59

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

