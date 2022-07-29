Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E020C04A68
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:16:54 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.962.1659122206486406385
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=oNrSFr01;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id c20so4008501qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f7XxFZyBLiK3vTq7EuCajYWOEaWMrvlcdvc1ZV9wgGo=;
        b=oNrSFr017bIw30lfA98v3jH/hhr/c81ZGX6X//481mrktuNBq6UuiSwT2TQ1LzS2Xw
         zTVul8l+oz2FAzIcOmrOeuRQVdoSCJZZdOVL0WP+E7fmMu4rXN44eUux1vwQjO+zU2so
         yHxuVMEgJel+xZKnKi8zraExHClOv9S8Zb/p6vP3C3WUr2QYcBRobbYjgLmMa84l+Oao
         Dtf4aNEG2cQn4oz+hLdFtny+MgNbokT6kd6XvE9uRMeFyVvfFxrA3Yl2BsEEJzqSZS/0
         Rr7LS/vxnyhXtxwO43K+P2WY2cqxOrjHZYm+vwz1f+KlY4cP2Fpvq3oskjS1oqKZEI28
         fcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f7XxFZyBLiK3vTq7EuCajYWOEaWMrvlcdvc1ZV9wgGo=;
        b=8Ad0or4OGSHXQQo9Cp3Mgym+hhv9TITuWcJgjoZPmw2nSSGSAcP7eRRT1rXOagPqx2
         xtjP/XsVBLRmVqYHBzCtkHX/lrRhZJqE2tTeF/ytbfUIO7AUbXmVo+lnIn/UtnIGWsvc
         PpWshmCX8BE12yCedQ/s6tV3ULqmwvB2gSw+d302UpR6gN8cMgBocSMJl1Mjc0CKPlSj
         AppIai7dukxiw3wLkU8goxqXSRV638c0+NgN6JAZW1SYW2cYshPqUSqa6Envv3VZc8Aq
         Mba2TO8bxt3rC1qeW7u2Y9YC0YI3mWd5CPHBMpW7WQ0P0uzkJqL7EItzLyQMZp4V3YbO
         1xlQ==
X-Gm-Message-State: AJIora/6uhqZr7YIkAD4EGpWkRCm2V24xuGvKVo0+0aSkz4xoIn7rTC7
	ZxheEFhPvBZ14+d2itkMhivAarTT2LpIbg==
X-Google-Smtp-Source: 
 AGRyM1tKYT/j/UcXkoutjVwNs8VSxueRrZODiut6sFOvi233CPYYLj02z6J50HYZfHyNUixgaxH+Og==
X-Received: by 2002:a05:622a:1904:b0:31e:cce0:4bc2 with SMTP id
 w4-20020a05622a190400b0031ecce04bc2mr4655554qtc.605.1659122205166;
        Fri, 29 Jul 2022 12:16:45 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 b12-20020ac8754c000000b0031eb643c0f5sm2514279qtr.94.2022.07.29.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:16:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/fvp: upgrade FVPs
Date: Fri, 29 Jul 2022 15:16:35 -0400
Message-Id: <165912219591.603629.17577806947617813069.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729141600.1377123-1-ross.burton@arm.com>
References: <20220729141600.1377123-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:16:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3620

On Fri, 29 Jul 2022 15:16:00 +0100, Ross Burton wrote:
> Upgrade the FVPs to the latest releases, and do some cleanups for future
> changes.

Applied, thanks!

[1/1] arm/fvp: upgrade FVPs
      commit: 1eb9cd94164019c16cadf7d786ff5642f650095a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

