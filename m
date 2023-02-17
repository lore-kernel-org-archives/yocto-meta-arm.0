Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299EAC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:21 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.258.1676608280292134465
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=rYf7uvEa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id b21so4318278qtr.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2y7lDJ0/AVHFlE9R+Ht1PEjqsL/+ibnTu+1nq8rJOuA=;
        b=rYf7uvEaAR74d/VBtz8IY0XwZzI+gFw0bh19rFkQzyuyyhwuhNSVB7kCxzUkpGOexR
         dBWYX82MVXQl8waMQ+JWojZPwKVnol9aIAIRZ6gbUaMJR9z71rywP/NAPNKUZCx4T6Pi
         kPDJ/ZLNvv9PYn4r3aXOWUwF6fN9gtp8bShZqPGJpY3+TBDZ+L97teElEaRBjU+LIfx5
         TdHsffQV2SbWu4ZTKn0xI7TtbIiqJ5am+UMiti+6TQAKADcAb0GQfpyJIcrzMiubohZX
         G7qWTxoUdFhSWvgsO2QDV9JIbFfg7xj8Oj6oURicG+EYxNzzkBH+dStVo+MJvbuMJwaX
         3iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y7lDJ0/AVHFlE9R+Ht1PEjqsL/+ibnTu+1nq8rJOuA=;
        b=dume44K4YJef2pDkXGFcYkqapq+n/UO6Dgslj3+QTJ3b/mwZdYXaNq8aIgu0wZ0kjD
         3qa/KQ20YVKX1jYFYblkFECDox14huI3PKElWuzaghRLyMk09ScTwTsD87DZMtcdTu1c
         4y0zJfFyp+yedkFM2x6undTcn6cD3+S1D4dn6foLYT1dSwh/8YEwVhzctkVOIeIDthFC
         VhItKp0yk89MX+oIOX1jifJKjRKDjFKEcG0pTqn70xw8X4CyeKCMBQUxguM2RXplrsPf
         uFle3wjnXJHYvNwUmKuZ/BpheVnFuq/wvOeO5UIB0mrJPERHDjeP9YOTReeDJ1M/f91u
         LPOw==
X-Gm-Message-State: AO0yUKUzRMOdEsdSyBZRAtwOvyE/pq3n/hl8sPJr/sZOQNR4O2ox3qsn
	RmR9AX88Q5/xSm7fl1du4MurgZQVXjA/Pnin
X-Google-Smtp-Source: AK7set//McrUScMFXuArFzf932c6XtPVefS1CO/pb92Fy+l9KnVWCT3nC2s1c6HiNKj8boTAuZdhUQ==
X-Received: by 2002:ac8:5891:0:b0:3ba:1d8d:f6eb with SMTP id t17-20020ac85891000000b003ba1d8df6ebmr11829956qta.58.1676608278880;
        Thu, 16 Feb 2023 20:31:18 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id z143-20020a376595000000b0073ba211e765sm1635214qkb.19.2023.02.16.20.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:18 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/1] arm-bsp/uefi_capsule: Use json file to pass capsule config
Date: Thu, 16 Feb 2023 23:30:52 -0500
Message-Id: <167660825903.685488.3050557204598267801.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215193706.2341-1-gowtham.sureshkumar@arm.com>
References: <20230215193706.2341-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4415

On Wed, 15 Feb 2023 19:37:06 +0000, gowtham.sureshkumar@arm.com wrote:
> This patch uses the json config file for UEFI capsule generation
> as this is efficient and easily scalable to generate multiple
> capsules.

Applied, thanks!

[1/1] arm-bsp/uefi_capsule: Use json file to pass capsule config
      commit: ac39c6d4cc9390e002c7be6cd7080214c144349a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

