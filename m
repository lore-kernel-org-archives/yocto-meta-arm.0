Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475E8C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 03:22:11 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.6695.1714447330577928854
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 20:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=wnYHLsrf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-79100a90868so86683385a.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 20:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714447329; x=1715052129; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uigNaAT+hHl3vmvmbMxnvhcifXHfk3rtJBwab79THas=;
        b=wnYHLsrf0qTRGPtzZJT4K/jQNw2PqPjLk1aFAYIs70x95Fn6LgV+o1USNM6VmfOFr4
         rG0wwZVPzapgpNqhp4NAiSEYLANqWg+K1WC2UYSY3WKE3hfCnkzREdwDENNjtkM3zui+
         B56PnuCY8O/2ux6h3wG+WUa3CvYWh7FZRUhiLKudHICJHRE6TPI7X2S97vsUdDoeB4X2
         YLxQcAsO9TYcPjD2J6zRNwTaAvf1mJubEs5mFTdrOVRDljlnA1GVsxSrF+08I76yLnlM
         fxkyL4M2QeYu0pfgIRMC7Ad7zGnRinn6opV65CKBrlrrqi/vEYM8zDQajVyPOp/Agmph
         yPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447329; x=1715052129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uigNaAT+hHl3vmvmbMxnvhcifXHfk3rtJBwab79THas=;
        b=VMBTRJ2NuNi91bnsH2CkKeuojPVewpQcAVD89LLXqsQil64nt0qrNfrlwcC/bKjC5E
         5CjjYInsRYU2znMc//X6pB7FNlv5fkwqWmSDhd3v79G1bYb3C7ELDBAsRYTtqrZcfg+w
         tBpB5KP2HAmwvddIMLUYi7ey9u2hNKs3qUdZmCmvIkfFvplQC9C727oyEnalmRFS33UP
         ZOnPAb6VxVw/Xbi8/XESsTYKnmgj//E+w8UXAMwTkBDzyb+SMmwEbRYPDHuSDmyjn+tT
         Zias84+RX22S9TqGZ8OfB8x9+ZQbtVbdWeUhH1iwGfu2T5Hl5l5WTtxTsTz7+OhCLUYo
         hJ+g==
X-Gm-Message-State: AOJu0Ywx7VLZRFrdEneP6NavDjwpf+adbSRPyYPgVpCLAeRjR6fLsUVk
	NqTVQJNlOcZOIcEUrkaPkv4/ZCHAIoMZwdZ8KO8+oCqWbpQhre2E/n1SU5CjrKO0n/vSxRPD0Vs
	=
X-Google-Smtp-Source: AGHT+IGohGR6BgWvM9Tc2JpBi8bbTvV+WE9EkGEJFaBfMJpNAUyA/9xPiLGsPtHZYShT1oDWynzSYQ==
X-Received: by 2002:a05:620a:5224:b0:790:83af:9897 with SMTP id dc36-20020a05620a522400b0079083af9897mr12479349qkb.9.1714447329413;
        Mon, 29 Apr 2024 20:22:09 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id w14-20020a05620a148e00b0078d6b42ca02sm11094178qkj.120.2024.04.29.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 20:22:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/u-boot: add optimised timer implementation for fvp-base
Date: Mon, 29 Apr 2024 23:21:06 -0400
Message-Id: <171444726768.3765152.3959216778989764703.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429120404.3941386-1-ross.burton@arm.com>
References: <20240429120404.3941386-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 03:22:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5635


On Mon, 29 Apr 2024 12:04:04 +0000, Ross Burton wrote:
> Due to how the timer in u-boot is implemented, it's quite possible for
> a two second timeout in the u-boot login to actually take over 15s to
> expire.
> 
> Take a patch from the mailing list to implement this differently so the
> timer runs in an accurate amount of time.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/u-boot: add optimised timer implementation for fvp-base
      commit: 0f955984ec1df801714bd0e3810e49aff728ed82

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

