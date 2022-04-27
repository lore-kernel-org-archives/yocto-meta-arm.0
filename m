Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8DAC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:48:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.3861.1651103324271405395
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=pWrq4URB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id 126so1534864qkm.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 16:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ItaP6CQw0sC1fudkkRTXVg2g33PtkCqx7+ck39BU4BI=;
        b=pWrq4URBHvFCAm3OJn7c1GDj/BrJAS1Kw0YzNDmSZfxNEj479ICfrgczdYdetBZTaH
         VGE7TBTghCfW1mYSb1A4jJGVpnvIhroLOiAFBNF4+OoRogfvefh74fpNJZCgpb1NqWZA
         ipSdOjw5IVvSHxHxZARMcXCME5XbqGT/Mh+Zt3nUjBIDbRc7wPLU7JisCLPF1eoyJRND
         R3zepH6IBrIdllKqWv9TwLXDntNsVzeBi3CdKpqffmL/Fyz/1nyw0BQRVpIOK88AtDmg
         bVTVokxXYLvP/ljz+glPnDx0QapGDqgN0msXcsz7rW2KZJknBNLrDWNt9HbpTjrnkpRK
         awXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ItaP6CQw0sC1fudkkRTXVg2g33PtkCqx7+ck39BU4BI=;
        b=maZmUqkPz9I2VVwcRX4aW7UjsN6eboXz2xj2BAu4ksqeBxG2w5wgKjaCfiRLyV1m9s
         b8umfxwbRnGFXueH/iL2axp9CK6iIMdAOTFuMMTs/u1Vsk+kfG9Y5sCtrWVnBEXlxd/5
         ejlNMyJqWqNMtdEHU/iwBEoTnZJniSlLJm5DLaOzLgiXBlU+FQX43TtGmH3xZhbEhmur
         JL7kKkumaT3cvuWQkgrFCJ61ktf/qlo+QdWeOKGTo84a40/bO2Qm4gltyhVi/Barm6xm
         yxzExo3ISw11y/l7B+Bi6/2tM/AQiPCNla/0fFRKEnpxMdwGeH8V6wlGRovJJyRn/On/
         1PjA==
X-Gm-Message-State: AOAM5315VRlo6y3kMJDehH5NJIcYPsEXRAr2ix/1t5NTdHenTcIEsWyY
	KBkaV+/Isaw/ZRJHXhnhuiRG7tBKY+H0mg==
X-Google-Smtp-Source: 
 ABdhPJyhwf42xBcnqslsVdkVS32Oy4A7R5X3mDm/RTk8LmUPG6gpeViki2Bag5iCNYOTyw3iMk6+/g==
X-Received: by 2002:a05:620a:8ce:b0:69f:86e9:3c2a with SMTP id
 z14-20020a05620a08ce00b0069f86e93c2amr5363649qkz.78.1651103323354;
        Wed, 27 Apr 2022 16:48:43 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 x190-20020a37aec7000000b0069f9c415a0asm778924qke.11.2022.04.27.16.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 16:48:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-services:corstone1000:add sysroot
Date: Wed, 27 Apr 2022 19:48:34 -0400
Message-Id: <165110331935.2615227.4173169015036007435.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426102125.8855-1-emekcan.aras@arm.com>
References: <20220426102125.8855-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Apr 2022 23:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3316

On Tue, 26 Apr 2022 11:21:24 +0100, emekcan.aras@arm.com wrote:
> ffa-debugfs-mod provides arm_ffa_user.h needed by psa-arch-tests
> source-code.
> 
> This commit sets the sysroot task dependencies.
> 
> Signed-off by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-services: corstone1000: add sysroot tasks dependency
      commit: 4348abbf38f46bafded2954cd1eee4c9ec395f5e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

