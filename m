Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8BDC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:41:45 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.1743.1648518104624950036
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 18:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=T//4RBJT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id 10so14087189qtz.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Mar 2022 18:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5DyCWyYZ5PJel/bsfrKSIOZvRMH7/TcJxbLbpQJ/WAY=;
        b=T//4RBJT1V0Wz8lrvOOVd0NaUV1V495MJ39HQPdTPwFnrXfRCPy+NPM5Zq8jdc7PDU
         33WQcZf0Wpkt0QnXuOfrN1bIxp3BTav84HmBYjIT2OyRApF+H6BJdf6x/UJxCMYlKSuV
         QFd1kQY+PesHvIYz8RxZDJJISGYI6p2sSoxnVV6BndouyKS8FpRmhBqquKopTww7sbu8
         jDFovafu5pAvTIHONVnVrcPTM7SM99DXz6kvyr+UGlkn2ukz/Hm0zvwR2MF3WPNsNz6k
         o0ua0v9aKz6Qp7Do6BH7g4OJxu8X8jnsrYAxAx6ucWg6Uy2O0JZk9d9uUaBz83EvZuSz
         +kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DyCWyYZ5PJel/bsfrKSIOZvRMH7/TcJxbLbpQJ/WAY=;
        b=gZfaAh/X89liRw6Hrz0JMFsK4YjgS5Ug7AcR7nWI0VtdS5qpQiRVbjTRO1kU4ybqzD
         jdsJQs2eOyGsW1/eMn2PY5DmP8IJUJpKvk00vRxbEiBY/otyWJQOih+d9+uS6bEAYsIY
         /A0K8SCDFWy3xeZiw4HshzJSZ6zvFCicbgXFHORUFXMP1swpJXrh9t6VD0qlCuyGJwrz
         4D3yamycVhvnnQ2G+s0hTTbzumo+s+CLnM23lSpo2v8/mFvmsj+tPGzvvNQkWvCm05dH
         wqfeLDkGk2l8yXoGh09SJvqTSrye6cpW+MBZPYbl28z6j6OpODhPEZVHNJcbMjzq9+iZ
         suow==
X-Gm-Message-State: AOAM532essuISCKptgNz4wF8Byf4JNaj1ofz82DbZlfXCFza9QTgfhEB
	wwNYjJ8l1qm6ds5TQ0A+GKI65fAR26SARU/F
X-Google-Smtp-Source: 
 ABdhPJwCtw9oSiIMKA51PLTLPFUcOJGV2ar4nFIlCFJPE01wblBVZyAhuwEulHZN4izSuyT9TUbukg==
X-Received: by 2002:a05:622a:1b89:b0:2e2:1ed2:310d with SMTP id
 bp9-20020a05622a1b8900b002e21ed2310dmr25010587qtb.421.1648518103517;
        Mon, 28 Mar 2022 18:41:43 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 p64-20020a37a643000000b0067d9afad07asm8810746qke.76.2022.03.28.18.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 18:41:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/7] arm/fvp: generalise FVP_ARCH
Date: Mon, 28 Mar 2022 21:40:55 -0400
Message-Id: <164851805625.4706.12602429973550673924.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325134853.3068169-1-ross.burton@arm.com>
References: <20220325134853.3068169-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Mar 2022 01:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3214

On Fri, 25 Mar 2022 13:48:47 +0000, Ross Burton wrote:
> Use wildcards in the FVP_ARCH assignment, as older FVPs use _GCC-6.4
> whilst newer FVPs use _GCC-9.3.

Applied, thanks!

[1/7] arm/fvp: generalise FVP_ARCH
      commit: 966d3ec03191e56b5a91eaa018c2786a853af904
[2/7] arm/fvp-base-a-aem: upgrade to latest release, 11.17.21
      commit: 22282ea8931b045e528f96f19cf7fe6c8483fedd
[3/7] arm/fvp: add more helper variables for the versioning
      commit: d47e6a89e1b8694a8c26edf23a8713118cfdd815
[4/7] arm-bsp/fvp-arm32: synchonise kernel config
      commit: 0e9df5afbb289207cb71db46912f551b32031e3d
[5/7] arm-bsp/fvp-base-arm32: use correct DeviceTree
      commit: 4ab912828eeeacc0630d08eb5a2d6fc2aa8b9ef1
[6/7] CI: fix random testimage failures
      (no commit info)
[7/7] CI: run testimage on fvp-base-arm32
      commit: 4c66c6dfd6561bd7b63797d079cceb5bfd392d0c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

