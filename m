Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E80C677F1
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:06:07 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.95592.1673633146317491061
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=xrKgllSZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id s5so15232592qtx.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+TZH6Yq5Fz4NuWi9VqyzNTq0hot+IViM3Eq1PbktlQ=;
        b=xrKgllSZaTlloFBjfmNeeEStsINNW/sYzmImcqoMZAr+HFjBy/zRy6fbNNsG/zWTXV
         tzShaRJQ4xsEgoDDChwqvdx9QlTaUVwWJ1zilPgSXOtvqjaHTA/UZrzo7e2/acvGLXAL
         ALH6hRVc6SK96wxmn4tvJBTuC8S2w1GN7at29wYXoS1UYbsd87H4Z1G771F1tb15NNLe
         oJRTI4W9fAmbEd6RAc7ltdTHfgEy2JMti7xMFrIsAhF8CAQzLQTDR6ljPERPj9s6NN5M
         h+E5dp8iUqYIUmV2JXzkDsuU7gIdI4uDALuWK9hqL4ryReHWx0MTpG1em500bTLc8kox
         sN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+TZH6Yq5Fz4NuWi9VqyzNTq0hot+IViM3Eq1PbktlQ=;
        b=CqhYTA4xn6U9W48KGllMghTyQqK8onkq4e2pG6dSrj41X7KVyyDiHrNjM6hBZZ4DE2
         vcbnz+V/9/aD451WJ0Wm3czPrD/oJYP0NBjvEaGCBAOv+MUu2ED4tUMBRiykmUImNeLZ
         m58SKbvEYeypbkwDVnUuZ6vG/+Fqs/SgImxbHGHW6X32VD7c6tVW3yxN+Bh91dTs1GNq
         fgZAmoPBEz7EjUcI1hNH1QbjlNs4jZ1RwfkyZjJYW6C4emaofvj8yl0lyuHSwEedM44B
         ARItiBThvpzYLytvPX/QEHuXGyL39cfo9+ccPMuIF9ErK4m5GpBKR5VaKkIh3Eei0sVp
         +s6w==
X-Gm-Message-State: AFqh2kqCzrT83NMGvoihaDTPh6jfQeZjw9NMzFd7MeCqlBm8bThKHy7m
	mCk/mJokrk+ODPmYmzREpAR6LJhAi+JwdD1f
X-Google-Smtp-Source: AMrXdXvV0/4rhnINwTY6f0h63ik42L1TwEdDGliu6hmLUkqK1tX7pXIZxu5u5DQu9HQZlPn5ot3DPA==
X-Received: by 2002:ac8:44d7:0:b0:3b2:4309:99e with SMTP id b23-20020ac844d7000000b003b24309099emr7170641qto.54.1673633160824;
        Fri, 13 Jan 2023 10:06:00 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id g20-20020ac84814000000b003a97a71c906sm10847489qtq.78.2023.01.13.10.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:06:00 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/5] Add optee-os 3.19 recipe
Date: Fri, 13 Jan 2023 13:05:45 -0500
Message-Id: <167363314944.1009004.6632360643138780736.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:06:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4284

On Wed, 21 Dec 2022 14:39:37 +0000, emekcan.aras@arm.com wrote:
> This patchset adds optee 3.19 recipe and makes necessary configurations
> to support optee-os 3.19 on n1sdp.
> 
> Emekcan Aras (3):
>   arm/optee: support optee 3.19
>   arm-bsp/optee-os: Adds 3.19 bbappend
>   arm-bsp/optee-os: N1SDP support for optee-os 3.19
> 
> [...]

Applied, thanks!

[1/5] arm/optee: Move optee-3.18 patches
      commit: b061104c87ce58fcc1e9e4791a8339b7af583a09
[2/5] arm/optee: support optee 3.19
      commit: 3259a2a8402fac059e198b772ada01281d3f9cf2
[3/5] arm-bsp/optee-os: Adds 3.19 bbappend
      commit: 3d9c97a0cc9811f6f48004f8f1753651714699eb
[4/5] arm-bsp/optee-os: N1SDP support for optee-os 3.19
      commit: 529d18e8a5e64b28469c5b6312052bf3ce7c80a7
[5/5] arm/qemuarm-secureboot: pin optee-os version
      commit: a6211b606763255020e11bb7d838e3de647b3048

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

