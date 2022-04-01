Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E13BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 14:41:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.11434.1648824094917116824
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xNCG/89V;
 spf=pass (domain: linaro.org, ip: 209.85.221.53,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id u3so4595601wrg.3
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+b3hAnaBocQP4h56t6JZXkBGlUmoZkAQUUxuWYGlBI=;
        b=xNCG/89VYp/p0HuW1kMe6fRPYLJSsFm0UZanA17j1iKhNwMvnHrGlm8/oyw+bCK1HG
         GYpri6c9X7S5ekvjj26aYa3XguQNge2dfYppY1zpmJwlZ5xdm8GUJpX1p3v58rg81hHd
         JijJac7stIUDti/duaeZHHpUqioqD3ux1q7bCDPf+noWTvUpC5iWsu+KAXBkAnvmbZDJ
         7RxMuocGH4SDxR0lU5wTxa8LsqSivwTZQRds342bLCUKa/6lSlGqtLO0h3zbPeAjZ7cH
         clWz1Ivwic3MahvmUZ8PHK8q5a1kgdPK7UOUGcmFYauXeLUhti9kuWaBZdkDQLmxmfZf
         9/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+b3hAnaBocQP4h56t6JZXkBGlUmoZkAQUUxuWYGlBI=;
        b=PPhobVLm6H+GsLj7/yOfRVIiLn9n+xGB/c8lI9QyIkrM6qxPpdH1ZOvh5piGJx+lsB
         O1v3qZb/3lZtrQgny07Hr8tRgl83hYB2OM5ZXqisSciUScI00Ku3mJduaRq/uwnj9Onj
         li/GczKZxiTalnNEVDCt3rNN8W3MH873rMBCTqu+n9cqKUKk9rKpettHDY/+FILrK1fG
         eLkmVr6+AZS7M/ISgLnBdegSyCC73UYQwTBCt5iNCiWEDG+bcdXm/Q1/WZItGM+t027J
         iYrERlHm9MIdgFFjAQ/KYXy0732nbqg2LnXaHkFvm4yJV7z78BSqsRbw10YbuNhh57lH
         nE/w==
X-Gm-Message-State: AOAM532k3Lr5upJRHXkinqCnRmmFXsIihZ2F7+Idght0h6LiK+JS+ihv
	XBfc2Lkr2lmqtPj9gJ25nUTElMy+m4IN4g==
X-Google-Smtp-Source: 
 ABdhPJwqAWJrjV0tAJeer7uDwJRTfpfWmLjnlEvICridbvb7tIb7+3cHevs7YRZwrSH1qvC4c/pqNw==
X-Received: by 2002:a5d:4570:0:b0:204:34e:71cb with SMTP id
 a16-20020a5d4570000000b00204034e71cbmr8173964wrc.129.1648824092819;
        Fri, 01 Apr 2022 07:41:32 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b00203ff46f802sm3144144wrn.36.2022.04.01.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:41:32 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/4] arm-bsp/corstone500: add kas, runfvp and wks
Date: Fri,  1 Apr 2022 15:41:24 +0100
Message-Id: <20220401144128.3517236-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Apr 2022 14:41:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3225

Now that we have wic_nopt and ci noop for testimage classes,
we can add wks and kas/ci configurations for corstone500.

Also add the FVP settings to use the runfvp script and
infrastucture and update the documentation to build (with
kas), and run (with runfvp)

Cheers,
   Rui

Rui Miguel Silva (4):
  arm-bsp/corstone500: add image and container file
  arm-bsp/corstone500: add wks container for image
  kas/ci: add corstone500 platform
  arm-bsp/corstone500/docs: update for kas and runfvp

 .gitlab-ci.yml                                |  5 ++
 ci/corstone500.yml                            | 12 +++++
 kas/corstone500.yml                           | 47 +++++++++++++++++++
 meta-arm-bsp/conf/machine/corstone500.conf    | 22 ++++++++-
 meta-arm-bsp/documentation/corstone500.md     | 28 ++++++-----
 .../wic/core-image-minimal.corstone500.wks    | 12 +++++
 6 files changed, 112 insertions(+), 14 deletions(-)
 create mode 100644 kas/corstone500.yml
 create mode 100644 meta-arm-bsp/wic/core-image-minimal.corstone500.wks

-- 
2.35.1


