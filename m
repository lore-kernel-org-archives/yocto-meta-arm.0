Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C51BC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 22:58:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.3847.1640041094708545597
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 14:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=WbQEkZVW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id e16so67460qkl.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 14:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9B2kKhtZY8YdzOydlajnvCLtClIFKl7MdP/8nuHwYMA=;
        b=WbQEkZVWXXdeSZrjHMigKP/upAEqDfUF2U+mY5QsVP99sXTY8M7LBQGLkl88nJi91d
         tLYA/phTbp4Q3eW93+vy1XKPnmYAKywKIoC8zGy6l0FQcAHP8XkQjiEL79ptXNy9LWvA
         RJ3tlKAVPLmek8koZvsyMHc1jZKNDMWyCaPX2LMo83VhqZ79rLVaTQCLRwb3pVdDZmVZ
         PMpUcn9gyg+2AP7TrnWNXmKWHSZ1OHGK4ftyLqkJJhNRBJU3vuxhcy1/fy7uCL7diYFr
         l91Xyo6l0B41C0EGewCekG/rxi8aq1Eci7raiJ2/Whs7+Bb7dOUE8E2pdaoVHTizChMf
         nZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9B2kKhtZY8YdzOydlajnvCLtClIFKl7MdP/8nuHwYMA=;
        b=qcZ7ph+UVUdkZ4nx9vaesq2C6G1J3h5NAt7pnTEaRzLenLAvFCQZVDzb33ub2YJpvx
         NPouZSDdjnhZjZBPFpmWCcykhjyn0IAouhr1egmLsgEGHYVoVrscboqgx2baxZJx+Bb0
         h+nKNYYLoMn3nLwLQ31fAjGmii8U+doWXTo9CLYKhZhLetd+tn42qJd1IaWT/9McwRno
         VedzqG9/O2OzY+TnZDdRfGzjus3JOCa5wpmuhn03e7zaNBLg3Sy8lsOpv/rvTq/BOWUx
         reZtRNMuChnvZ6n3qkip2+tOGX9OgXgZzTP1oGt3C1JE909PQ4k+JZiTbc+kCqXb/c2J
         nzVQ==
X-Gm-Message-State: AOAM531IAg4b5+pUMfQKKLhA3Pp7ufJOuwgM+00Nqx2giDYqGUoSKKtd
	+jUiP1MdAe8NGr6BJNfSso1C3asF7nNZm3EC
X-Google-Smtp-Source: 
 ABdhPJwalDuy5R3DJMKG7EaKH3ed+BvOFvNKGQOP7LOF2tGcq8P6rKYFtTBN23ZUXcV/iO+R9D09MQ==
X-Received: by 2002:a05:620a:454b:: with SMTP id
 u11mr274347qkp.599.1640041093766;
        Mon, 20 Dec 2021 14:58:13 -0800 (PST)
Received: from localhost ([2605:a601:a60f:e00:4124:7c32:8a5c:5da3])
        by smtp.gmail.com with ESMTPSA id
 h13sm16216063qtk.25.2021.12.20.14.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 14:58:13 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	xueliang.zhong@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/4] arm-bsp/secure-partitions: corstone1000: Configure
 storage in SMM gateway
Date: Mon, 20 Dec 2021 17:58:05 -0500
Message-Id: <164004108521.15502.3132508079167572926.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211220141418.19837-1-xueliang.zhong@arm.com>
References: <20211220141418.19837-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 22:58:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2749

On Mon, 20 Dec 2021 14:14:14 +0000, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> This patchset will add a macro to configure the volatile and
> non volatile storage in SMM gateway. Few useful logs are
> also added to the secure world.
> 
> Gowtham Suresh Kumar (3):
>   arm-bsp/secure-partitions: corstone1000: Configure storage in SMM
>     gateway
>   arm-bsp/u-boot: corstone1000: Fix SCT failures
>   arm-bsp/security: Revert set append write TS patch
> 
> [...]

Applied, thanks!

[1/4] arm-bsp/secure-partitions: corstone1000: Configure storage in SMM gateway
      commit: 5f69e4a51bf67383e808b39d15f94ca239afd870
[2/4] arm-bsp/u-boot: corstone1000: Fix SCT failures
      commit: 9ac90c6b25ba8a91e7b59e5a7db20e7c4c8cdef6
[3/4] arm-bsp/security: Revert set append write TS patch
      commit: 5661a1d61437bd9fe653ea43d9b34fd8908d2ecf
[4/4] arm-bsp/u-boot: populate ESRT table with image_info
      commit: 7afe7d50f1778777c62880c75da6024cd4fd79be

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

