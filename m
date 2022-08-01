Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B97C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 18:02:45 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.683.1659376961534534057
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 11:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ZinPvlIs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id b25so8972416qka.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 11:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jefo5B7MPCQCdByHE1Vbc6an3ZsIg8T+o6cVcCTmEI8=;
        b=ZinPvlIs8mg4cVtqNDDF7lStZxS8Dl+g0wfB04AorTELHGXI1+66S9pTQHU0Iiu6Ad
         F9eU4p3gEC31q2/cPm/FgI/FMvYTISNTDeqM8ewZ1aX/ELUz3aTAo8Mllhk7gbW3faOp
         yRcLRjS8lq2W0D+7QjWd9dGIxi88yxat0IZIYo1qpbOw4C+lHr1do7F45tumflVIfNr9
         uTTl1bxCkralR6eL/c5fu2T2I8PJ7Ydk8xvMtq0jFALVpCmjC5CYhHGC2Hc5rmKjZ0HE
         takyHzXDvG95BfxVj5R4w0dyRAlpX484cYen/J2v6v81JJpM4OQhlPlvxwJ6BzEc72qo
         cJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jefo5B7MPCQCdByHE1Vbc6an3ZsIg8T+o6cVcCTmEI8=;
        b=080KFqi2XivGql6t92AofGqAR5WJ9Wap8EBU1E3s1+mM/GntIhyxiO3GBhe4gl3+S3
         MVfZn7m8y9AJfHyY/pROUh8ZtprMFCnQENjjJ/SYWmAlnOPJBcTyv4Y7gLUkGvJmnnlE
         ZtwtHoxR935xmep2MMFdfN9o8NCp59D/Z2glH2SBhfSoxIA8lspBMZutuJSaddsP/PL4
         V/KVLHeMATZ1UT2ZPofXXuMJJ9W3yQLxPJ7SHXtLV6uyd91n04/Mpo3iY6BzI5yKiDgr
         +UX8pmp4/jtMaqABsMsDMdCGtw8xKQV5YNJz1e4JlVDhwd/ddFetpNeHlZIcwUN9nKCT
         zbzw==
X-Gm-Message-State: AJIora+N6HIhyJrI8lDXXMdXjl7wb0LRfxZHJNPOPA+wjM8hi9xlc1ip
	/KSHquZp8KHcC7ZmGG4fm3OqDcOIseFwEg==
X-Google-Smtp-Source: 
 AGRyM1uxXm2nVaomulJtWjMwy7zDigA7OBNW1baQtsXMhKR1EaKJy/9d0akBZtBlleX3/4ygXwmp7Q==
X-Received: by 2002:a05:620a:40c2:b0:6b5:e454:8315 with SMTP id
 g2-20020a05620a40c200b006b5e4548315mr12919571qko.639.1659376960139;
        Mon, 01 Aug 2022 11:02:40 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006b5e50057basm9024093qkp.95.2022.08.01.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 11:02:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Qi Feng <qi.feng@arm.com>
Cc: nd@arm.com,
	robbie.cao@arm.com,
	Peter.Hoyes@arm.com,
	Diego.Sueiro@arm.com
Subject: Re: [PATCH] arm-bsp/fvp-baser-aemv8r64: Rebase u-boot patches onto
 v2022.07
Date: Mon,  1 Aug 2022 14:02:27 -0400
Message-Id: <165937694878.869812.1120767145594659585.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220801081839.3652130-1-qi.feng@arm.com>
References: <20220801081839.3652130-1-qi.feng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Aug 2022 18:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3633

On Mon, 1 Aug 2022 16:18:39 +0800, Qi Feng wrote:
> - 0001-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch
> 
>   Change to 0002-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch.
>   Only MPU memory map is preserved, other parts have been upstreamed.
> 
> - 0007-vexpress64-Configure-memory-using-device-tree.patch
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/fvp-baser-aemv8r64: Rebase u-boot patches onto v2022.07
      commit: bac180f7a8b202ae5f8238e6430cb5ddec5d1338

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

